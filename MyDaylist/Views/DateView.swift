import SwiftUI

struct DateView: View {
    let date: Date
    
    private var year: String {
        date.formatted(Date.FormatStyle()
            .year())
    }
    
    private var weekday: String {
        date.formatted(Date.FormatStyle()
            .weekday(.abbreviated))
    }
    
    private var month: String {
        date.formatted(Date.FormatStyle()
            .month(.abbreviated))
    }
    
    private var day: String {
        date.formatted(Date.FormatStyle()
            .day())
    }
    
    var body: some View {
        HStack {
            Text("\(day) \(month) \(year)")
        }
        .font(.subheadline)
    }
}

#Preview{
    DateView(date: Date())
}
