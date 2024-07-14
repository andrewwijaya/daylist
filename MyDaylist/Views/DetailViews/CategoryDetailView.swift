import SwiftUI
import SwiftData

struct CategoryDetailView: View {
    let category: Category
    @State private var isShowingUpdateView = false

    var body: some View {
        VStack {
            Circle()
                .foregroundStyle(.primary.opacity(0.15))
                .frame(width: 100, height: 100)
                .overlay {
                    Image(systemName: category.iconName).resizable().frame(width: 50, height: 50)
                }
                .padding()
            Text(category.categoryName)
                .font(.title)
            Button(role: .destructive) {
                isShowingUpdateView = true
            } label: {
                Text("Edit Category")
            }
            .buttonStyle(.bordered)
            .background(.primary.opacity(0.2))
            .clipShape(.capsule)
            .sheet(isPresented: $isShowingUpdateView) {
                UpdateCategorySheetView(category: category)
            }
        }
        .frame(width: 400, height: 400)
        .background(Color(hex: category.colorHex))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.bottom, 100)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Category.self, configurations: config)
    return CategoryDetailView(category: Category.sampleCategory()).modelContainer(container)
}
