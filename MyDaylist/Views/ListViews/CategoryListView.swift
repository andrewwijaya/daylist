//
//  CategoryListView.swift
//  MyDaylist
//
//  Created by Andrew Wijaya on 14/07/2024.
//

import SwiftData
import SwiftUI

struct CategoryListView: View {
    
    var categories: [Category]
    @State private var isShowingAddCategorySheet = false
    
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            List() {
                ForEach(categories) { category in
                    NavigationLink(value: category) {
                        CategoryListItem(category: category)
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color(hex: category.colorHex))
                    .swipeActions() {
                        Button(role: .destructive) {
                            context.delete(category)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .background(Color(.brandPrimary))
            .scrollContentBackground(.hidden)
            // TODO: there is a warning here "Do not put a navigation destination modifier inside a "lazy” container"
            .navigationDestination(for: Category.self) { category in
                ZStack {
                    Color(.brandPrimary)
                        .ignoresSafeArea()
                    CategoryDetailView(category: category)
                }
            }
            .toolbar {
                Button("New Category") {
                    isShowingAddCategorySheet = true
                }
                .buttonStyle(GrowingButton())
            }
            .sheet(isPresented: $isShowingAddCategorySheet) { AddCategorySheetView() }
        }
    }
}

#Preview{
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Category.self, configurations: config)
    var categories: [Category] = []
    
    for _ in 1..<10 {
        let category = Category.sampleCategory()
        container.mainContext.insert(category)
        categories.append(category)
    }
    
    return CategoryListView(categories: categories)
        .modelContainer(container)
}
