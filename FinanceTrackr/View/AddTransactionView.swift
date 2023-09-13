//
//  AddExpenseView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var transactionName = ""
    @State private var transactionAmount = 0.0
    @State private var transactionTag = ""
    
    @State private var transactionTypes = ["Income", "Expense"]
    @State private var selectedTransactionType = "Income"
    
    @State private var paymentMethods = ["Credit Card", "Debit Card", "Cash", "Online", "Third-party"]
    @State private var selectedPaymentMethod = "Credit Card"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Transaction's type") {
                    Picker("Transaction's type", selection: $selectedTransactionType) {
                        ForEach(transactionTypes, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Payment Method") {
                    Picker("Payment Method", selection: $selectedPaymentMethod) {
                        ForEach(paymentMethods, id: \.self) { item in
                            Text(item)
                        }
                    }
                }
                
                Section("Transaction's informations") {
                    TextField("Name", text: $transactionName)
                        .limitInputLength(value: $transactionName, length: 10)
                    TextField("Amount", value: $transactionAmount, format: .number)
                    TextField("Tag", text: $transactionTag)
                        .limitInputLength(value: $transactionName, length: 10)
                }
            }
            .navigationTitle("Add a transaction")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        addTransaction()
                    }
                    .disabled(transactionName.isEmpty && transactionAmount.isZero)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addTransaction() {
        viewModel.add(transactionName: transactionName, typeTransaction: Array(arrayLiteral: selectedTransactionType), paymentMethod: Array(arrayLiteral: selectedPaymentMethod), transactionAmount: transactionAmount, transactionTag: transactionTag)
        viewModel.update()
        dismiss()
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView(viewModel: ViewModel())
    }
}
