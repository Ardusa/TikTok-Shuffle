//
//  UploadView.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import SwiftUI

struct UploadView: View {
	@Binding var navigationState: NavigationState
	@Binding var videos: [Video]

	@State private var isImporting = false
	@State private var fileURL: URL?

	var body: some View {
		VStack {
			Text("TikTok Shuffle")
				.font(.largeTitle)
				.fontWeight(.bold)
				.padding(.top)
				.frame(maxWidth: .infinity, alignment: .center)

			Text("Shuffle all your favorited videos and watch them back!")
				.font(.subheadline)
				.padding(.horizontal)
				.frame(maxWidth: .infinity, alignment: .center)

			Spacer()

			Button(action: {
				isImporting = true
			}) {
				HStack {
					Image(systemName: "arrow.up.circle.fill")
						.font(.title)
					Text("Upload TikTok Data")
						.fontWeight(.semibold)
				}
				.padding()
				.foregroundColor(.white)
				.background(Color.blue)
				.cornerRadius(10)
			}
			.fileImporter(
				isPresented: $isImporting,
				allowedContentTypes: [.json, .plainText]
			) { result in
				switch result {
					case .success(let url):
						fileURL = url
						if let url = fileURL {
								// Read the file data and parse it
							do {
								let data = try Data(contentsOf: url)
								let jsonParser = JSONParser()
								if let parsedVideos = jsonParser.parseJSON(from: data) {
										// Save the videos in UserDefaults
									jsonParser.saveVideosToUserDefaults(videos: parsedVideos)

										// Update the videos array
									self.videos = parsedVideos

										// Switch to video list view
									navigationState = .videoList
								}
							} catch {
								print("Failed to read file: \(error.localizedDescription)")
							}
						}
					case .failure(let error):
						print("Failed to import file: \(error.localizedDescription)")
				}
			}
			.padding()
		}
		.navigationTitle("Upload Data")
		.navigationBarTitleDisplayMode(.inline)
	}
}
