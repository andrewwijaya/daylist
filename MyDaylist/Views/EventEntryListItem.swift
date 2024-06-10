import SwiftUI
import SwiftData

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
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)

    for i in 1..<10 {
        let event = Event(eventDate: Date(), eventTitle: "Example Event \(i)")
        container.mainContext.insert(event)
    }
    return EventEntryListItem(eventEntry: Event(eventDate: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15)) ?? Date(), eventTitle: "Andrew's Birthday"))
        .modelContainer(container)
}
