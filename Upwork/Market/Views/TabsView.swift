//
//  TabsView.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

/*
/// A simple class that will be useful to do linear interpolation calculations for our Dynmaic Tab Animation
class LinearInterpolation {
    private var length: Int
    private var inputRange: [CGFloat]
    private var outputRange: [CGFloat]
    
    init(inputRange: [CGFloat], outputRange: [CGFloat]) {
        /// Safe Check
        assert(inputRange.count == outputRange.count)
        self.length = inputRange.count - 1
        self.inputRange = inputRange
        self.outputRange = outputRange
    }
    
    func calculate(for x: CGFloat) -> CGFloat {
        /// If Value less than it's Initial Input Range
        if x <= inputRange[0] { return outputRange[0] }
        
        for index in 1...length {
            let x1 = inputRange[index - 1]
            let x2 = inputRange[index]
            
            let y1 = outputRange[index - 1]
            let y2 = outputRange[index]
            
            /// Linear Interpolation Formula: y1 + ((y2-y1) / (x2-x1)) * (x-x1)
            if x <= inputRange[index] {
                let y = y1 + ((y2-y1) / (x2-x1)) * (x-x1)
                return y
            }
        }
        
        /// If Value Exceeds it's Maximum Input Range
        return outputRange[length]
    }
}

struct TabsView: View {
    @Binding var tabs: [Tab]
    @Binding var currentTab: Tab
    @State private var indicatorWidth: CGFloat = 0
    @State private var indicatorPosition: CGFloat = 0
    @State private var contentOffset: CGFloat = 0
    @Environment(\.colorScheme) var colorScheme
    
    /// Calculating Tab Width & Position
    func updateTabFrame(_ tabViewWidth: CGFloat) {
        let inputRange = tabs.indices.compactMap { index -> CGFloat? in
            return CGFloat(index) * tabViewWidth
        }
        
        let outputRangeForWidth = tabs.compactMap { tab -> CGFloat? in
            return tab.width
        }
        
        let outputRangeForPosition = tabs.compactMap { tab -> CGFloat? in
            return tab.minX
        }
        
        let widthInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForWidth)
        let positionInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForPosition)
        
        indicatorWidth = widthInterpolation.calculate(for: -contentOffset)
        indicatorPosition = positionInterpolation.calculate(for: -contentOffset)
    }
    
    func index(of tab: Tab) -> Int {
        return tabs.firstIndex(of: tab) ?? 0
    }
    
    func updateTabWithRect(tabId: UUID, rect: CGRect) {
        if let index = tabs.firstIndex(where: { $0.id == tabId }) {
            tabs[index].minX = rect.minX
            tabs[index].width = rect.width
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in // Loop over indices
                let tab = tabs[index] // Get the current tab by index
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        currentTab = tab
                        contentOffset = CGFloat(index) * UIScreen.main.bounds.width * -1 // Use index here
                        updateTabFrame(UIScreen.main.bounds.width)
                    }
                }) {
                    HStack {
                        // If it's the first tab (index == 0), you can add specific logic or views here
                        if index == 0 {
                            // Specific view or styling for the first tab
                            Image(systemName: tab.iconName ?? "circle")
                                .foregroundColor(currentTab.id == tab.id ? (colorScheme == .dark ? .white : .black) : .gray)
                        } else {
                            // General view for other tabs
                            if let iconName = tab.iconName {
                                Image(systemName: iconName)
                                    .foregroundColor(currentTab.id == tab.id ? (colorScheme == .dark ? .white : .black) : .gray)
                            } else if let imageName = tab.imageName {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20) // Adjust the frame as necessary
                            }
                        }
                        
                        if let title = tab.title {
                            Text(title)
                                .foregroundColor(currentTab.id == tab.id ? (colorScheme == .dark ? .white : .black) : .gray)
                                .padding(.leading, tab.iconName != nil || tab.imageName != nil ? 8 : 0) // Add padding if there is an icon/image
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear {
                                    let rect = proxy.frame(in: .global)
                                    if index == 0 {
                                        indicatorWidth = rect.width
                                        indicatorPosition = rect.minX
                                    }
                                    updateTabWithRect(tabId: tab.id, rect: rect)
                                }
                        }
                    )
                }
            }
        }
        .overlay(
            alignment: .bottomLeading,
            content: {
                Rectangle()
                    .frame(width: indicatorWidth, height: 3)
                    .offset(x: indicatorPosition, y: 10)
                    .animation(
                        .easeInOut(duration: 0.3),
                        value: indicatorPosition + indicatorWidth
                    )
            }
        )
        Divider()
            .frame(height: 10)
            .offset(y: 6)
    }
}

#Preview {
    TabsView(
        tabs: .constant(Tab.sampleTabs),
        currentTab: .constant(Tab.sampleTabs[2])
    )
}*/

