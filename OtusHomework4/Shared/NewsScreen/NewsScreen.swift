//
//  NewsScreen.swift
//  OtusHomework4
//
//  Created by allme on 25.02.2022.
//

import SwiftUI
import Networking

struct NewsScreen: View {
    
    @EnvironmentObject var newsModel: NewsScreenViewModel
    
    var body: some View {
        NavigationView {
            newsList
                .onAppear {
                    newsModel.loadPage()
                }
        }
    }
    
    var newsList: some View {
        List {
            ForEach(newsModel.newsList) { item in
                NavigationLink(destination: ArticleDetailScreen(article: item)) {
                    NewsListCell(newsTitle: item.title, isPageLoading: newsModel.isPageLoading)
                        .environmentObject(newsModel)
                }
            }
        }
    }
}

extension Article: Identifiable {
    public var id: String {
        self.url
    }
}
