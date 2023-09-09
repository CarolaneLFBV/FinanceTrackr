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
    var account: Account
    
    init(id: UUID = UUID(), expenseName: String, expenseAmount: Double, expenseTag: String, account: Account) {
        self.id = id
        self.expenseName = expenseName
        self.expenseAmount = expenseAmount
        self.expenseTag = expenseTag
        self.account = account
    }
    
    static let example = Expense(expenseName: "Vinted", expenseAmount: 130, expenseTag: "test", account: Account.example)
}
