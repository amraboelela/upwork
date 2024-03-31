//
//  ProfileHeader.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct ProfileHeader: View {
    @Binding var offset: CGFloat
    @Environment(\.colorScheme) var colorScheme
    
    // Profile Shrinking Effect...
    func getOffset() -> CGFloat{
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    
    func getScale() -> CGFloat {
        let progress = -offset / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
    
    var body: some View {
        HStack {
            /*Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .padding(8)
                .background(colorScheme == .dark ? Color.black : Color.white)
                .clipShape(Circle())
                .offset(y: offset < 0 ? getOffset() - 20 : -20)
                .scaleEffect(getScale())*/
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
                                .stroke(Color.blue,lineWidth: 1.5)
                        )
                }
            )
        }
        .padding(.top,-25)
        .padding(.bottom,-10)
    }
}

#Preview {
    ProfileHeader(offset: .constant(0.0))
}
