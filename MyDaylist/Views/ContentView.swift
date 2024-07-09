import SwiftUI
import SwiftData

struct ContentView: View {
    
    var events: [Event]
    var isFutureList: Bool
    
    @Environment(\.modelContext) var context
    @State private var isShowingAddEventSheet = false
    @State private var eventToEdit: Event?
    
    init(events: [Event], isFutureList: Bool) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        self.events = events
        self.isFutureList = isFutureList
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.brandPrimary).ignoresSafeArea(.all)
                VStack {
                    List() {
                        ForEach(events) { event in
                            NavigationLink(value: event) {
                                EventEntryListItem(eventEntry: event, toGoText: isFutureList ? "days to go" : "days ago")
                                    .onTapGesture {
                                        eventToEdit = event
                                    }
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
                    .navigationDestination(for: Event.self) { entry in
                        EventEntryView(eventEntry: entry)
                    }
                    .navigationTitle("Daylist")
                    .toolbar {
                        ToolbarItem {
                            Button {
                                isShowingAddEventSheet = true
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
        .sheet(isPresented: $isShowingAddEventSheet) { AddEventSheetView() }
        .sheet(item: $eventToEdit) { event in
            UpdateEventSheetView(event: event)
        }
        // TODO: what's going on with this toolbar? It is not visible.
        .toolbar {
            if !events.isEmpty {
                Button("Add Event", systemImage: "plus") {
                    isShowingAddEventSheet = true
                }
            }
        }
    }
}

#Preview{
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)
    var events: [Event] = []
    
    for i in 1..<10 {
        let event = Event(eventDate: Date(), eventTitle: "Example Event \(i)")
        container.mainContext.insert(event)
        events.append(event)
    }

    return ContentView(events: events, isFutureList: true)
        .modelContainer(container)
}
