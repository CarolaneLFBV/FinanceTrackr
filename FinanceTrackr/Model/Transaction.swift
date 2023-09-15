//
//  Expense.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case food = "Food"
    case shopping = "Shopping"
    case school = "School"
    case work = "Work"
    case principal = "Withdrawal"
    case secondaire = "Money transfer"
}

struct Transaction: Identifiable, Codable, Equatable {
    var id: UUID
    var transactionName: String
    var typeTransaction: String
    var paymentMethod: String
    var transactionAmount: Double
    var transactionDescription: String?
//    var transactionCategory: Category
    
    init(id: UUID = UUID(), transactionName: String, typeTransaction: String, paymentMethod: String, transactionAmount: Double, transactionDescription: String?) {
        self.id = id
        self.transactionName = transactionName
        self.transactionAmount = transactionAmount
        self.paymentMethod = paymentMethod
        self.typeTransaction = typeTransaction
        self.transactionDescription = transactionDescription
//        self.transactionCategory = transactionCategory
    }
    
    static let example = Transaction(transactionName: "Vinted", typeTransaction: "Income", paymentMethod: "Credit Card", transactionAmount: 130.59, transactionDescription: "")
}
