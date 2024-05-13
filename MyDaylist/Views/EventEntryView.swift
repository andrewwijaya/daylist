import SwiftUI

struct EventEntryView: View {
    let eventEntry: EventEntry
    
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
        .navigationTitle(eventEntry.text)
    }
}
