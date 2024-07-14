//
//  UpdateEventSheetView.swift
//  MyDaylist
//
//  Created by Andrew Wijaya on 09/07/2024.
//

import SwiftUI
import SwiftData
import SymbolPicker

struct UpdateCategorySheetView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var category: Category
    @State private var isSymbolPickerShown = false
    @State private var categoryColor: Color = Color.blue
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Category Name", text: $category.categoryName)
                ColorPicker("Category Color", selection: $categoryColor)
                Button {
                    isSymbolPickerShown = true
                } label: {
                    HStack {
                        Text("Category Icon")
                        Image(systemName: category.iconName)
                    }
                }
                .sheet(isPresented: $isSymbolPickerShown) {
                    SymbolPicker(symbol: $category.iconName)
                }
            }
            .navigationTitle("Update Category")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Category.self, configurations: config)
    return UpdateCategorySheetView(category: Category.sampleCategory()).modelContainer(container)
}
