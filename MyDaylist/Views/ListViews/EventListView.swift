import SwiftUI
import SwiftData

struct EventListView: View {
    
    var events: [Event]
    var isFutureList: Bool
    var categories: [Category]

    @State private var isShowingAddEventSheet = false
    
    @Environment(\.modelContext) var context
    
    init(events: [Event], isFutureList: Bool, categories: [Category]) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        self.events = events
        self.isFutureList = isFutureList
        self.categories = categories
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.brandPrimary)
                    .ignoresSafeArea()
                List() {
                    ForEach(events) { event in
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
        }
    }
}

#Preview{
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, Category.self, configurations: config)
    return EventListView(events: Samples.sampleEvents, isFutureList: true, categories: Samples.sampleCategories)
        .modelContainer(container)
}
