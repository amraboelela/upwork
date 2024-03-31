//
//  TwitterTabView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct TwitterTabView: View {
    @Binding var tabs: [Tab]
    @Binding var currentTab: Tab
    @Binding var indicatorWidth: CGFloat
    @Binding var indicatorPosition: CGFloat
    @Binding var tabHeight: CGFloat
    let onSwipe: (SwipeDirection) -> Void
    
    @State private var contentOffset: CGFloat = 0
    @State private var listHeight: CGFloat = 500
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
    
    var getTabHeight: CGFloat {
        let result = max(1824, listHeight) * 1.5
        print("getTabHeight result: \(result)")
        return result
    }
    
    var body: some View {
        //ScrollView {
        //VStack {
            //GeometryReader { geometry in
        TabView(selection: $currentTab) {
            //VStack {
            ForEach(tabs.indices, id: \.self) { index in
                // Use a GeometryReader to adjust the view based on the tab index
                GeometryReader { geometry in
                    // Determine the view to display based on the index
                    switch index {
                    case 0:
                        TwitterListView()
                            .frame(width: geometry.size.width)
                            .background(
                                GeometryReader { listGeometry in
                                    Color.clear
                                        .onAppear {
                                            listHeight = listGeometry.size.height
                                            print("listGeometry.size: \(listGeometry.size)")
                                        }
                                }
                            )
                    case 1:
                        ComplexView()
                            .frame(width: geometry.size.width, height: tabHeight)
                        // Add more cases as needed for additional tabs
                    default:
                        Text("Tab \(index + 1)")
                            .frame(width: geometry.size.width, height: tabHeight)
                    }
                }
                //.clipped()
                //.ignoresSafeArea()
                .offsetX { rect in
                    if currentTab.id == tabs[index].id {
                        contentOffset = rect.minX - (rect.width * CGFloat(index))
                    }
                    updateTabFrame(rect.width)
                }
                .tag(tabs[index])
            }
        }
        .frame(height: getTabHeight)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut, value: currentTab)
        .ignoresSafeArea(edges: .bottom)
        .detectSwipe(
            onSwipe: { direction in
                onSwipe(direction)
            }
        )
            //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
         //   .frame(height: listHeight)
            /*.background(
             GeometryReader { proxy in
             Color.clear
             .onAppear {
             let rect = proxy.frame(in: .global)
             //tabHeight = rect.height
             //print("rect: \(rect)")
             /*if index == 0 {
              indicatorWidth = rect.width
              indicatorPosition = rect.minX
              }*/
             //updateTabWithRect(tabId: tab.id, rect: rect)
             }
             }
             
             GeometryReader { geometry in
             Color.clear
             .frame(height: 1) // Ensure the GeometryReader has some height
             .onAppear {
             tabHeight = geometry.size.height
             print("tabHeight: \(tabHeight)")
             }
             }
             )*/
            //.frame(height: geometry.size.height)
        //}
            //}
        /*}
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        tabHeight = geometry.size.height
                        print("tabHeight: \(tabHeight)")
                    }
            }
        )
        
        ScrollView(.vertical, showsIndicators: false) {
            TabView(selection: $currentTab) {
            //VStack {
                ForEach(tabs.indices, id: \.self) { index in
                    // Use a GeometryReader to adjust the view based on the tab index
                    GeometryReader { geometry in
                        // Determine the view to display based on the index
                        switch index {
                        case 0:
                            TwitterListView()
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
                    //.clipped()
                    //.ignoresSafeArea()
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
        }*/
    }
}

#Preview {
    TwitterTabView(
        tabs: .constant(Tab.newSampleTabs),
        currentTab: .constant(Tab.newSampleTabs[0]),
        indicatorWidth: .constant(100.0),
        indicatorPosition: .constant(100.0),
        tabHeight: .constant(100.0),
        onSwipe: {_ in }
    )
}
