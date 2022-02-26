//
//  ArticleDetailScreen.swift
//  OtusHomework4
//
//  Created by allme on 25.02.2022.
//

import SwiftUI
import Networking

struct ArticleDetailScreen: View {
    
    private let article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(article.title ?? "NO TITLE")
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .focusable()
                
                if let description = article.description {
                    Text(description)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding()
                }
            }
        }
    }
}
