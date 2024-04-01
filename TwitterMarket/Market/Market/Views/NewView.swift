//
//  NewView.swift
//  Market
//
//  Created by Nicholas Nelson on 2/10/24.
//

import SwiftUI

struct NewView: View {
    @State private var currentTab = Tab.newSampleTabs[0]
    @State private var tabs = Tab.newSampleTabs
    @State private var isToolbarVisible = true
    @State private var indicatorWidth: CGFloat =  0.0
    @State private var indicatorPosition: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            if isToolbarVisible {
                NewViewCustomToolbar()
            }
            TabBarView(
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
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isToolbarVisible = (direction == .up) ? false : true
                    }
                }
            )
            
        }
    }
}

#Preview {
    NewView()
}
