//
//  StickyHeaderView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI
 
struct StickyHeaderView: View {
    @Binding var offset: CGFloat
    @State var titleOffset: CGFloat = 0
    
    func blurViewOpacity() -> Double {
        let progress = -(offset + 80) / 150
        return Double(-offset > 80 ? progress : 0)
    }
    
    func getTitleTextOffset() -> CGFloat{
        // some amount of progress for slide effect..
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    
    var body: some View {
        GeometryReader { proxy -> AnyView in
            // Sticky Header...
            let minY = proxy.frame(in: .global).minY
            Task {
                self.offset = minY
            }
            return AnyView(
                ZStack {
                    BlurView()
                        .opacity(blurViewOpacity())
                    HStack(spacing: 10) {
                        Text("@Kavsoft")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("150 Tweets")
                            .foregroundColor(.white)
                    }
                    // to slide from bottom added extra 60..
                    .offset(y: 120)
                    .offset(y: titleOffset > 100 ? 0 : -getTitleTextOffset())
                    .opacity(titleOffset < 100 ? 1 : 0)
                }
                    .clipped()
                    .frame(height: minY > 0 ? 180 + minY : nil)
                    .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
            )
        }
        .frame(height: 180)
        .zIndex(1)
    }
}

#Preview {
    StickyHeaderView(offset: .constant(-100.0))
}

