//
//  TagStyle.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 12/09/2023.
//

import SwiftUI

struct TagStyleComponent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.all], 8)
            .background(.gray.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func tagStyle() -> some View {
        modifier(TagStyleComponent())
    }
}
