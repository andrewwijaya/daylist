import SwiftUI
import SwiftData

struct EventListView: View {
    
    var events: [Event]
    var isFutureList: Bool
    
    @State private var isShowingAddEventSheet = false
    
    @Environment(\.modelContext) var context
    
    init(events: [Event], isFutureList: Bool) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        self.events = events
        self.isFutureList = isFutureList
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
            .sheet(isPresented: $isShowingAddEventSheet) { AddEventSheetView() }
            .toolbar {
                ToolbarItem {
                    Button("New Event") {
                        isShowingAddEventSheet = true
                    }
                    .buttonStyle(GrowingButton())                }
            }
        }
    }
}

#Preview{
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)
    var events: [Event] = []
    
    for _ in 1..<10 {
        let event = Event.sampleEvent()
        container.mainContext.insert(event)
        events.append(event)
    }
    
    return EventListView(events: events, isFutureList: true)
        .modelContainer(container)
}
