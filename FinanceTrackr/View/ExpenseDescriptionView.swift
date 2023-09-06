//
//  ExpenseDescriptionView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import SwiftUI

struct ExpenseDescriptionView: View {
    let expense: Expense
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Transaction Informations") {
                    Text("$\(expense.amount)")
                    Text(expense.tag)
                }
                
                Section("Account information") {
                    Text("Withdraw account: \(expense.account.name)")
                    Text("Belongs to: \(expense.account.bankName)")
                }
                
                Section {
                    Button("Delete transaction", role: .destructive) {}
                }
            }
            .navigationTitle(expense.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Done", action: dismiss.callAsFunction)
                }
            }
        }
    }
}

struct ExpenseDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDescriptionView(expense: Expense.example)
    }
}
