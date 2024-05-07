import SwiftUI

struct ContentView: View {
    @StateObject private var event = Event()
    
    var body: some View {
        NavigationStack {
            List(event.entries) { entry in
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
                        event.addSampleEntry()
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
