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
    @State private var transactionType = ["income", "expense"]
    @State private var selectedTransactionType = "income"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Transaction's type") {
                    Picker("Transaction's type", selection: $selectedTransactionType) {
                        ForEach(transactionType, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Transaction's informations") {
                    TextField("Name", text: $transactionName)
                    TextField("Amount", value: $transactionAmount, format: .number)
                    TextField("Tag", text: $transactionTag)
                }
            }
            .navigationTitle("Add a transaction")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        addTransaction()
                    }
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
        viewModel.add(transactionName: transactionName, typeTransaction: Array(arrayLiteral: selectedTransactionType), transactionAmount: transactionAmount, transactionTag: transactionTag)
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
