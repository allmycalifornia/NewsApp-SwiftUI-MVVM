//
//  TopArticleView.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//

import SwiftUI

// MARK: - Propertis
struct TopArticleView: View {
    
    let article: Article
    
// MARK: - Body
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 260, height: 150)
                            .cornerRadius(10)
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .foregroundStyle(.secondary)
                                .opacity(0.3)
                                .cornerRadius(10)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 50)
                        }
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                Spacer()
                
                Text(article.publishedAt.convertDate())
                    .descriptionFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 260, height: 260)
        .padding(10)
        .background(.background)
        .cornerRadius(10)
    }
}

