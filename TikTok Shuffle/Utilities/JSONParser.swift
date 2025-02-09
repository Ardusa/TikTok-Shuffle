//
//  JSONParser.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import Foundation

class JSONParser {
	func parseJSON(from data: Data) -> [Video]? {
		let decoder = JSONDecoder()
		do {
				// Decode the JSON to your Root model
			let root = try decoder.decode(Root.self, from: data)

				// Convert FavoriteVideo items to Video items
			let videos = root.favoriteVideos.favoriteVideoList.map { video in
				Video(url: video.link, date: video.date)
			}
			return videos
		} catch {
			print("Error decoding JSON: \(error.localizedDescription)")
			return nil
		}
	}

		// Function to save videos persistently in UserDefaults
	func saveVideosToUserDefaults(videos: [Video]) {
		let encoder = JSONEncoder()
		if let encodedData = try? encoder.encode(videos) {
			UserDefaults.standard.set(encodedData, forKey: "videos")
		}
	}

		// Function to load videos from UserDefaults
	func loadVideosFromUserDefaults() -> [Video]? {
		if let savedData = UserDefaults.standard.data(forKey: "videos"),
		   let decodedVideos = try? JSONDecoder().decode([Video].self, from: savedData) {
			return decodedVideos
		}
		return nil
	}
}
