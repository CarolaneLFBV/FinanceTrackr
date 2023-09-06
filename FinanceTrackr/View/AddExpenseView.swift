//
//  AddExpenseView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var viewModel: ViewModel
    
    @State private var name = ""
    @State private var amount = 0
    @State private var tag = String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(viewModel: ViewModel)
    }
}
