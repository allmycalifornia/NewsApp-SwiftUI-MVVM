//
//  Extension+Date.swift
//  NewsApp
//
//  Created by Борис Кравченко on 26.11.2024.
//

import Foundation

extension Date {
    func convertDate() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
}
