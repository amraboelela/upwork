//
//  TabButton.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

// Tab Button...
struct TabButton: View {
    var tab: Tab
    @Binding var currentTab: Tab
    //var animation: Namespace.ID = Namespace().wrappedValue
    
    var title: String {
        tab.title ?? ""
    }
    
    var body: some View {
        Button(
            action: {
                withAnimation {
                    currentTab = tab
                }
            },
            label: {
                // if i use LazyStack then the text is visible fully in scrollview...
                // may be its a bug...
                LazyVStack(spacing: 12) {
                    Text(title)
                        .fontWeight(.semibold)
                        .foregroundColor(currentTab.title == tab.title ? .blue : .gray)
                        .padding(.horizontal)
                    if currentTab.title == tab.title {
                        Capsule()
                            .fill(Color.blue)
                            .frame(height: 1.2)
                            //.matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 1.2)
                    }
                }
            }
        )
    }
}

#Preview {
    TabButton(
        tab: Tab.twitterTabs[0],
        currentTab: .constant(Tab.twitterTabs[0])
    )
}
