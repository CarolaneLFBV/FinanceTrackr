//
//  ViewModel-ContentView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

@MainActor class ViewModel: ObservableObject {
    @Published var transactions: [Transaction]
//    @Published var categories: [Transaction.Category]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            transactions = try JSONDecoder().decode([Transaction].self, from: data)
        } catch {
            transactions = []
        }
    }
    
    func addTransaction(transactionName: String, typeTransaction: String, paymentMethod: String, transactionAmount: Double, transactionDescription: String?) {
        let newTransaction = Transaction(transactionName: transactionName, typeTransaction: typeTransaction, paymentMethod: paymentMethod, transactionAmount: transactionAmount, transactionDescription: transactionDescription)
        transactions.append(newTransaction)
        save()
    }
    
    func update() {
        self.objectWillChange.send()
    }
    
    func save() {
        do {
            let transactionData = try JSONEncoder().encode(transactions)
            try transactionData.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
            print("Unable to save data.")
        }
    }
    
    func removeTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
        save()
    }
}
