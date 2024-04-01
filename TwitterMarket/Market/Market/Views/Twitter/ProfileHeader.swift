//
//  ProfileHeader.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct ProfileHeader: View {
    //@Binding var offset: CGFloat
    //@Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Spacer()
            Button(
                action: {},
                label: {
                    Text("Edit Profile")
                        .foregroundColor(.blue)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .stroke(Color.blue, lineWidth: 1.5)
                        )
                }
            )
        }
        .padding(.top, -25)
        .padding(.bottom, -10)
    }
}

#Preview {
    ProfileHeader()
}
