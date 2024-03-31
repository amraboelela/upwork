//
//  TwitterListView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct TwitterListView: View {
    /*@State var currentTab = Tab.newSampleTabs[0]
    @State var tabs = Tab.newSampleTabs
    @State var indicatorWidth: CGFloat =  0.0
    @State var indicatorPosition: CGFloat = 0.0
    
    @State private var previousOffset: CGFloat = 0
    @State private var currentOffset: CGFloat = 0
    */
    
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
