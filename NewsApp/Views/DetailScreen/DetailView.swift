//
//  DetailView.swift
//  NewsApp
//
//  Created by Борис Кравченко on 27.11.2024.
//

import SwiftUI

struct DetailView: View {
    
    let article: Article
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            MainImageView(article: article)
            
            VStack(alignment: .leading, spacing: 20) {
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
        
    }
}

struct GradientAvatarView: View {
    var body: some View {
        GeometryReader(
            content: { _ in
                LinearGradient(
                    colors: [Color(UIColor.systemBackground), .clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: SizeConstants.avatarHeight / 4)
                .offset(y: -SizeConstants.avatarHeight / 4)
        })
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
