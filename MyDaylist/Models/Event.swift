import SwiftUI
import SwiftData

@Model
class Event: Identifiable, Hashable {
    let id = UUID()
    var eventDate: Date
    var eventTitle = ""
    
    // If no event date supplied, then use today as default.
    init(eventDate: Date = Date(), eventTitle: String = "") {
        self.eventDate = eventDate
        self.eventTitle = eventTitle
    }
}
