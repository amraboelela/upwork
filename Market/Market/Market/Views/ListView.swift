//
//  ListView.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

struct ListView: View {
    let onSwipe: (SwipeDirection) -> Void
    @State private var previousOffset: CGFloat = 0
    @State private var currentOffset: CGFloat = 0
    @State private var swipeDirection: SwipeDirection = .none
    @State private var prevDirection: SwipeDirection = .none
    
    func determineScrollDirection() {
        guard abs(currentOffset - previousOffset) > 30 else {
            return
        }
        if currentOffset > previousOffset {
            swipeDirection = .down
        } else if currentOffset < previousOffset {
            swipeDirection = .up
        } else {
            swipeDirection = .none
        }
        print("swipeDirection: \(swipeDirection)")
        if prevDirection == swipeDirection {
            if swipeDirection != .none {
                onSwipe(swipeDirection)
            }
        }
        previousOffset = currentOffset
        prevDirection = swipeDirection
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<20) { item in
                    Text("List Item \(item)")
                        .padding()
                }
            }
            .padding()
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onChange(of: geo.frame(in: .global).minY) { newValue in
                            currentOffset = newValue
                            determineScrollDirection()
                        }
                }
            )
        }
    }
}

#Preview {
    ListView(onSwipe: {_ in })
}
