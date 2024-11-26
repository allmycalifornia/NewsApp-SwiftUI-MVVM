//
//  Model.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//

import Foundation

// MARK: - News
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
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
