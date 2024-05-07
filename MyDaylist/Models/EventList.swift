import SwiftUI

class EventList: ObservableObject {
    @Published var entries: [EventEntry] = [
        EventEntry(
            createdDate: today(minus: 2),
            text: "Taylor Swift concert"),
        EventEntry(
            createdDate: today(minus: 5),
            text: "Birthday"),
    ]
    
    func addSampleEntry() {
        let entry = EventEntry(
            createdDate: Date(),
            text: "This is a new event entry.")
        entries.append(entry)
    }

    private static func today(minus days: Int) -> Date {
        let dateComponents = DateComponents(day: -days)
        return Calendar.current.date(byAdding: dateComponents, to: Date()) ?? Date()
    }
}
