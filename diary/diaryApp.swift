//
//  diaryApp.swift
//  diary
//
//  Created by Fernando Salom Carratala on 22/6/24.
//

import SwiftUI
import SwiftData

@main
struct diaryApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([

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
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
