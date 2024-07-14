import SwiftUI

class Samples {
    var sampleEvents: [Event] = [
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
    
    var sampleCategories: [Category] = [
        Category(categoryName: "Bills", iconName: "dollarsign.circle", colorHex: Color.red.toHex()!),
        Category(categoryName: "Birthdays", iconName: "birthday.cake", colorHex: Color.yellow.toHex()!),
        Category(categoryName: "Movie Release", iconName: "popcorn", colorHex: Color.pink.toHex()!),
        Category(categoryName: "Game Release", iconName: "gamecontroller", colorHex: Color.purple.toHex()!),
        Category(categoryName: "Pay Day", iconName: "dollarsign.arrow.circlepath", colorHex: Color.blue.toHex()!)

    ]
    
    private static func today(minus days: Int) -> Date {
        let dateComponents = DateComponents(day: -days)
        return Calendar.current.date(byAdding: dateComponents, to: Date()) ?? Date()
    }
}
