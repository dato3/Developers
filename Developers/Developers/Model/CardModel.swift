//
//  CardModel.swift
//  Developers
//
//  Created by Daulet on 21.11.2021.
//

import SwiftUI

// MARK: - CARD MODEL
struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
