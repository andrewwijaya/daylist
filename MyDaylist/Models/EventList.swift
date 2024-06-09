import SwiftUI

class EventList: ObservableObject {
    @Published var entries: [Event] = [
        Event(
            eventDate: today(minus: -10),
            text: "Taylor Swift concert"),
        Event(
            eventDate: today(minus: -2),
            text: "My Birthday"),
        Event(
            eventDate: today(minus: -20),
            text: "Some very interesting movie"),
        Event(
            eventDate: today(minus: -25),
            text: "Park run"),
        Event(
            eventDate: today(minus: -100),
            text: "Pilates day"),
        Event(
            eventDate: today(minus: -150),
            text: "Pancake day")
    ]
    
    func addSampleEntry() {
        let entry = Event(
            eventDate: Date(),
            text: "This is a new event entry.")
        entries.append(entry)
    }

    private static func today(minus days: Int) -> Date {
        let dateComponents = DateComponents(day: -days)
        return Calendar.current.date(byAdding: dateComponents, to: Date()) ?? Date()
    }
}
