//
//  ListView.swift
//  market
//
//  Created by Amr Aboelela on 3/24/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<20) { item in
                    Text("List Item \(item)")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ListView()
}
