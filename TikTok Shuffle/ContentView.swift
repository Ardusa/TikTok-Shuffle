//
//  ContentView.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//

import SwiftUI

struct ContentView: View {
	// Sample TikTok URLs (we’ll replace this with JSON later)
	@State private var videoURLs: [String] = [
		"https://www.tiktok.com/@user/video/7203050086852758811",
		"https://www.tiktok.com/@user/video/7203050086852758812",
		"https://www.tiktok.com/@user/video/7203050086852758813"
	]

	var body: some View {
		NavigationView {
			List(videoURLs, id: \.self) { url in
				NavigationLink(destination: TikTokWebView(urlString: url)) {
					Text(url)
						.lineLimit(1)
						.truncationMode(.tail)
				}
			}
			.navigationTitle("TikTok Favorites")
		}
	}
}

#Preview {
    ContentView()
}
