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
                
                Text(transaction.transactionName)
                    .foregroundColor(transaction.typeTransaction.contains("Income") ? .green : .red)
                    .bold()
                
                Spacer()
                
                Text("\(transaction.transactionAmount.formatted(.number))")
                    .bold()
            }
            .padding([.vertical])
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: Transaction.example)
    }
}
