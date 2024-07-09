import SwiftUI
import SwiftData

struct EventEntryView: View {
    let eventEntry: Event
    
    private var title: String {
        eventEntry.eventDate.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .month(.abbreviated)
            .day()
            .year())
    }
    
    var body: some View {
        ScrollView {
            Text(title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .navigationTitle(eventEntry.eventTitle)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)
    return EventEntryView(eventEntry: Event.sampleEvent()).modelContainer(container)
}
