import SwiftUI
import SwiftData

struct EventEntryListItem: View {
    let eventEntry: Event
    var toGoText: String
    
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
                Text("\(daysBetween(eventEntry.eventDate))")
                    .font(.headline)
                Text(toGoText)
                    .font(.subheadline)
            }
        }
        .frame(width: 330)
    }
    
    // TODO there a bug here, it is off by 1 day.
    func daysBetween(_ endDate: Date) -> Int {
        let today = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: today, to: endDate)
        return abs(components.day ?? 0)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)

    for i in 1..<10 {
        let event = Event(eventDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, eventTitle: "Example Event \(i)")
        container.mainContext.insert(event)
    }
    var previewEvent = Event(eventDate: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15)) ?? Date(), eventTitle: "Andrew's Birthday")
    return EventEntryListItem(eventEntry: previewEvent, toGoText: "days ago")
        .modelContainer(container)
}
