//
//  DashboardView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import SwiftUI
import Charts

struct DashboardView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var isAddingExpense = false
    
    @State private var totalIncome = 0.0
    @State private var totalExpense = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                        HStack {
                            Text("Total Income")
                            Text("\(totalIncome.formatted(.number))")
                        }
                        
                        HStack {
                            Text("Total Spent")
                            Text("\(totalExpense.formatted(.number))")
                        }
                }
                
                List {
                    ForEach(viewModel.transactions) { transaction in
                        TransactionRow(transaction: transaction)
                    }
                    .onDelete { index in
                        viewModel.remove(at: index)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Add") {
                        isAddingExpense = true
                    }
                }
            }
            .sheet(isPresented: $isAddingExpense) {
                AddTransactionView(viewModel: viewModel)
            }
            .navigationTitle("Dashboard")
        }
        .onChange(of: viewModel.transactions) { value in
            totalIncome = 0
            totalExpense = 0
            retrieveTotalAmount()
        }
        .onAppear(perform: retrieveTotalAmount)
    }
    
    func retrieveTotalAmount() {
        for transaction in viewModel.transactions {
            switch transaction.typeTransaction {
            case ["income"]:
                totalIncome += transaction.transactionAmount
            default:
                totalExpense += transaction.transactionAmount
            }
        }
        
//        if transaction.typeTransaction.contains("income") {
//            totalIncome += transaction.transactionAmount
//        } else if transaction.typeTransaction.contains("expense") {
//            totalExpense += transaction.transactionAmount
//        } else {
//
//        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
