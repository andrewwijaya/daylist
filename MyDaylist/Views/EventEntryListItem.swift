import SwiftUI

struct EventEntryListItem: View {
    let eventEntry: EventEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            DateView(date: eventEntry.createdDate)
            Text("\(eventEntry.text)")
                .lineLimit(2)
        }
    }
}

