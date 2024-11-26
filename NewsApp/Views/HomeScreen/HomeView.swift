//
//  ContentView.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = ViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
    // MARK: - Top News
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(viewModel.topNews, id: \.url) { article in
                            TopArticleView(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 5)
                
    // MARK: - Bottom News
                Text("Bottom News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(viewModel.bottomNews, id: \.url) { article in
                            BottomArticleView(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 5)
            }
            .background(.secondary.opacity(0.2))
            .refreshable {
                viewModel.fetchTopNews()
                viewModel.fetchBottomNews()
            }
        }
    }
    
    // MARK: - Methods
    
}

#Preview {
    HomeView()
}
