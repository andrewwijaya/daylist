//
//  DaylistTabView.swift
//  MyDaylist
//
//  Created by Andrew Wijaya on 10/06/2024.
//

import SwiftUI
import SwiftData

struct DaylistTabView: View {
    
    @Environment(\.modelContext) var context
    @Query(sort: \Event.eventDate) var events: [Event] = []
//    let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
    var body: some View {
        
        TabView {
            var futureEvents = events.filter { $0.eventDate >= Date() }
            ContentView(events: futureEvents)
                .tabItem { Label("Events", systemImage: "calendar") }
            var pastEvents = events.filter { $0.eventDate < Date() }
            ContentView(events: pastEvents)
                .tabItem { Label("Past Events", systemImage: "calendar.badge.checkmark") }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)

    for i in 1..<10 {
        let event = Event(eventDate: Date(), eventTitle: "Example Event \(i)")
        container.mainContext.insert(event)
    }
    return DaylistTabView()
        .modelContainer(container)
}
