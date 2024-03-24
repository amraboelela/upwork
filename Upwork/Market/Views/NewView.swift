//
//  NewView.swift
//  Market
//
//  Created by Nicholas Nelson on 2/10/24.
//

import SwiftUI
                  
struct NewView: View {
    @State private var currentTab = Tab.sampleTabs[0]
    @State private var tabs = Tab.sampleTabs
    @State private var isToolbarVisible = true // Track if toolbar is visible
          
    enum ScrollDirection {
        case up, down
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if isToolbarVisible {
                NewViewCustomToolbar()
            }
            TabsView(tabs: $tabs, currentTab: $currentTab)
            MarketTabView(
                tabs: $tabs,
                currentTab: $currentTab, 
                onSwipe: { direction in
                    print("NewView direction: \(direction)")
                    isToolbarVisible = (direction == .up) ? false : true
                }
            )
            
        }
    }
}

#Preview {
    NewView()
}
