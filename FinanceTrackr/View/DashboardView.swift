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
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Total Income")
            }
            
            List {
                ForEach(viewModel.transactions) { transaction in
                    TransactionRow(transaction: transaction)
                }
                .onDelete { index in
                    viewModel.remove(at: index)
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
    }
    
    func retrieveIncome() {
        ForEach(viewModel.transactions) { transaction in
            if transaction.typeTransaction.contains("income") {
                totalIncome = totalIncome + transaction.transactionAmount
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
