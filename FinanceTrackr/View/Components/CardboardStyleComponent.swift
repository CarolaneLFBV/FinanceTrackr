//
//  CardboardStyle.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 13/09/2023.
//

import SwiftUI

struct CardBoardStyleComponent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(width: 150, height: 100)
            .shadow(color: .black.opacity(0.4), radius: 5, x: 5, y: 1)
    }
}

extension View {
    func cardboardStyle() -> some View {
        modifier(CardBoardStyleComponent())
    }
}
