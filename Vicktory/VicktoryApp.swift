//
//  VicktoryApp.swift
//  Vicktory
//
//  Created by Greenpilligrim on 17/06/23.
//

import SwiftUI

@main
struct VicktoryApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            Home()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(vm)
        }
    }
}
