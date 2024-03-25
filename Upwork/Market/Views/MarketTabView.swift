//
//  MarketTabView.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

/*
struct MarketTabView: View {
    @Binding var tabs: [Tab]
    @Binding var currentTab: Tab
    let onSwipe: (SwipeDirection) -> Void
    @State private var reloadToggle = false
    
    var body: some View {
        TabView(selection: $currentTab) {
            ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tab in
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
                .tag(tab)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut, value: currentTab)
        .ignoresSafeArea(edges: .bottom)
        .gesture(
            DragGesture()
                .onChanged { value in
                    let verticalDistance = value.location.y - value.startLocation.y
                    let swipeThreshold = 5.0
                    if verticalDistance > swipeThreshold {
                        onSwipe(.down)
                    } else if verticalDistance < -swipeThreshold {
                        onSwipe(.up)
                    } else {
                        let horizontalDistance = value.location.x - value.startLocation.x
                        if horizontalDistance > swipeThreshold {
                            onSwipe(.right)
                        } else if horizontalDistance < -swipeThreshold {
                            onSwipe(.left)
                        }
                    }
                }
        )
        
    }
}

#Preview {
    MarketTabView(
        tabs: .constant(Tab.sampleTabs),
        currentTab: .constant(Tab.sampleTabs[0]),
        onSwipe: {_ in }
    )
}
*/
