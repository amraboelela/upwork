//
//  StickyHeaderView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI
 
struct StickyHeaderView: View {
    @Binding var offset: CGFloat
    //@State var titleOffset: CGFloat = 0
    var initialHeight = 180.0
    var minDistance = 80.0
    
    var blurViewOpacity: Double {
        let progress = -(offset + 80) / 150
        return Double(-offset > 80 ? progress : 0)
    }
    
    func getTitleTextOffset() -> CGFloat {
        // some amount of progress for slide effect..
        let progress = 20 / offset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color.black
                HStack(spacing: 10) {
                    Text("@Kavsoft")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("150 Tweets")
                        .foregroundColor(.white)
                }
                // to slide from bottom added extra 60..
                .offset(y: initialHeight - 60.0)
                .offset(y: offset > 100 ? 0 : -getTitleTextOffset())
            }
            .opacity(blurViewOpacity)
            .clipped()
            .frame(height: offset > 0 ? initialHeight + offset : nil)
            .offset(y: offset > 0 ? -offset : -offset < minDistance ? 0 : -offset - minDistance)
            .read(offset: $offset, name: "StickyHeaderView offset")
            .zIndex(1)
        }
        .frame(height: initialHeight)
        .zIndex(1)
    }
}

#Preview {
    StickyHeaderView(offset: .constant(-251))
}

