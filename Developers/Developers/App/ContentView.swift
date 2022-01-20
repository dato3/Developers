//
//  ContentView.swift
//  Developers
//
//  Created by Daulet on 21.11.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardData) { card in
                    CardView(card: card)
                } //: Loop
            } //: HStack
            .padding(20)
        } //: ScrollView
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
