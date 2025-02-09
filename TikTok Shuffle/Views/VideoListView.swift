//
//  VideoListView.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import SwiftUI

struct VideoListView: View {
    @Binding var videos: [Video]
    @Binding var currentIndex: Int

    var body: some View {
        VStack {
            if currentIndex < videos.count {
                TikTokWebView(urlString: videos[currentIndex].url)
                    .onAppear {
                        if currentIndex < videos.count - 1 {
                            currentIndex += 1
                        }
                    }
            } else {
                Text("No more videos.")
            }
        }
    }
}
