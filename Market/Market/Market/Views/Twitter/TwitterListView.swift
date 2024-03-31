//
//  TwitterListView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct TwitterListView: View {

    var body: some View {
        VStack(spacing: 18) {
            TweetView(
                tweet: Constants.sampleTweet
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
    TwitterListView()
}
