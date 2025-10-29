//
//  EditEventView.swift
//  FaceFacts
//
//  Created by Cường Nguyễn Bá on 29/10/25.
//

import SwiftUI
import SwiftData

struct EditEventView: View {
    @Bindable var event: Event
    
    var body: some View {
        Form {
            TextField("Name of event", text: $event.name)
            TextField("Location", text: $event.location)
        }
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        return EditEventView(event: previewer.event)
            .modelContainer(previewer.container)
    }catch {
        return Text("Failed to load preview: \(error.localizedDescription)")
    }
}
