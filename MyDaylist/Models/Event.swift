import SwiftUI
import SwiftData

@Model
class Event: Identifiable, Hashable {
    let id = UUID()
    var eventDate: Date
    var eventTitle = ""
    var iconName: String
    var colorHex: String
    
    // If no event date supplied, then use today as default.
    init(eventDate: Date = Date(), eventTitle: String = "", iconName: String = "star", colorHex: String = "#346beb") {
        self.eventDate = eventDate
        self.eventTitle = eventTitle
        self.iconName = iconName
        self.colorHex = colorHex
    }
}
