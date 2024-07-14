import SwiftUI
import SwiftData

struct EventEntryDetailView: View {
    let eventEntry: Event
    @State private var currentDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isShowingUpdateView = false
    @State private var liveTime: Date = Date()
    @State private var timeLeftComponents: DateComponents = DateComponents()
    
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
                .padding()
            Text(eventEntry.eventTitle)
                .font(.title)
                .padding(.top, 25)
            Text(formattedEventDate)
                .font(.title3)
                .padding(.bottom, 10)
            Text("Category: " + eventEntry.category)
            Text("Time left:")
                .font(.headline)
            HStack {
                VStack {
                    Text("Days")
                    Text(String(timeLeftComponents.day ?? 0))
                }
                VStack {
                    Text("Hour")
                    Text(String(timeLeftComponents.hour ?? 0))
                }
                VStack {
                    Text("Mins")
                    Text(String(timeLeftComponents.minute ?? 0))
                }
                VStack {
                    Text("Secs")
                    Text(String(timeLeftComponents.second ?? 0))
                }
            }
            
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
        .frame(width: 400, height: 550)
        .background(Color(hex: eventEntry.colorHex))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.bottom, 100)
        .onReceive(timer) { time in
            liveTime = Date()
            timeLeftComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: liveTime, to: eventEntry.eventDate)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)
    return EventEntryDetailView(eventEntry: Event.sampleEvent()).modelContainer(container)
}
