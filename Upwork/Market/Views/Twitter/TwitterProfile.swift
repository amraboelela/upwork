//
//  TwitterProfile.swift
//  market
//
//  Created by Nicholas Nelson on 3/27/24.
//

import SwiftUI

struct TwitterProfile: View {
    @State private var currentTab = Tab.twitterTabs[0]
    @State private var tabs = Tab.twitterTabs
    
    @State var offset: CGFloat = 0
    // For Dark Mode Adoption..
    @Environment(\.colorScheme) var colorScheme
    @State var tabBarOffset: CGFloat = 0.0
    @State var indicatorWidth: CGFloat =  0.0
    @State var indicatorPosition: CGFloat = 0.0
    @State var tabHeight: CGFloat = 0.0
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeaderView(offset: $offset)
            VStack {
                ProfileHeader(offset: $offset)
                ProfileView()
                TwitterTabBarView(
                    tabs: $tabs,
                    currentTab: $currentTab,
                    tabBarOffset: $tabBarOffset
                )
                TwitterTabView(
                    tabs: $tabs,
                    currentTab: $currentTab,
                    indicatorWidth: $indicatorWidth,
                    indicatorPosition: $indicatorPosition,
                    tabHeight: $tabHeight,
                    onSwipe: {_ in }
                )
            }
            .padding(.horizontal)
            // Moving the view back if it goes > 80...
            .zIndex(-offset > 80 ? 0 : 1)
        }
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        tabHeight = geometry.size.height
                        print("tabHeight: \(tabHeight)")
                    }
            }
        )
    }
}

#Preview {
    TwitterProfile()
        //.preferredColorScheme(.dark)
}
