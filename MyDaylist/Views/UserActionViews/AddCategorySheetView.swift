//
//  AddEventSheetView.swift
//  MyDaylist
//
//  Created by Andrew Wijaya on 01/07/2024.
//

import SwiftUI
import SymbolPicker

struct AddCategorySheetView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var categoryName: String = ""
    @State private var categoryColor: Color = Color.blue
    @State private var categoryIconName: String = "star"
    @State private var isSymbolPickerShown = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Category Name", text: $categoryName)
                ColorPicker("Category Color", selection: $categoryColor)
                Button {
                    isSymbolPickerShown = true
                } label: {
                    HStack {
                        Text("Category Icon")
                        Image(systemName: categoryIconName)
                    }
                }.sheet(isPresented: $isSymbolPickerShown) {
                    SymbolPicker(symbol: $categoryIconName)
                }
            }
            .navigationTitle("New Category")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                                 
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let category = Category(categoryName: categoryName, iconName: categoryIconName, colorHex: categoryColor.toHex() ?? "#346beb")
                        context.insert(category)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddCategorySheetView()
}
