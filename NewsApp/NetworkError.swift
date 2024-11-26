//
//  NetworkError.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalide response from server"
    case invalidData = "The data received from server is invalid"
}
