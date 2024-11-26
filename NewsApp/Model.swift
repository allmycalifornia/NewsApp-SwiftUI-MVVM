//
//  Model.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//

// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a9994f5fc52f471b87c6bb1c40a1af4b

import Foundation

// MARK: - News
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let title, description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct Source: Decodable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case techcrunch = "techcrunch"
}

enum Name: String, Codable {
    case techCrunch = "TechCrunch"
}
