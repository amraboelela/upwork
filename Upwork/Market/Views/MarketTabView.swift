//
//  MarketTabView.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

struct MarketTabView: View {
    @Binding var tabs: [Tab]
    @Binding var currentTab: Tab
    
    var body: some View {
        TabView(selection: $currentTab) {
            ForEach(Array(tabs.enumerated()), id: \.element.id) { (index, tab) in
                // Use a GeometryReader to adjust the view based on the tab index
                GeometryReader { geometry in
                    // Determine the view to display based on the index
                    switch index {
                    case 0:
                        ListView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    case 1:
                        ComplexView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        // Add more cases as needed for additional tabs
                    default:
                        Text("Tab \(index + 1)")
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
                .clipped()
                //.ignoresSafeArea()
                /*.offsetX { rect in
                 if currentTab.id == tab.id {
                 contentOffset = rect.minX - (rect.width * CGFloat(self.index(of: tab)))
                 }
                 updateTabFrame(rect.width)
                 }*/
                .tag(tab)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut, value: currentTab)
        .ignoresSafeArea(edges: .bottom)
        //}
    }
}

#Preview {
    MarketTabView(
        tabs: .constant(Tab.sampleTabs),
        currentTab: .constant(Tab.sampleTabs[0])
    )
}

