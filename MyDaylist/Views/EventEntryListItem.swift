import SwiftUI

struct EventEntryListItem: View {
    let eventEntry: EventEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(eventEntry.text)")
                .lineLimit(2)
            DateView(date: eventEntry.createdDate)
        }
    }
}

