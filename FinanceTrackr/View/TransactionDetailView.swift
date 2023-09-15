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
        NavigationStack {
            VStack {
                Form {
                    Section("Information") {
                        Text("Amount of the transaction: €\(transaction.transactionAmount.formatted(.number))")
                        Text("Description: \(transaction.transactionDescription ?? "No description available")")
//                        Text("\(transaction.transactionCategory.categoryName)")
                    }
                    Section("Additional information") {
                        Text("Type of transaction: \(transaction.typeTransaction)")
                        Text("Payment method: \(transaction.paymentMethod)")
                    }
                }
            }
            .navigationTitle("Transaction: \(transaction.transactionName)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transaction: Transaction.example)
    }
}
