//
//  OriginalTwitterListView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct OriginalTwitterListView: View {
    var body: some View {
        VStack(spacing: 18) {
            // Sample Tweets...
            TweetView(
                tweet: Constants.sampleTweet,
                tweetImage: "post"
            )
            Divider()
            ForEach(1...20, id: \.self) {_ in
                TweetView(tweet: Constants.sampleText)
                Divider()
            }
        }
        .padding(.top)
        .zIndex(0)
    }
}

#Preview {
    OriginalTwitterListView()
}
