//
//  Account.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

struct Account: Identifiable, Codable {
    var id: UUID
    var accountName: String
    var bankName: String
    
    init(id: UUID = UUID(), accountName: String, bankName: String) {
        self.id = id
        self.accountName = accountName
        self.bankName = bankName
    }
    
    static let example = Account(accountName: "Livret 1", bankName: "Caisse d'Épargne")
}
