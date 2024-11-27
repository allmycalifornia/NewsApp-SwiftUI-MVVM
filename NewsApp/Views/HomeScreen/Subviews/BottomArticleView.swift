//
//  BottomArticleView.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//
import SwiftUI

struct BottomArticleView: View {
    
    // MARK: - Properties
    let article: Article
    let imageSize: CGFloat = 120
    let defaultImageSize: CGFloat = 50
    let imageCornerRadius: CGFloat = 10
    let blockWidth: CGFloat = 120
    let blockHeight: CGFloat = 240
    let padding: CGFloat = 10
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
                            .frame(width: imageSize, height: imageSize)
                            .cornerRadius(imageCornerRadius)
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(width: imageSize, height: imageSize)
                                .foregroundStyle(.secondary)
                                .opacity(defaultImageOpacity)
                                .cornerRadius(imageCornerRadius)
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: defaultImageSize)
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
        }
        .frame(width: blockWidth, height: blockHeight)
        .padding(padding)
        .background(.background)
        .cornerRadius(imageCornerRadius)
    }
}
