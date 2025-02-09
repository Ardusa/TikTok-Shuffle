//
//  FavoriteVideo.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import Foundation

// Structure to represent a single video
struct FavoriteVideo: Codable {
    let date: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case link = "Link"
    }
}

// Structure to represent the "Favorite Video List"
struct FavoriteVideos: Codable {
    let favoriteVideoList: [FavoriteVideo]

    enum CodingKeys: String, CodingKey {
        case favoriteVideoList = "FavoriteVideoList"
    }
}

// Root structure to match the outer JSON object
struct Root: Codable {
    let favoriteVideos: FavoriteVideos

    enum CodingKeys: String, CodingKey {
        case favoriteVideos = "Favorite Videos"
    }
}
