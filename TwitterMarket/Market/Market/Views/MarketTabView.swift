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
    @Binding var indicatorWidth: CGFloat
    @Binding var indicatorPosition: CGFloat
    let onSwipe: (SwipeDirection) -> Void
    
    @State private var contentOffset: CGFloat = 0
    @State private var reloadToggle = false
    
    /// Calculating Tab Width & Position
    func updateTabFrame(_ tabViewWidth: CGFloat) {
        let inputRange = tabs.indices.map { index -> CGFloat in
            return CGFloat(index) * tabViewWidth
        }
        let outputRangeForWidth = tabs.map { tab -> CGFloat in
            return tab.width
        }
        let outputRangeForPosition = tabs.map { tab -> CGFloat in
            return tab.minX
        }
        let widthInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForWidth)
        let positionInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForPosition)
        
        indicatorWidth = widthInterpolation.calculate(for: -contentOffset)
        indicatorPosition = positionInterpolation.calculate(for: -contentOffset)
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            ForEach(tabs.indices, id: \.self) { index in
                // Use a GeometryReader to adjust the view based on the tab index
                GeometryReader { geometry in
                    // Determine the view to display based on the index
                    switch index {
                    case 0:
                        ListView(
                            onSwipe: { direction in
                                onSwipe(direction)
                            }
                        )
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
                .ignoresSafeArea()
                .offsetX { rect in
                    if currentTab.id == tabs[index].id {
                        contentOffset = rect.minX - (rect.width * CGFloat(index))
                    }
                    updateTabFrame(rect.width)
                }
                .tag(tabs[index])
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut, value: currentTab)
        .ignoresSafeArea(edges: .bottom)
        .detectSwipe(
            onSwipe: { direction in
                onSwipe(direction)
            }
        )
    }
}

#Preview {
    MarketTabView(
        tabs: .constant(Tab.newSampleTabs),
        currentTab: .constant(Tab.newSampleTabs[0]),
        indicatorWidth: .constant(100.0),
        indicatorPosition: .constant(100.0),
        onSwipe: {_ in }
    )
}
