//
//  NewsListCell.swift
//  OtusHomework4
//
//  Created by allme on 25.02.2022.
//

import SwiftUI

public struct NewsListCell: View {
    
    public init(newsTitle: String?, isPageLoading: Bool) {
        self.newsTitle = newsTitle ?? "NO TITLE"
        self.isPageLoading = isPageLoading
    }
    
    let newsTitle: String
    let isPageLoading: Bool
    
    public var body: some View {
        VStack {
            Text(newsTitle)
                .padding()
            if isPageLoading {
                VStack(alignment: .center) {
                    Divider()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
}
