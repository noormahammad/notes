//
//  ContentView.swift
//  Simple Bank Account app using Swift UI
//
//  Created by Noor on 2/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var inputUnit = 1.0
    @State var inputUnitType = "Meter"
    @State var outputUnitType = "Foot"
    
    //first convert input into lowest unit type
    var inputUnitInFeet : Double  {
        var feet: Double;
        switch inputUnitType {
        case "Meter":
            feet = inputUnit * 3.28084
        case "Kilometer":
            feet = inputUnit * 3280.84
        case "Yard":
            feet = inputUnit * 3
        default:
            feet = inputUnit
        }
        return feet
    }
    
    var outputUnit: String {
        var output = 1.0
        switch outputUnitType {
        case "Meter":
            output = inputUnitInFeet / 3.28084
        case "Kilometer":
            output = inputUnitInFeet / 3280.84
        case "Yard":
            output = inputUnitInFeet / 3
        default:
            output = inputUnitInFeet
        }
        return output.formatted()
    }
    
    let unitTypes = ["Meter", "Kilometer", "Foot", "Yard"]
  
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                        TextField("Enter a number", value:$inputUnit, format:.number)
                        Picker("", selection: $inputUnitType){
                            ForEach(unitTypes, id:\.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                }
                Section("") {
              
                        Text("\(outputUnit)")
                        Picker("", selection: $outputUnitType){
                            ForEach(unitTypes, id:\.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    
                }
            }
            .navigationTitle("Length Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
