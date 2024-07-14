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
    @Query var categories: [Category] = []

    var body: some View {
        VStack {
            Text("MyDaylist")
                .padding(.top, 20)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(LinearGradient(colors: [.green, .brandPrimaryPair], startPoint: .leading, endPoint: .trailing))
            TabView {
                let futureEvents = events.filter { $0.eventDate >= Date() }
                EventListView(events: futureEvents, isFutureList: true)
                    .tabItem { Label("Future Events", systemImage: "calendar") }
                let pastEvents = events.filter { $0.eventDate < Date() }
                // Reverse the pastEvents variable because it is sorted based on the date not on days remaining.
                EventListView(events: pastEvents.reversed(), isFutureList: false)
                    .tabItem { Label("Past Events", systemImage: "calendar.badge.checkmark") }
                CategoryListView(categories: categories)
                    .tabItem { Label("Categories", systemImage: "rectangle.3.group") }
            }
        }
        .background(Color(.brandPrimary))
//        .scrollContentBackground(.hidden)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, Category.self, configurations: config)

    for _ in 1..<10 {
        let event = Event.sampleEvent()
        container.mainContext.insert(event)
        let category = Category.sampleCategory()
        container.mainContext.insert(category)
    }
    return DaylistTabView()
        .modelContainer(container)
}
