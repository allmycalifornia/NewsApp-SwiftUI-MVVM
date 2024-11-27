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
    let imageWidth: CGFloat = 260
    let imageHeight: CGFloat = 150
    let defaultImageSize: CGFloat = 150
    let defaultImageFrame: CGFloat = 50
    let blockSize: CGFloat = 260
    let padding: CGFloat = 10
    let cornerRadius: CGFloat = 10
    let defaultImageOpacity: Double = 0.3
    
// MARK: - Body
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageWidth, height: imageHeight)
                            .cornerRadius(cornerRadius)
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(height: defaultImageSize)
                                .foregroundStyle(.secondary)
                                .opacity(defaultImageOpacity)
                                .cornerRadius(cornerRadius)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: defaultImageFrame)
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
        .frame(width: blockSize, height: blockSize)
        .padding(padding)
        .background(.background)
        .cornerRadius(cornerRadius)
    }
}

