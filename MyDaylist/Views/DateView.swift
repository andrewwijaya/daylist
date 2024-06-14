import SwiftUI

struct DateView: View {
    let date: Date
    
    private var dateTime: String {
        date.formatted(date: .abbreviated, time: .shortened)
    }
    
    var body: some View {
        HStack {
            Text(dateTime)
        }
        .font(.caption)
    }
}

#Preview{
    DateView(date: Date())
}
