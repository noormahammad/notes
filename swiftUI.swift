//
//  ContentView.swift
//  WeSplit
//
//  Created by noor on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    let students = ["Tom", "Micheal", "Balaji","Satya", "Sundar Pichai"]
    @State private var name = ""
    @State private var selectedStudent = "Micheal"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Section {
                    Picker("Select a student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                
                Section {
                    ForEach(0..<3) {number in
                        Text("Row \(number)")
                    }
                }
                
                Section {
                    ForEach(0..<4) {
                        Text("Row \($0)")
                    }
                }
                
                
            }
            .navigationTitle("Pick a student")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
