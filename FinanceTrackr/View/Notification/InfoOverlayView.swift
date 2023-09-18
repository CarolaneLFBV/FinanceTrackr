//
//  InfoOverlayView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 18/09/2023.
//

import SwiftUI

struct InfoOverlayView: View {
    let infoMessage: String
    let buttonTitle: String
    let systemImageName: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Text(infoMessage)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            Button {
                action()
            } label: {
                Label(buttonTitle, systemImage: systemImageName)
            }
            .padding()
            .backgroundStyle(Color(.systemGray5))
            .cornerRadius(5)
        }
    }
}

struct InfoOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        InfoOverlayView(infoMessage: "", buttonTitle: "", systemImageName: "", action: {})
    }
}
