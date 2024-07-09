import SwiftUI
import SwiftData

@Model
class Event: Identifiable, Hashable {
    let id = UUID()
    var eventDate: Date
    var eventTitle = ""
    var eventNotes = ""
    var iconName: String
    var colorHex: String
    
    // If no event date supplied, then use today as default.
    init(eventDate: Date = Date(), eventTitle: String = "", iconName: String = "star", colorHex: String = "#346beb", eventNotes: String = "") {
        self.eventDate = eventDate
        self.eventTitle = eventTitle
        self.iconName = iconName
        self.colorHex = colorHex
        self.eventNotes = eventNotes
    }
    
    static func sampleEvent() -> Event {
        Event(eventDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, eventTitle: "Example Event", colorHex: "#346beb", eventNotes: "These are sample notes")
    }
}
