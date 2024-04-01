//
//  TweetView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct TweetView: View {
    var tweet: String
    var tweetImage: String?
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Kavsoft  ")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                +
                Text("@_Kavsoft")
                    .foregroundColor(.gray)
                Text(tweet)
                    .frame(height: 100, alignment: .top)
            }
        }
    }
}

#Preview {
    TweetView(
        tweet: Constants.sampleText
    )
}
