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
    
    func add(expenseName: String, expenseAmount: Double, expenseTag: String, account: Account) {
        let newExpense = Expense(expenseName: expenseName, expenseAmount: expenseAmount, expenseTag: expenseTag, account: account)
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
