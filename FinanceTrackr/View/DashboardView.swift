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
    @Environment(\.dismiss) var dismiss
    
    @State private var isAddingExpense = false
    @State private var isNewMonth = false
    @State private var isMonthlyBudget = false
    @AppStorage("BudgetDisplayed") private var isMonthlyBudgetDisplayed = false

    @State private var totalIncome = 0.0
    @State private var totalExpense = 0.0
    
    @AppStorage("Budget") private var monthlyBudget = 0.0
    
    var monthlyBudgetCalculated: Double {
        let totalMonthlyBudget = (monthlyBudget + totalIncome) - totalExpense
        return totalMonthlyBudget
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        if isMonthlyBudgetDisplayed {
                            Text("Month's Budget: \(monthlyBudgetCalculated.formatted(.number))")
                                .font(.title2)
                                .bold()
                        }
                        HStack {
                            Text("Total Earned:")
                            Text("\(totalIncome.formatted(.number))")
                                .foregroundColor(.green)
                                .bold()
                        }
                        HStack {
                            Text("Total Spent:")
                            Text("\(totalExpense.formatted(.number))")
                                .foregroundColor(.red)
                                .bold()
                        }
                        
                    }
                    
                    if isMonthlyBudget {
                        Section("Add a budget") {
                            TextField("Amount", value: $monthlyBudget, format: .number)
                            Button("Ok") {
                                isMonthlyBudget = false
                            }
                        }
                    }
                    
                    Section {
                        List {
                            ForEach(viewModel.transactions) { transaction in
                                NavigationLink(destination: TransactionDetailView(transaction: transaction)) {
                                    TransactionRow(transaction: transaction)
                                }
                            }
                            .onDelete { index in
                                viewModel.removeTransaction(at: index)
                            }
                        }
                    }
                    
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Menu {
                            Button("New month", action: resetMonth)
                            Button("Add a budget") {
                                isMonthlyBudget = true
                                isMonthlyBudgetDisplayed = true
                            }
                            Button("Add a transaction") {
                                isAddingExpense = true
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                        .buttonStyle()
                    }
                }
            }
            .sheet(isPresented: $isAddingExpense) {
                AddTransactionView(viewModel: viewModel)
            }
            .navigationTitle("Dashboard")
        }
        .onChange(of: viewModel.transactions) { value in
            updateDashboard()
        }
        .onAppear(perform: retrieveTotalAmount)
    }
    
    func retrieveTotalAmount() {
        for transaction in viewModel.transactions {
            switch transaction.typeTransaction {
            case "Income":
                totalIncome += transaction.transactionAmount
            case "Expense":
                totalExpense += transaction.transactionAmount
            default:
                totalIncome = 0
                totalExpense = 0
            }
        }
    }
    
    func updateDashboard() {
        totalIncome = 0
        totalExpense = 0
        retrieveTotalAmount()
    }
    
    func resetMonth() {
        viewModel.reset()
        monthlyBudget = 0.0
        isMonthlyBudgetDisplayed = false
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
