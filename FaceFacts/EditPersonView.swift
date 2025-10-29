//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Cường Nguyễn Bá on 29/10/25.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var person: Person
    @Binding var navigationPath: NavigationPath
        
    @Query(sort: [
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]
    
    var body: some View {
        Form {
            Section("Information") {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                TextField("Email Address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Section("Where did you meet?") {
                Picker("Met at", selection: $person.metAt) {
                    Text("Unknown event")
                        .tag(Optional<Event>.none)
                    ForEach(events) { event in
                        Text(event.name)
                            .tag(Optional(event))
                    }
                }
                Button("Add new event", action: addEvent)
                List {
                    ForEach(events) { event in
                        Text(event.name)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let event = events[index]
                            deleteEvent(event)
                        }
                    }
                }
            }
            
            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Event.self) { event in
                EditEventView(event: event)
        }
    }
    
    func addEvent() {
        let event = Event(name: "", location: "")
        modelContext.insert(event)
        navigationPath.append(event)
    }
    
    func deleteEvent(_ event: Event) {
        if person.metAt == event {
            person.metAt = nil
        }
        modelContext.delete(event)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return EditPersonView(person: previewer.person, navigationPath: .constant(NavigationPath()))
            .modelContainer(previewer.container)
    }catch {
        return Text("Failed to load preview: \(error.localizedDescription)")
    }
}
