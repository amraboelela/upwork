//
//  OriginalTwitterTabBarView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI
 /*
struct OriginalTwitterTabBarView: View {
    @Binding var currentTab: String
    @Binding var tabBarOffset: CGFloat
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    TabButton(title: "Tweets", currentTab: $currentTab)
                    TabButton(title: "Tweets & Likes", currentTab: $currentTab)
                    TabButton(title: "Media", currentTab: $currentTab)
                    TabButton(title: "Likes", currentTab: $currentTab)
                }
            }
            Divider()
        }
        .padding(.top, 30)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
        .overlay(
            GeometryReader{reader -> Color in
                let minY = reader.frame(in: .global).minY
                Task {
                    self.tabBarOffset = minY
                }
                return Color.clear
            }
            .frame(width: 0, height: 0),
            alignment: .top
        )
        .zIndex(1)
    }
}

#Preview {
    OriginalTwitterTabBarView(currentTab: .constant("Tweets"), tabBarOffset: .constant(0.0))
}*/

