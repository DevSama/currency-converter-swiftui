//
//  CurrenyConverterSwiftUIApp.swift
//  CurrenyConverterSwiftUI
//
//  Created by Harsha Narsietty on 18/07/25.
//

import SwiftUI

@main
struct CurrencyConverterSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CurrencyConverterView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
