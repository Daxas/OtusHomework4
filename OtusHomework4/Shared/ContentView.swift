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
                .environmentObject(NewsScreenViewModel(topic: Self.newsTopics[0], startDate: "2022-02-25"))
                .tabItem {
                    Text(Self.newsTopics[0])
                    Image(systemName: "list.bullet")
                }
                .tag(0)
            NewsScreen()
                .environmentObject(NewsScreenViewModel(topic: Self.newsTopics[1], startDate: "2022-02-25"))
                .tabItem {
                    Text(Self.newsTopics[1])
                    Image(systemName: "square.and.arrow.down")
                }
                .tag(1)
        }
    }
    
    private static let newsTopics = ["VR", "Tesla"]
    
}
