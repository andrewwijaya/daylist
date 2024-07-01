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
    
    // TODO there a bug here, it is off by 1 day.
    func daysBetween(_ endDate: Date) -> Int {
        let today = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: today, to: endDate)
        return abs(components.day ?? 0)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
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
