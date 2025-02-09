//
//  TikTokWebView.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import SwiftUI
import WebKit

struct TikTokWebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
