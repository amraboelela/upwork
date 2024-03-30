//
//  ProfileCustomPicker.swift
//  market
//
//  Created by Nicholas Nelson on 12/21/23.
//

import SwiftUI

struct ProfileCustomPicker: View {
    @State private var currentTab = Tab.profileSampleTabs[0]
    @State private var tabs = Tab.profileSampleTabs
    @State private var isToolbarVisible = true
    @State private var indicatorWidth: CGFloat =  0.0
    @State private var indicatorPosition: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            TabsView(
                tabs: $tabs,
                currentTab: $currentTab,
                indicatorWidth: $indicatorWidth,
                indicatorPosition: $indicatorPosition
            )
            MarketTabView(
                tabs: $tabs,
                currentTab: $currentTab,
                indicatorWidth: $indicatorWidth,
                indicatorPosition: $indicatorPosition,
                onSwipe: { direction in
                    print("NewView direction: \(direction)")
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isToolbarVisible = (direction == .up) ? false : true
                    }
                }
            )
        }
    }
}

#Preview {
    ProfileCustomPicker()
}
