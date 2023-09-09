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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.expenses) { expense in
                    Text(expense.expenseName)
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
                AddExpenseView(viewModel: ViewModel())
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
