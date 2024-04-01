//
//  Tab.swift
//  Market
//
//  Created by Amr Aboelela on 3/30/24.
//

import Foundation

struct Tab: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String?
    var imageName: String?
    var iconName: String?
    var width: CGFloat = 0
    var minX: CGFloat = 0
    
    // Title is same as the Asset Image Name
    static var newSampleTabs: [Tab] = [
        .init(iconName: "square"),
        .init(iconName: "triangle"),
        .init(iconName: "circle"),
        .init(iconName: "diamond")
    ]
    
    // Title is same as the Asset Image Name
    static var profileSampleTabs: [Tab] = [
        .init(iconName: "globe"),
        .init(iconName: "circle.grid.2x1"),
        .init(iconName: "chart.xyaxis.line"),
        .init(iconName: "flowchart"),
        .init(iconName: "hammer"),
        .init(iconName: "banknote"),
        .init(iconName: "checkmark.circle"),
        .init(iconName: "person")
    ]

    static var twitterTabs: [Tab] = [
        .init(title: "Tweets"),
        .init(title: "Tweets & Likes"),
        .init(title: "Media"),
        .init(title: "Likes")
    ]
}
