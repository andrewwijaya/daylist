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
    var category: String = ""
    
    // If no event date supplied, then use today as default.
    init(eventDate: Date = Date(), eventTitle: String = "", iconName: String = "star", colorHex: String = "#346beb", eventNotes: String = "", category: String = "") {
        self.eventDate = eventDate
        self.eventTitle = eventTitle
        self.iconName = iconName
        self.colorHex = colorHex
        self.eventNotes = eventNotes
        self.category = category
    }
    
    static func sampleEvent() -> Event {
        Event(eventDate: Calendar.current.date(byAdding: .day, value: Int.random(in: -5...5), to: Date())!, eventTitle: "Example Event", colorHex: "#346beb", eventNotes: "These are sample notes", category: "Birthday")
    }
    
    func copy() -> Event {
        return Event(eventDate: self.eventDate, eventTitle: self.eventTitle, iconName: self.iconName, colorHex: self.colorHex, eventNotes: self.eventNotes, category: self.category)
    }
}
