//
//  NewsScreenViewModel.swift
//  OtusHomework4
//
//  Created by allme on 25.02.2022.
//

import SwiftUI
import Networking

final class NewsScreenViewModel: ObservableObject {
    
    @Injected var networkService: NetworkService?
    
    @Published var newsList: [Article] = .init()
    
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false
    
    @Published var totalResults: Int = Int.max
    
    init(topic: String, startDate: String) {
        self.topic = topic
        self.startDate = startDate
    }
    
    private let topic: String
    private let startDate: String
    
    func loadPage() {
        guard isPageLoading == false, newsList.count < totalResults else { return }
        
        isPageLoading = true
        page += 1
        
        networkService?.loadNewsPage(page: page,
                              topic: self.topic,
                              fromDate: self.startDate,
                              completion: { list, error in
            self.newsList.append(contentsOf: list?.articles ?? [])
            if let totalResults = list?.totalResults {
                self.totalResults = totalResults
            }
            self.isPageLoading = false
        })
    }
    
}
