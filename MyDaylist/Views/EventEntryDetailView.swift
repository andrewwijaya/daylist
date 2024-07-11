import SwiftUI
import SwiftData

struct EventEntryDetailView: View {
    let eventEntry: Event
    
    @State private var isShowingUpdateView = false
    
    private var formattedEventDate: String {
        eventEntry.eventDate.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .month(.abbreviated)
            .day()
            .year())
    }
    
    var body: some View {
        VStack {
            Circle()
                .foregroundStyle(.primary.opacity(0.15))
                .frame(width: 100, height: 100)
                .overlay {
                    Image(systemName: eventEntry.iconName).resizable().frame(width: 50, height: 50)
                }
                .padding(.top, 50)
            Text(eventEntry.eventTitle)
                .font(.title)
                .padding(.top, 25)
            Text(formattedEventDate)
                .font(.title3)
            
            Rectangle()
                .frame(width: 300, height: 150)
                .foregroundStyle(.primary.opacity(0.2))
                .clipShape(.rect(cornerRadius: 30))
                .overlay {
                    VStack {
                        Spacer()
                        Text("Notes")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(eventEntry.eventNotes)
                        Spacer()
                        Spacer()
                    }
                }
            Button(role: .destructive) {
                isShowingUpdateView = true
            } label: {
                Text("Edit Event")
            }
            .buttonStyle(.bordered)
            .background(.primary.opacity(0.2))
            .clipShape(.capsule)
            .sheet(isPresented: $isShowingUpdateView) {
                UpdateEventSheetView(event: eventEntry)
            }
        }
        .frame(width: 400, height: 500)
        .background(Color(hex: eventEntry.colorHex))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.bottom, 100)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)
    return EventEntryDetailView(eventEntry: Event.sampleEvent()).modelContainer(container)
}
