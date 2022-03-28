//
//  PhotoFeedResult.swift
//  PhotoAPI
//
//  Created by Maksim Maiorov on 11.03.2022.
//

import Foundation

struct PhotoFeedResult: Codable {
    var total_results: Int
    var page: Int
    var per_page: Int
    var photos: [Photo]
}
