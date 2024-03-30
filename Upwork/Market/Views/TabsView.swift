//
//  TabsView.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI
 
struct TabsView: View {
    @Binding var tabs: [Tab]
    @Binding var currentTab: Tab
    @Binding var indicatorWidth: CGFloat
    @Binding var indicatorPosition: CGFloat
    @Environment(\.colorScheme) var colorScheme
    
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
        tabs: .constant(Tab.newSampleTabs),
        currentTab: .constant(Tab.newSampleTabs[0]),
        indicatorWidth: .constant(100.0),
        indicatorPosition: .constant(0.0)
    )
}

