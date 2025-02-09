//
//  ProcessingView.swift
//  TikTok Shuffle
//
//  Created by Ankur Desai on 2/9/25.
//


import SwiftUI

struct ProcessingView: View {
    @State private var progress: Double = 0.0

    var body: some View {
        VStack {
            Text("Processing...")
                .font(.title)
            ProgressView(value: progress, total: 100)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
            Text("\(Int(progress))%")
                .font(.headline)
        }
        .onAppear {
            startProcessing()
        }
    }

    func startProcessing() {
        // Simulate processing
        for i in 1...100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                progress = Double(i)
                if i == 100 {
                    // Navigate to video list view
                }
            }
        }
    }
}
