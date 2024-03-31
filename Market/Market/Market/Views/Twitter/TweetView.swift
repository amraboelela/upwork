//
//  TweetView.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import SwiftUI

struct TweetView: View {
    var tweet: String
    var tweetImage: String?
    
    var body: some View {
        /*
        HStack(alignment: .top, spacing: 10, content: {
    
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10, content: {
                
                (
                    
                    Text("Kavsoft  ")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        
                        +
                        
                        Text("@_Kavsoft")
                        .foregroundColor(.gray)
                )
                
                Text(tweet)
                    .frame(maxHeight: 100, alignment: .top)
                
                if let image = tweetImage{
                    
                    GeometryReader{proxy in
                        
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.frame(in: .global).width, height: 250)
                            .cornerRadius(15)
                    }
                    .frame(height: 250)
                }
            })
        })
        */
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Kavsoft  ")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                +
                Text("@_Kavsoft")
                    .foregroundColor(.gray)
                Text(tweet)
                    .frame(maxHeight: 100, alignment: .top)
                /*if let image = tweetImage {
                    GeometryReader { proxy in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: proxy.frame(in: .global).width,
                                height: 250
                            )
                            .cornerRadius(15)
                    }
                    .frame(height: 250)
                }*/
            }
        }
    }
}

#Preview {
    TweetView(
        tweet: Constants.sampleText
    )
}
