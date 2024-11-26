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
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.topNews, id: \.url) { article in
                            TopArticleView(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(.secondary.opacity(0.2))
        }
    }
    
    // MARK: - Methods
    
}

#Preview {
    HomeView()
}

