import SwiftUI

struct DateView: View {
    let date: Date
    
    private var year: String {
        date.formatted(Date.FormatStyle()
            .year()).localizedUppercase
    }
    
    private var weekday: String {
        date.formatted(Date.FormatStyle()
            .weekday(.abbreviated)).localizedUppercase
    }
    
    private var month: String {
        date.formatted(Date.FormatStyle()
            .month(.abbreviated)).localizedUppercase
    }
    
    private var day: String {
        date.formatted(Date.FormatStyle()
            .day())
    }
    
    var body: some View {
        HStack {
//            Text("\(weekday)")
//                .font(.headline)
            Text("\(day)")
                .font(.headline)
            Text("\(month)")
                .font(.headline)
            Text("\(year)")
                .font(.headline)
        }
    }
}

#Preview{
    DateView(date: Date())
}
