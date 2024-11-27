//
//  DetailView.swift
//  NewsApp
//
//  Created by Борис Кравченко on 27.11.2024.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    let article: Article
    let spacing: CGFloat = 20
    
    // MARK: - Body
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                MainImageView(article: article)
                
                VStack(alignment: .leading, spacing: spacing) {
                    Text(article.title)
                        .titleFont()
                    
                    if let description = article.description {
                        Text(description)
                            .descriptionFont()
                    }
                    
                    Text(article.publishedAt.convertDate())
                        .descriptionFont()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background)
                .background(GradientAvatarView())
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            
            BackButtonView()
                .padding(.leading)
        }
        
    }
}

#Preview {
    DetailView(
        article: Article(
            title: "Title",
            description: "Description",
            url: "",
            urlToImage: "https://www.meme-arsenal.com/memes/a931f6d96d7d9404cd367461da88dfd6.jpg",
            publishedAt: Date()
        )
    )
}
