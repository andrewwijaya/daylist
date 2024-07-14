import SwiftUI
import SwiftData

@main
struct MyDaylistApp: App {
    var body: some Scene {
        WindowGroup {
            DaylistTabView()
        }
        .modelContainer(for: [Event.self, Category.self])
    }
}
