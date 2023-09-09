//
//  Expense.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id: UUID
    var expenseName: String
    var expenseAmount: Double
    var expenseTag: String
    
    init(id: UUID = UUID(), expenseName: String, expenseAmount: Double, expenseTag: String) {
        self.id = id
        self.expenseName = expenseName
        self.expenseAmount = expenseAmount
        self.expenseTag = expenseTag
    }
    
    static let example = Expense(expenseName: "Vinted", expenseAmount: 130, expenseTag: "test")
}
