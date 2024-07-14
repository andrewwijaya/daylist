import SwiftUI
import SwiftData

struct UpdateEventSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var event: Event
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Event Name", text: $event.eventTitle)
                DatePicker("Date", selection: $event.eventDate)
            }
            .navigationTitle("Update Event")
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
    // TODO: Why do we need to do this?
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Event.self, configurations: config)
    return UpdateEventSheetView(event: Event.sampleEvent()).modelContainer(container)
}
