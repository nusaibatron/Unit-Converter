//
//  ContentView.swift
//  Unit Converter
//
//  Created by Nusaiba Rahman on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputWeight = 0
    
    @State private var unit = "metric"
    private var unitOptions = ["metric", "US"]
    
    var performConversion = { (weight: Double, unit: String) -> Double in
        switch unit {
        case "US":
            return 2.2 * weight
        default:
            return 0.454 * weight

        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Chosen System", selection: $unit) {
                        ForEach(unitOptions, id: \.self) {
                            Text($0)
                        }
                        
                    } .pickerStyle(.segmented)
                    
                    
                } header: {
                    Text("Which system are we converting to?")
                }
                Section {
                    TextField("Weight", value: $inputWeight, format: .number)
                        .keyboardType(.decimalPad)

                } header: {
                    Text("Input weight")

                }
                
                Section {
                    let convertedWeight = performConversion(Double(inputWeight), unit)
                    Text("\(convertedWeight)")
                } header: {
                    Text("Converted weight")
                }
            } .navigationTitle("Unit Converter")
        } .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
