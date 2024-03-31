//
//  ProfileView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Kavsoft")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text("@_Kavsoft")
                .foregroundColor(.gray)
            Text("Kavsoft is a channel where I make videos on SwiftUI Website: https://kavsoft.dev, Patreon: http://patreon.com/kavsoft")
            HStack(spacing: 5) {
                Text("13")
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                Text("Followers")
                    .foregroundColor(.gray)
                Text("680")
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                    .padding(.leading, 10)
                Text("Following")
                    .foregroundColor(.gray)
            }
            .padding(.top,8)
        }
    }
}

#Preview {
    ProfileView()
}
