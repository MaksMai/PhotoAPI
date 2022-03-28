//
//  APIError.swift
//  PhotoAPI
//
//  Created by Maksim Maiorov on 11.03.2022.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidDate
    case responseUnsucessful
    case jsonParsingFailed
    case jsonConversionFailed
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .invalidDate:
            return "Invalid Date"
        case .responseUnsucessful:
            return "Response Unsucessful"
        case .jsonParsingFailed:
            return "JSON Parsing Failed"
        case .jsonConversionFailed:
            return "JSON Conversion Failed"
        }
    }
}
