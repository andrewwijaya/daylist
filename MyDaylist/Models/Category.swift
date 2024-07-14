import SwiftUI
import SwiftData

@Model
class Category: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var iconName: String
    var colorHex: String
    
    // If no event date supplied, then use today as default.
    init(categoryName: String = "Default Category", iconName: String = "star", colorHex: String = "#346beb") {
        self.categoryName = categoryName
        self.iconName = iconName
        self.colorHex = colorHex
    }
    
    static func sampleCategory() -> Category {
        Category()
    }
    
    func copy() -> Category {
        return Category(categoryName: self.categoryName, iconName: self.iconName, colorHex: self.colorHex)
    }
}
