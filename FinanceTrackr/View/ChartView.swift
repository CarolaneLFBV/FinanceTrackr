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
                    if transaction.typeTransaction == "Income" {
                        BarMark(x: .value("Category", transaction.transactionCategory), y: .value("Amount", transaction.transactionAmount))
                            .foregroundStyle(.green)
                    } else {
                        BarMark(x: .value("Category", transaction.transactionCategory), y: .value("Amount", transaction.transactionAmount))
                            .foregroundStyle(.red)
                    }
                }
            }
            .onChange(of: viewModel.transactions.count) { value in
                print("test")
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
