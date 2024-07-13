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
    @State private var isShowingAddEventSheet = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("MyDaylist")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(LinearGradient(colors: [.green, .brandPrimaryPair], startPoint: .leading, endPoint: .trailing))
                TabView {
                    let futureEvents = events.filter { $0.eventDate >= Date() }
                    ContentView(events: futureEvents, isFutureList: true)
                        .tabItem { Label("Future Events", systemImage: "calendar") }
                    let pastEvents = events.filter { $0.eventDate < Date() }
                    // Reverse the pastEvents variable because it is sorted based on the date not on days remaining.
                    ContentView(events: pastEvents.reversed(), isFutureList: false)
                        .tabItem { Label("Past Events", systemImage: "calendar.badge.checkmark") }
                }
                .sheet(isPresented: $isShowingAddEventSheet) { AddEventSheetView() }
                .toolbar {
                    ToolbarItem {
                        Button {
                            isShowingAddEventSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .background(Color(.brandPrimary))
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)

    for _ in 1..<10 {
        let event = Event.sampleEvent()
        container.mainContext.insert(event)
    }
    return DaylistTabView()
        .modelContainer(container)
}
