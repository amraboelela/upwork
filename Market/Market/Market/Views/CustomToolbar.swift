//
//  CustomToolbar.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

struct CustomToolbar<LeftContent: View, CenterContent: View, RightContent: View>: View {
    let leftContent: () -> LeftContent
    let centerContent: () -> CenterContent
    let rightContent: () -> RightContent
    
    var body: some View {
        HStack {
            leftContent()
                .frame(maxWidth: .infinity)
                .padding()
            centerContent()
                .frame(maxWidth: .infinity)
                .padding()
            rightContent()
                .frame(maxWidth: .infinity)
                .padding()
        }
        .background(Color.white)
    }
}

#Preview {
    CustomToolbar(
        leftContent: {
            HStack(spacing: 28) {
                Button(action: {
                    // Left button action
                }) {
                    Image(systemName: "square.fill.text.grid.1x2")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
            }
        },
        centerContent: {
            Text("Toolbar")
                .font(.headline)
        },
        rightContent: {
            HStack(spacing: 28) {
                Button(action: {
                    // Right button action
                }) {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
                Button(action: {
                    // Another right button action
                }) {
                    Image(systemName: "menucard")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
            }
        }
    )
}
