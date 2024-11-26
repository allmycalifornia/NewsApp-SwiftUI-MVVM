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
        VStack {
            ForEach(viewModel.topNews, id: \.url) { article in
                Text(article.title)
            }
        }
    }
    
    // MARK: - Methods
    
}

#Preview {
    HomeView()
}
