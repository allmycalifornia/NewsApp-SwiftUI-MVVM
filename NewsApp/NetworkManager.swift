//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//

import Foundation

final class NetworkManager {
    
    // MARK: Properties
    static let shared = NetworkManager()
    private let urlNews = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a9994f5fc52f471b87c6bb1c40a1af4b"
    private let decoder: JSONDecoder = .init()
    
    // MARK: Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    // MARK: Methods
    func getNews() async throws -> News {
        guard let url  = URL(string: urlNews) else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        do {
            return try decoder.decode(News.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
