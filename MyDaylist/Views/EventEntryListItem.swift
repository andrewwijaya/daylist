import SwiftUI

struct EventEntryListItem: View {
    let eventEntry: Event
    
    var body: some View {
        HStack() {
            Image(systemName: "star")
            VStack(alignment: .leading) {
                Text("\(eventEntry.eventTitle)")
                    .lineLimit(1)
                    .font(.title3)
                    .padding(.trailing, 50.0)
                DateView(date: eventEntry.eventDate)
            }
            
            Spacer()
            
            VStack {
                Text("\(daysBetween(Date(), eventEntry.eventDate))")
                    .font(.headline)
                Text("days to go")
                    .font(.subheadline)
            }
        }
        .frame(width: 330)
    }
    
    func daysBetween(_ startDate: Date, _ endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        
        guard let days = components.day else { return 0 }
        return abs(days)
    }
}

#Preview {
    EventEntryListItem(eventEntry: Event(eventDate: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15)) ?? Date(), text: "Andrew's Birthday"))
}
