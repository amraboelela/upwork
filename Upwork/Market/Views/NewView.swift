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
    
    var body: some View {
        VStack(spacing: 0) {
            NewViewCustomToolbar()
            TabsView(tabs: $tabs, currentTab: $currentTab)
            MarketTabView(tabs: $tabs, currentTab: $currentTab)
        }
    }
}

#Preview {
    NewView()
}
