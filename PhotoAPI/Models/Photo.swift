//
//  Photo.swift
//  PhotoAPI
//
//  Created by Maksim Maiorov on 11.03.2022.
//

import Foundation

struct Photo: Codable {
    var id: Int
    var photographer: String
    var photographer_url: String
    var photographer_tag: String {
        return photographer_url.replacingOccurrences(of: "https://www.pexels.com/", with: "")
    }
    var src: PhotoSize
}
