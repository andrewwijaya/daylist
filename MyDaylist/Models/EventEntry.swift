import SwiftUI

struct EventEntry: Identifiable, Hashable {
    let id = UUID()
    let eventDate: Date
    var text = ""
    
    // If no event date supplied, then use today as default.
    init(eventDate: Date = Date(), text: String = "") {
        self.eventDate = eventDate
        self.text = text
    }
}
