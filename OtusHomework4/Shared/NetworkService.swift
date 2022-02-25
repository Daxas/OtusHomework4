//
//  NetworkService.swift
//  OtusHomework4
//
//  Created by allme on 25.02.2022.
//

//import Foundation
import Networking

protocol NetworkServiceProtocol {
    func loadNewsPage(page: Int, topic: String, fromDate: String, completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void))
}

class NetworkService: NetworkServiceProtocol {
    
    func loadNewsPage(page: Int, topic: String, fromDate: String, completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)) {
        ArticlesAPI.everythingGet(q: topic,
                                  from: fromDate,
                                  sortBy: "publishedAt",
                                  language: "ru",
                                  apiKey: "a59e5f24831a4322b535578654582973",
                                  page: page,
                                  completion: completion)
    }
    
}
