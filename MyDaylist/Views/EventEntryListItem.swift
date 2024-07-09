import SwiftUI
import SwiftData

struct EventEntryListItem: View {
    let eventEntry: Event
    var toGoText: String
    
    var body: some View {
        HStack() {
            Image(systemName: eventEntry.iconName)
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
    
    func daysBetween(_ endDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: Date(), to: endDate)
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
    return EventEntryListItem(eventEntry: Event.sampleEvent(), toGoText: "days ago")
        .modelContainer(container)
}
