//
//  ContentView.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import SwiftUI

enum NavigationState {
	case upload
	case videoList
}

struct ContentView: View {
	@State private var navigationState: NavigationState = .upload
	@State private var videos: [Video] = []
	@State private var currentIndex: Int = 0

		// Persistent storage keys
	private let videosKey = "videos"
	private let currentIndexKey = "currentIndex"

	var body: some View {
		NavigationStack {
			switch navigationState {
				case .upload:
					UploadView(navigationState: $navigationState, videos: $videos)
				case .videoList:
					VideoListView(videos: $videos, currentIndex: $currentIndex)
						.navigationTitle("TikTok Shuffle")
						.navigationBarItems(
							leading: Button(action: { navigationState = .upload }) {
								Image(systemName: "folder")
							},
							trailing: Button(action: { shuffleVideos() }) {
								Image(systemName: "arrow.clockwise")
							}
						)
			}
		}
		.onAppear {
			loadState()
				// Check if videos are empty before setting the navigation state
			if videos.isEmpty {
				navigationState = .upload
			} else {
				navigationState = .videoList
			}
		}
	}

	func shuffleVideos() {
		videos.shuffle()
		currentIndex = 0
		saveState()
	}

		// Store data in UserDefaults
	func saveState() {
		if let encodedVideos = try? JSONEncoder().encode(videos) {
			UserDefaults.standard.set(encodedVideos, forKey: videosKey)
		}
		UserDefaults.standard.set(currentIndex, forKey: currentIndexKey)
	}

		// Retrieve data from UserDefaults
	func loadState() {
		if let savedVideosData = UserDefaults.standard.data(forKey: videosKey),
		   let decodedVideos = try? JSONDecoder().decode([Video].self, from: savedVideosData) {
			videos = decodedVideos
		}
		currentIndex = UserDefaults.standard.integer(forKey: currentIndexKey)
	}
}

#Preview {
	ContentView()
}
