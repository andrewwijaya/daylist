import SwiftUI

struct ContentView: View {
    @StateObject private var eventList = EventList()
    
    var body: some View {
        NavigationStack {
            List(eventList.entries) { entry in
                NavigationLink(value: entry) {
                    EventEntryListItem(eventEntry: entry)
                }
            }
            .navigationDestination(for: EventEntry.self) { entry in
                EventEntryView(eventEntry: entry)
            }
            .navigationTitle("Daylist")
            .toolbar {
                ToolbarItem {
                    Button {
                        eventList.addSampleEntry()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview{
    ContentView()
}
