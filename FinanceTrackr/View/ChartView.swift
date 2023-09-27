//
//  ChartView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 17/09/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            Chart {
                ForEach(viewModel.transactions) { transaction in
                    if transaction.typeTransaction == "Expense" {
                        SectorMark(angle: .value("Amount", transaction.transactionAmount), innerRadius: .ratio(0.618), angularInset: 1.5)
                            .cornerRadius(5)
                            .foregroundStyle(by: .value("Category", transaction.transactionCategory))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
   ChartView()
}
//SectorMark(angle: .value("Amount", transaction.transactionAmount)
//      .foregroundStyle(by: .value("Category", transaction.transactionCategory))
