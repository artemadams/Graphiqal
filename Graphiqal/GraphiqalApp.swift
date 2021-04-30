//
//  GraphiqalApp.swift
//  Graphiqal
//
//  Created by Artem Adams on 30.04.21.
//

import SwiftUI

@main
struct GraphiqalApp: App {
    @Environment(\.scenePhase) private var scenePhase

    @StateObject var api = APIService()

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase, perform: onScenePhase)
    }

    func onScenePhase(phase: ScenePhase) {
        switch phase {
        case .active:
            api.setup()
        case .inactive:
            return
        case .background:
            return
        @unknown default:
            return
        }
    }
}
