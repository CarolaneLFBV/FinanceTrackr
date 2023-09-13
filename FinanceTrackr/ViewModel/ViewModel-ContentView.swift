//
//  ViewModel-ContentView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

@MainActor class ViewModel: ObservableObject {
    @Published var transactions: [Transaction]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            transactions = try JSONDecoder().decode([Transaction].self, from: data)
        } catch {
            transactions = []
        }
    }
    
    func add(transactionName: String, typeTransaction: [String], paymentMethod: [String], transactionAmount: Double, transactionTag: String) {
        let newTransaction = Transaction(transactionName: transactionName, typeTransaction: typeTransaction, paymentMethod: paymentMethod, transactionAmount: transactionAmount, transactionTag: transactionTag)
        transactions.append(newTransaction)
        save()
        print("Added")
    }
    
    
    func update() {
        self.objectWillChange.send()
        print("Updated")
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(transactions)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func remove(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
        save()
        print("Deleted")
    }
    

}
