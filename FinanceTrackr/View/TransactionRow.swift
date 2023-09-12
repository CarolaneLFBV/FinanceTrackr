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
                Image(systemName: transaction.typeTransaction.contains("income") ? "arrow.right" : "arrow.left")
                    .foregroundColor(transaction.typeTransaction.contains("income") ? .green : .red)
                
                Text(transaction.transactionName)
                Text("\(transaction.transactionAmount.formatted(.number))")
                    .bold()
                Spacer()
                Text(transaction.transactionTag)
                    .tagStyle()
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
