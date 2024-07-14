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
                EventListView(events: futureEvents, isFutureList: true, categories: categories)
                    .tabItem { Label("Future Events", systemImage: "calendar") }
                let pastEvents = events.filter { $0.eventDate < Date() }
                // Reverse the pastEvents variable because it is sorted based on the date not on days remaining.
                EventListView(events: pastEvents.reversed(), isFutureList: false, categories: categories)
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

    for event in Samples.sampleEvents {
        container.mainContext.insert(event)
    }
    
    for category in Samples.sampleCategories {
        container.mainContext.insert(category)
    }
    return DaylistTabView()
        .modelContainer(container)
}
