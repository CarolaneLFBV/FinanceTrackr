//
//  AddExpenseView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var expenseName = ""
    @State private var expenseAmount = 0.0
    @State private var expenseTag = ""
    @State private var accountName = ""
    @State private var bankName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Transaction's informations") {
                    TextField("Transaction's name", text: $expenseName)
                    TextField("Transaction's amount", value: $expenseAmount, format: .number)
                    TextField("Transaction's tag", text: $expenseTag)
                }
                
                Section("Account information") {
                    TextField("Account", text: $accountName)
                    TextField("Belongs to", text: $bankName)
                }
            }
            .navigationTitle("Add a transaction")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Save") {
                        addTransaction()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addTransaction() {
        viewModel.add(expenseName: expenseName, expenseAmount: expenseAmount, expenseTag: expenseTag, account: Account(accountName: accountName, bankName: bankName))
        viewModel.update()
        dismiss()
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(viewModel: ViewModel())
    }
}
