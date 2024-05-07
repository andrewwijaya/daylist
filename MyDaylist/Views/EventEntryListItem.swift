import SwiftUI

struct EventEntryListItem: View {
    let eventEntry: EventEntry
    
    var body: some View {
        HStack() {
            VStack(){
                Image(systemName: "star")
            }
            Text("\(eventEntry.text)")
                .lineLimit(2)
                .padding(.trailing, 50.0)
            DateView(date: eventEntry.createdDate)
        }
    }
}

#Preview {
    EventEntryListItem(eventEntry: EventEntry(text: "Some New Event"))
}
