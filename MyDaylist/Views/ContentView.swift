import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    @StateObject private var eventList = EventList()
    @State private var isShowingAddEventSheet = false
    @Query(sort: \Event.eventDate) var events: [Event] = []

    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.brandPrimary).ignoresSafeArea(.all)
                VStack {
                    List(events) { entry in
                        NavigationLink(value: entry) {
                            EventEntryListItem(eventEntry: entry)
                        }
                        .listStyle(.plain)
                        .listRowBackground(Color(.brandSecondary))
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
        .sheet(isPresented: $isShowingAddEventSheet) { AddEventSheet() }
        
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
    ContentView()
}

struct AddEventSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var eventTitle: String = ""
    @State private var eventDate: Date = .now
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Event Name", text: $eventTitle)
                DatePicker("Event Date", selection: $eventDate, displayedComponents: .date)
            }
            .navigationTitle("New Event")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                                 
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let event = Event(eventDate: eventDate, text: eventTitle)
                        context.insert(event)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct UpdateEventSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var event: Event
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Event Name", text: $event.eventTitle)
                DatePicker("Date", selection: $event.eventDate, displayedComponents: .date)
            }
            .navigationTitle("Update Event")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

