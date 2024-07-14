import SwiftUI
import SwiftData

struct CategoryListItem: View {
    let category: Category
    
    var body: some View {
        HStack() {
            Circle()
                .foregroundStyle(.black.opacity(0.15))
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: category.iconName)
                }
            Text(category.categoryName)
        }               
        .background(Color(hex: category.colorHex))
        // TODO: rather hacky, I can't tell where the padding at the beginning of each list item comes from?
        .padding(.leading, -8)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Category.self, configurations: config)
    return CategoryListItem(category: Category.sampleCategory())
        .modelContainer(container)
}
