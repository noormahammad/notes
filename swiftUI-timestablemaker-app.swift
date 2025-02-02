//
//  ContentView.swift
//  test1
//
//  Created by noor on 2/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var inputNumber = 2
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Which times table you want to see?") {
                    TextField("", value: $inputNumber, format: .number)
                }
                Section {
                    Text("\(inputNumber) Times Table")
                        .listRowBackground(Color.purple.opacity(0.4))
                        .frame(width: 400, height: 30, alignment: .center)
                    ForEach(1..<11) {
                        Text("\(inputNumber) x \($0) = \(inputNumber * $0)")
                    }
                }
                .listRowBackground(Color.purple.opacity(0.1))
                
            }
            .navigationTitle("Time Tables Maker")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
