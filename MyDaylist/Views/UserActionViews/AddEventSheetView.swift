//
//  AddEventSheetView.swift
//  MyDaylist
//
//  Created by Andrew Wijaya on 01/07/2024.
//

import SwiftUI
import SymbolPicker

struct AddEventSheetView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var eventTitle: String = ""
    @State private var eventDate: Date = .now
    @State private var eventColor: Color = Color.blue
    @State private var eventNotes: String = ""
    @State private var eventIconName: String = "star"
    @State private var isSymbolPickerShown: Bool = false
    @State private var iconName = "pencil"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Event Name", text: $eventTitle)
                DatePicker("Event Date", selection: $eventDate)
                ColorPicker("Event Color", selection: $eventColor)
                Button {
                    isSymbolPickerShown = true
                } label: {
                    HStack {
                        Text("Event Icon")
                        Image(systemName: iconName)
                    }
                }.sheet(isPresented: $isSymbolPickerShown) {
                    SymbolPicker(symbol: $iconName)
                }
                Text("Event Notes:")
                    .listRowSeparator(.hidden)
                TextEditor(text: $eventNotes)
            }
            .navigationTitle("New Event")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                                 
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let event = Event(eventDate: eventDate, eventTitle: eventTitle, iconName: iconName, colorHex: eventColor.toHex() ?? "#346beb", eventNotes: self.eventNotes)
                        context.insert(event)
                        dismiss()
                    }
                }
            }
        }
    }
}

// UIColor extension
extension UIColor {
    func toHex() -> String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        
        let rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8 | (Int)(blue * 255) << 0
        
        return String(format: "#%06x", rgb)
    }
}

// SwiftUI Color extension
extension Color {
    func toHex() -> String? {
        // Convert SwiftUI Color to UIColor
        let uiColor = UIColor(self)
        return uiColor.toHex()
    }
}

#Preview {
    AddEventSheetView()
}
