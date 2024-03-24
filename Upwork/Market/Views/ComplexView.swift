//
//  ListView.swift
//  market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

struct ComplexView: View {
    var onSwipeUp: (() -> Void)?
    var body: some View {
        VStack {
            Text("Complex View")
                .font(.title)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
            Button("Click Me") {
                print("Button clicked")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

#Preview {
    ComplexView()
}
