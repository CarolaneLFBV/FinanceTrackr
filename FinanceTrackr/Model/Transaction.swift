//
//  Expense.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

struct Transaction: Identifiable, Codable, Equatable {
    var id: UUID
    var transactionName: String
    var typeTransaction: [String]
    var paymentMethod: [String]
    var transactionAmount: Double
    var transactionTag: String
    
    init(id: UUID = UUID(), transactionName: String, typeTransaction: [String], paymentMethod: [String], transactionAmount: Double, transactionTag: String) {
        self.id = id
        self.transactionName = transactionName
        self.transactionAmount = transactionAmount
        self.paymentMethod = paymentMethod
        self.transactionTag = transactionTag
        self.typeTransaction = typeTransaction
    }
    
    static let example = Transaction(transactionName: "Vinted", typeTransaction: ["Income"], paymentMethod: ["Credit Card"], transactionAmount: 130.54, transactionTag: "Vinted")
}