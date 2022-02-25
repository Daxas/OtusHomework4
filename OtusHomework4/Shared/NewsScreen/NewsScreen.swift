//
//  NewsScreen.swift
//  OtusHomework4
//
//  Created by allme on 25.02.2022.
//

import SwiftUI
import Networking

struct NewsScreen: View {
    
    @StateObject var firstNewsModel = NewsScreenViewModel(topic: Self.newsTopics[0], startDate: Self.startDate)
    @StateObject var secondNewsModel = NewsScreenViewModel(topic: Self.newsTopics[1], startDate: Self.startDate)
    @StateObject var thirdNewsModel = NewsScreenViewModel(topic: Self.newsTopics[2], startDate: Self.startDate)
    
    @State var newsChoice = 0
    
    var body: some View {
        NavigationView {
            newsPicker
                .onAppear {
                    firstNewsModel.loadPage()
                    secondNewsModel.loadPage()
                    thirdNewsModel.loadPage()
                }
                .navigationBarTitle("", displayMode: .inline)
        }
    }
    
    var newsPicker: some View {
        ScrollView {
            VStack {
                Picker.init("NEWS", selection: $newsChoice) {
                    ForEach(0 ..< Self.newsTopics.count) { index in
                        Text(Self.newsTopics[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if newsChoice == 0 {
                    firstList
                } else if newsChoice == 1 {
                    secondList
                } else {
                    thirdList
                }
                Spacer()
            }.frame(minHeight: 1000)
        }
    }
    
    private static let newsTopics = ["Moscow", "VR", "Tesla"]
    private static let startDate = "2022-02-25"
    
    var firstList: some View {
        List {
            ForEach(firstNewsModel.newsList) { item in
                NavigationLink(destination: ArticleDetailScreen(article: item)) {
                    NewsListCell(newsTitle: item.title, isPageLoading: firstNewsModel.isPageLoading)
                        .environmentObject(firstNewsModel)
                }
            }
        }
    }
    
    var secondList: some View {
        List {
            ForEach(secondNewsModel.newsList) { item in
                NavigationLink(destination: ArticleDetailScreen(article: item)) {
                    NewsListCell(newsTitle: item.title, isPageLoading: secondNewsModel.isPageLoading)
                        .environmentObject(secondNewsModel)
                }
            }
        }
    }
    
    var thirdList: some View {
        List {
            ForEach(thirdNewsModel.newsList) { item in
                NavigationLink(destination: ArticleDetailScreen(article: item)) {
                    NewsListCell(newsTitle: item.title, isPageLoading: thirdNewsModel.isPageLoading)
                        .environmentObject(thirdNewsModel)
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
