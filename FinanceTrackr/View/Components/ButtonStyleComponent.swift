//
//  ButtonStyleComponent.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 16/09/2023.
//

import SwiftUI

struct ButtonStyleComponent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .font(.title)
            .clipShape(Circle())
            .padding(.trailing)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyleComponent())
    }
}

