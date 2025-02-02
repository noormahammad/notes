//
//  ContentView.swift
//  Simple Bank Account app using Swift UI
//
//  Created by Noor on 2/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var bankAccount = BankAccount(funds:10800)
    @State var depositAmount = 0.0
    @State var withdrawAmount = 0.0
    @State var transactions = ["No Transactions yet!"]
    var body: some View {
        NavigationStack {
            Form {
                Section ("Total Balance") {
                    Text(bankAccount.funds, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .font(.title)
                        .foregroundStyle(.green)
                }
                
                Section("Deposit") {
                    HStack {
                        TextField("Amount", value: $depositAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            
                        Button("Deposit") {
                            bankAccount.deposit(amount: depositAmount)
                            transactions = ["$\(depositAmount) has been deposited"] + transactions
                        }
                        .foregroundStyle(.green)
                    }
                }
                
                Section("Withdraw") {
                    HStack{
                        TextField("Amount", value:$withdrawAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        
                        Button("Withdraw") {
                            bankAccount.withdraw(amount: withdrawAmount)
                            transactions = ["$\(withdrawAmount) has been withdrawn"] + transactions
                        }
                        .foregroundStyle(.red)
                    }
                }
                
                Section("Transactions") {
                    ForEach(transactions, id: \.self) { transaction in
                        Text(transaction)
                    }
                }
            }
            .navigationTitle("Bank Acccount")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BankAccount {
    private(set) var funds = 0.0
    mutating func deposit(amount: Double) {
        funds += amount
    }
    mutating func withdraw(amount: Double) {
        funds -= amount
    }
}

#Preview {
    ContentView()
}
