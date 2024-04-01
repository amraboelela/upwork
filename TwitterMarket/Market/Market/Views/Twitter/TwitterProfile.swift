//
//  TwitterProfile.swift
//  market
//
//  Created by Nicholas Nelson on 3/27/24.
//

import SwiftUI

struct TwitterProfile: View {
    @State var offset: CGFloat = 0
    @State var scrollViewHeight: CGFloat = 0.0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeaderView(offset: $offset)
            VStack {
                ProfileHeader()
                ProfileView()
                TwitterTabView(scrollViewHeight: $scrollViewHeight)
            }
            .padding(.horizontal)
            // Moving the view back if it goes > 80...
            .zIndex(-offset > 80 ? 0 : 1)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background (
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        scrollViewHeight = geometry.size.height
                        print("scrollViewHeight: \(scrollViewHeight)")
                    }
            }
        )
    }
}

#Preview {
    TwitterProfile()
        .preferredColorScheme(.dark)
}
