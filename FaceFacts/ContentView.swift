//
//  ContentView.swift
//  FaceFacts
//
//  Created by Cường Nguyễn Bá on 29/10/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
    
    var body: some View {
        NavigationStack(path: $path) {
            PeopleView()
                .navigationTitle("FaceFacts")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person)
                }
                .toolbar {
                    Button("Add person", systemImage: "plus", action: addPerson)
                }
        }
    }
    
    // Add person
    func addPerson() {
        let person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
}

#Preview {
    ContentView()
}
