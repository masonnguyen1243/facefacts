//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Cường Nguyễn Bá on 29/10/25.
//

import SwiftUI
import SwiftData

@main
struct FaceFactsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Person.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
