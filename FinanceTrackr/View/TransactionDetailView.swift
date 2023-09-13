//
//  TransactionDetailView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 13/09/2023.
//

import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    
    var body: some View {
        Text(transaction.transactionName)
        
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transaction: Transaction.example)
    }
}
