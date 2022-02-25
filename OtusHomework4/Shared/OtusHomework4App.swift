//
//  OtusHomework4App.swift
//  Shared
//
//  Created by allme on 25.02.2022.
//

import SwiftUI

@main
struct OtusHomework4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router())
                .onAppear {
                    Configurator.shared.setup()
                }
        }
    }
}
