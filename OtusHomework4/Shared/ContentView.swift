//
//  ContentView.swift
//  Shared
//
//  Created by allme on 25.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selection) {
            NewsScreen()
                .tabItem {
                    Text("News")
                    Image(systemName: "list.bullet")
                }
                .tag(0)
            TestScreen()
                .tabItem {
                    Text("Test")
                    Image(systemName: "square.and.arrow.down")
                }
                .tag(1)
        }
    }
    
}
