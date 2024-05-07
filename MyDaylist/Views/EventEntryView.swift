import SwiftUI

struct EventEntryView: View {
    let eventEntry: EventEntry
    
    private var title: String {
        eventEntry.createdDate.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .month(.abbreviated)
            .day()
            .year())
    }
    
    var body: some View {
        ScrollView {
            Text(eventEntry.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        #if os(iOS)
        .navigationTitle(title)
        #elseif os(macOS)
        .navigationSubtitle(title)
        #endif
    }
}
