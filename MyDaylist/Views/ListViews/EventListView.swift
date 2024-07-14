import SwiftUI
import SwiftData

struct EventListView: View {

    @Environment(\.modelContext) var context
    
    var isFutureList: Bool
    var categories: [Category]
    @State private var isShowingAddEventSheet = false
    @State private var timer: Timer?
    @State private var now = Date()
    
    @Query(sort: \Event.eventDate) var events: [Event]
        
    init(isFutureList: Bool, categories: [Category]) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        self.isFutureList = isFutureList
        self.categories = categories
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.brandPrimary)
                    .ignoresSafeArea()
                List() {
                    let futureEvents = events.filter{ $0.eventDate >= now }
                    let pastEvents = events.filter{ $0.eventDate < now }
                    ForEach(isFutureList ? futureEvents : pastEvents) { event in
                        NavigationLink(value: event) {
                            EventEntryListItem(eventEntry: event, toGoText: isFutureList ? "days to go" : "days ago")
                        }
                        .listStyle(.plain)
                        .listRowBackground(Color(hex: event.colorHex))
                        .swipeActions() {
                            Button(role: .destructive) {
                                context.delete(event)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            Button() {
                                context.insert(event.copy())
                            } label: {
                                Label("Copy", systemImage: "doc.on.doc")
                            }
                            .tint(.yellow)
                        }
                    }
                }
            }
            .background(Color(.brandPrimary))
            .scrollContentBackground(.hidden)
            .navigationDestination(for: Event.self) { entry in
                ZStack {
                    Color(.brandPrimary)
                        .ignoresSafeArea()
                    EventEntryDetailView(eventEntry: entry)
                }
            }
            .sheet(isPresented: $isShowingAddEventSheet) { AddEventSheetView(categories: categories) }
            .toolbar {
                ToolbarItem {
                    Button("New Thing") {
                        isShowingAddEventSheet = true
                    }
                    .buttonStyle(GrowingButton())                }
            }
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.now = Date()
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview{
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, Category.self, configurations: config)
    
    for event in Samples.sampleEvents {
        container.mainContext.insert(event)
    }
    
    return EventListView(isFutureList: true, categories: Samples.sampleCategories)
        .modelContainer(container)
}
