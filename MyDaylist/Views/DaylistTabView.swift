import SwiftUI
import SwiftData

struct DaylistTabView: View {
    
    @Environment(\.modelContext) var context
    @Query var categories: [Category] = []
    @Query(sort: \Event.eventDate) var events: [Event] = []
    
    var body: some View {
        VStack {
            Text("GottaThing")
                .padding(.top, 40)
                .font(.largeTitle)
                .bold()
                .italic()
                .foregroundStyle(LinearGradient(colors: [.green, .brandPrimaryPair], startPoint: .leading, endPoint: .trailing))
            TabView {
                EventListView(isFutureList: true, categories: categories)
                    .tabItem { Label("Future Events", systemImage: "calendar") }
                EventListView(isFutureList: false, categories: categories)
                    .tabItem { Label("Past Events", systemImage: "calendar.badge.checkmark") }
                CategoryListView(categories: categories)
                    .tabItem { Label("Categories", systemImage: "rectangle.3.group") }
            }
        }
        .background(Color(.brandPrimary))
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
