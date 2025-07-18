//
//  CurrenyConverterSwiftUIApp.swift
//  CurrenyConverterSwiftUI
//
//  Created by Harsha Narsietty on 18/07/25.
//

import SwiftUI

@main
struct CurrenyConverterSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
