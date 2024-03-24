//
//  Tab.swift
//  Market
//
//  Created by Amr Aboelela on 3/24/24.
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
    static var sampleTabs: [Tab] = [
        .init(iconName: "square"),
        .init(iconName: "triangle"),
        .init(iconName: "circle"),
        .init(iconName: "diamond")
    ]
}
