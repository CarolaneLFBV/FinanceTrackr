//
//  Expense.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id: UUID
    var name: String
    var amount: Int16
    var tag: String
    var account: Account
    
    init(id: UUID = UUID(), name: String, amount: Int16, tag: String, account: Account) {
        self.id = id
        self.name = name
        self.amount = amount
        self.tag = tag
        self.account = account
    }
    
    static let example = Expense(name: "Vinted", amount: 130, tag: "test", account: Account.example)
}
