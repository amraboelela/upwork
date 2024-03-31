//
//  TwitterTabBarView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI
 
struct TwitterTabBarView: View {
    @Binding var tabs: [Tab]
    @Binding var currentTab: Tab
    @State private var tabBarOffset: CGFloat = 0.0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(tabs) { tab in
                        TabButton(tab: tab, currentTab: $currentTab)
                    }
                }
            }
            Divider()
        }
        .padding(.top, 30)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .offset(y: tabBarOffset < 90.0 ? -tabBarOffset + 90.0 : 0)
        .read(offset: $tabBarOffset)
        .zIndex(1)
    }
}

#Preview {
    TwitterTabBarView(
        tabs: .constant(Tab.twitterTabs),
        currentTab: .constant(Tab.twitterTabs[0])
    )
}

