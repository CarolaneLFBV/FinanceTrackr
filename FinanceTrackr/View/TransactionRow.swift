//
//  ExpenseRow.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 09/09/2023.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: transaction.typeTransaction.contains("Income") ? "arrow.right" : "arrow.left")
                    .foregroundColor(transaction.typeTransaction.contains("Income") ? .green : .red)
                
                VStack(alignment: .leading) {
                    Text(transaction.transactionName)
                        .foregroundColor(transaction.typeTransaction.contains("Income") ? .green : .red)
                        .bold()
                    Text(transaction.transactionDescription ?? "Description not available")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                HStack {
                    Text("€\(transaction.transactionAmount.formatted(.number))")
                        .bold()
              
                    Text(transaction.transactionCategory)
                        .padding(3)
                        .font(.caption)
                        .background(.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                }
            }
            
        }
        .padding(.vertical, 5)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: Transaction.example)
    }
}
