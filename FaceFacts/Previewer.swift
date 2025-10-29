//
//  Previewer.swift
//  FaceFacts
//
//  Created by Cường Nguyễn Bá on 29/10/25.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let person: Person
    let event: Event
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        
        event = Event(name: "SwiftUI Conference", location: "San Francisco")
        person = Person(name: "John Appleseed", emailAddress: "john.ap@gmail.com", details: "", metAt: event)
        
        container.mainContext.insert(person)
    }
}

