import SwiftUI

class Samples {
    static var sampleEvents: [Event] = [
        Event(
            eventDate: today(minus: -10),
            eventTitle: "Taylor Swift concert",
            category: "Concerts"),
        Event(
            eventDate: today(minus: -2),
            eventTitle: "My Birthday",
            category: "Birthdays"),
        Event(
            eventDate: today(minus: -20),
            eventTitle: "Some very interesting movie",
            category: "Movies"),
        Event(
            eventDate: today(minus: -25),
            eventTitle: "Park run",
            category: "Exercise"),
        Event(
            eventDate: today(minus: -100),
            eventTitle: "Pilates day",
            category: "Exercise"),
        Event(
            eventDate: today(minus: -150),
            eventTitle: "Pancake day",
            category: "Food")
    ]
    
    static var sampleCategories: [Category] = [
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
