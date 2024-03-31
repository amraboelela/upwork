//
//  NewViewCustomToolbar.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

struct NewViewCustomToolbar: View {
    var body: some View {
        CustomToolbar(
            leftContent: {
                AnyView(HStack(spacing: 28) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                    
                })
            },
            centerContent: {
                AnyView(Text("Toolbar").font(.headline))
            },
            rightContent: {
                AnyView(HStack(spacing: 28) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                    Button(action: {
                        
                    }) {
                        Image(systemName: "menucard")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                })
            }
        )
    }
}

#Preview {
    NewViewCustomToolbar()
}
