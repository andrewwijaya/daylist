import SwiftUI
import SwiftData

struct ContentView: View {
    
    var events: [Event]
    var isFutureList: Bool
    
    @Environment(\.modelContext) var context
    
    init(events: [Event], isFutureList: Bool) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        self.events = events
        self.isFutureList = isFutureList
    }
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(events) { event in
                    NavigationLink(value: event) {
                        EventEntryListItem(eventEntry: event, toGoText: isFutureList ? "days to go" : "days ago")
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color(hex: event.colorHex))
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(events[index])
                    }
                })
            }
            .background(Color(.brandPrimary))
            .scrollContentBackground(.hidden)
            // TODO: there is a warning here "Do not put a navigation destination modifier inside a "lazy” container"
            .navigationDestination(for: Event.self) { entry in
                EventEntryDetailView(eventEntry: entry)
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
    
    return ContentView(events: events, isFutureList: true)
        .modelContainer(container)
}
