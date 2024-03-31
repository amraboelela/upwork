//
//  View.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

extension View {
    func offsetX(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let rect = proxy.frame(in: .global)
                    Color.clear
                        .preference(key: PickerOffsetKey.self, value: rect)
                        .onPreferenceChange(PickerOffsetKey.self, perform: completion)
                }
            }
    }
    
    func detectSwipe(onSwipe: @escaping (SwipeDirection) -> ()) -> some View {
        self
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let verticalDistance = value.location.y - value.startLocation.y
                        print("MarketTabView verticalDistance: \(verticalDistance)")
                        let swipeThreshold = 5.0
                        if verticalDistance > swipeThreshold {
                            onSwipe(.down)
                        } else if verticalDistance < -swipeThreshold {
                            onSwipe(.up)
                        }
                    }
            )
    }
    
    func read(offset: Binding<CGFloat>) -> some View {
        self
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            let minY = geo.frame(in: .global).minY
                            offset.wrappedValue = minY
                        }
                        .onChange(of: geo.frame(in: .global).minY) { newValue in
                            let diff = abs(offset.wrappedValue - newValue)
                            if diff > 1.0 {
                                offset.wrappedValue = newValue
                                //print("sticky offset: \(offset.wrappedValue)")
                            }
                        }
                }
            )
    }
    
    // Get Screen Size..
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

/// Preference Key
struct PickerOffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
