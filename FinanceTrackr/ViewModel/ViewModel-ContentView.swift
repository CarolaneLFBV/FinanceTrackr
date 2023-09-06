//
//  ViewModel-ContentView.swift
//  FinanceTrackr
//
//  Created by Carolane Lefebvre on 06/09/2023.
//

import Foundation

@MainActor class ViewModel: ObservableObject {
    @Published private(set) var expenses: [Expense]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            expenses = try JSONDecoder().decode([Expense].self, from: data)
        } catch {
            expenses = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(expenses)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func add(name: String, amount: Int16, tag: String, account: Account, nameAccount: String, totalAmount: Int16, bankName: String ) {
        let newExpense = Expense(name: name, amount: amount, tag: tag, account: Account(name: nameAccount, totalAmount: totalAmount, bankName: bankName))
        expenses.append(newExpense)
        save()
        print("Added")
    }
    
    func update() {
        self.objectWillChange.send()
        print("Updated")
    }
    
    func remove(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
        save()
        print("Deleted")
    }
}
