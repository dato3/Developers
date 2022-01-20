//
//  CardView.swift
//  Developers
//
//  Created by Daulet on 21.11.2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var isInCardView: Bool = true
    @State private var isAnimating: Bool = false
    @State private var moveDown: Bool = false
    let card: Card
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
            if isInCardView {
                Image(card.imageName)
                    .opacity(isAnimating ? 1.0 : 0.0)
            } else {
                Text(card.message)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            VStack(spacing: 8) {
                Group {
                    Text(card.title)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    Text(card.headline)
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .italic()
                } //: Group
                .offset(y: moveDown ? 0.0 : -20.0)
                Spacer()
                if isInCardView {
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.5)) {
                            isInCardView = false
                        }
                        playSound()
                        haptics.impactOccurred()
                    }, label: {
                        Text(card.callToAction.uppercased())
                            .foregroundColor(.white)
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.heavy)
                            Image(systemName: "arrow.right.circle")
                            .font(Font.title.weight(.medium))
                            .foregroundColor(.white)
                    }) //: Button
                        .padding(.vertical)
                        .padding(.horizontal, 24)
                        .background(
                            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                        .padding(.bottom, 30)
                        .offset(y: moveDown ? 0 : 20)
                } else {
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.5)) {
                            isInCardView = true
                        }
                    }, label: {
                        Image(systemName: "arrow.left.circle")
                            .font(Font.title.weight(.medium))
                            .foregroundColor(.white)
                        Text("Go back".uppercased())
                            .foregroundColor(.white)
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.heavy)
                    }) //: Button
                        .padding(.vertical)
                        .padding(.horizontal, 24)
                        .background(
                            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                        .padding(.bottom, 30)
                }
            } //: VStack
        } //: ZStack
        .frame(width: 335, height: 545, alignment: .center)
        .cornerRadius(16)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 12, x: 0, y: 0)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.isAnimating.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDown.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[0])
//            .previewLayout(.sizeThatFits)
//            .padding()
    }
}
