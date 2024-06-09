import SwiftUI

class EventList: ObservableObject {
    @Published var entries: [Event] = [
        Event(
            eventDate: today(minus: -10),
            eventTitle: "Taylor Swift concert"),
        Event(
            eventDate: today(minus: -2),
            eventTitle: "My Birthday"),
        Event(
            eventDate: today(minus: -20),
            eventTitle: "Some very interesting movie"),
        Event(
            eventDate: today(minus: -25),
            eventTitle: "Park run"),
        Event(
            eventDate: today(minus: -100),
            eventTitle: "Pilates day"),
        Event(
            eventDate: today(minus: -150),
            eventTitle: "Pancake day")
    ]
    
    func addSampleEntry() {
        let entry = Event(
            eventDate: Date(),
            eventTitle: "This is a new event entry.")
        entries.append(entry)
    }

    private static func today(minus days: Int) -> Date {
        let dateComponents = DateComponents(day: -days)
        return Calendar.current.date(byAdding: dateComponents, to: Date()) ?? Date()
    }
}
