//
//  Account.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

struct Account: Identifiable, Codable {
    var id: UUID
    var name: String
    var totalAmount: Int16
    var bankName: String
    
    init(id: UUID = UUID(), name: String, totalAmount: Int16, bankName: String) {
        self.id = id
        self.name = name
        self.totalAmount = totalAmount
        self.bankName = bankName
    }
    
    static let example = Account(name: "Livret 1", totalAmount: 3000, bankName: "Caisse d'Épargne")
}
