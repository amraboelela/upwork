//
//  TwitterTabView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct TwitterTabView: View {
    @Binding var scrollViewHeight: CGFloat
    
    @State private var tabs = Tab.twitterTabs
    @State private var currentTab = Tab.twitterTabs[0]
    @State private var indicatorWidth: CGFloat =  0.0
    @State private var indicatorPosition: CGFloat = 0.0
    
    @State private var contentOffset: CGFloat = 0
    @State private var listHeight: CGFloat = 500
    @State private var tabBarOffset: CGFloat = 0.0
    
    let minDistance = 90.0
    
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
    
    func getStaticViewHeight() -> CGFloat {
        return scrollViewHeight * 0.7
    }
    
    func getTabHeight() -> CGFloat {
        let result = max(1824, listHeight) * 1.2
        print("getTabHeight result: \(result)")
        return result
    }
    
    var body: some View {
        VStack {
            TwitterTabBarView(
                tabs: $tabs,
                currentTab: $currentTab,
                tabBarOffset: $tabBarOffset
            )
            TabView(selection: $currentTab) {
                ForEach(tabs.indices, id: \.self) { index in
                    // Use a GeometryReader to adjust the view based on the tab index
                    GeometryReader { geometry in
                        // Determine the view to display based on the index
                        switch index {
                        case 0:
                            TwitterListView()
                                .frame(width: geometry.size.width)
                                .background (
                                    GeometryReader { listGeometry in
                                        Color.clear
                                            .onAppear {
                                                listHeight = listGeometry.size.height
                                                //print("listGeometry.size: \(listGeometry.size)")
                                            }
                                    }
                                )
                        case 1:
                            ComplexView()
                                .frame(width: geometry.size.width, height: getStaticViewHeight())
                                .offset(y: tabBarOffset < minDistance ? -tabBarOffset + minDistance : 0)
                                //.read(offset: $tabBarOffset)
                            // Add more cases as needed for additional tabs
                        default:
                            Text("Tab \(index + 1)")
                                .frame(width: geometry.size.width, height: getStaticViewHeight())
                                .offset(y: tabBarOffset < minDistance ? -tabBarOffset + minDistance : 0)
                        }
                    }
                    .offsetX { rect in
                        if currentTab.id == tabs[index].id {
                            contentOffset = rect.minX - (rect.width * CGFloat(index))
                        }
                        updateTabFrame(rect.width)
                    }
                    .tag(tabs[index])
                }
            }
            .frame(height: getTabHeight())
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentTab)
            .ignoresSafeArea(edges: .bottom)
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onChange(of: geo.frame(in: .global).minY) { newValue in
                            let currentOffset = newValue
                            print("currentOffset: \(currentOffset)")
                        }
                }
            )
        }
    }
}

#Preview {
    TwitterTabView(scrollViewHeight: .constant(500.0))
}
