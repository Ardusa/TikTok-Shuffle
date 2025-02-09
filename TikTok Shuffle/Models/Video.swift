//
//  Video.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import Foundation

struct Video: Identifiable, Codable {
	var id: String { url }  // Use URL as the ID (since it's unique)
	var url: String
	var date: String
}
