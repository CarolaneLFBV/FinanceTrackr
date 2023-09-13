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
            Text("test")
            VStack {
                HStack {
                    VStack {
                        Text("Total Income")
                            .font(.title3)
                        Text("\(totalIncome.formatted(.number))")
                            .font(.title3).bold().foregroundColor(.green)
                    }
                    .cardboardStyle()
                    
                    Spacer()
                    
                    VStack {
                        Text("Total Spent")
                            .font(.title3)
                        Text("\(totalExpense.formatted(.number))")
                            .font(.title3).bold().foregroundColor(.red)
                    }
                    .cardboardStyle()
                }
                .padding([.horizontal, .vertical])
            }
                        
            List {
                ForEach(viewModel.transactions) { transaction in
                    NavigationLink(destination: TransactionDetailView(transaction: transaction)) {
                        TransactionRow(transaction: transaction)
                    }
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
            case ["expense"]:
                totalExpense += transaction.transactionAmount
            default:
                totalIncome = 0
                totalExpense = 0
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
