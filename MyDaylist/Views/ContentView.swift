import SwiftUI

struct ContentView: View {
    @StateObject private var eventList = EventList()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemMint).ignoresSafeArea(.all)
                VStack {
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
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

#Preview{
    ContentView()
}
