//
//  ContentView.swift
//  BMI
//
//  Created by 佐藤幸久 on 2025/02/09.
//

import SwiftUI

struct ContentView: View {
    @State private var height: String = ""
    @State private var heightUnit: String = "meter"
    @State private var weight: String = ""
    @State private var bmi: String = ""
    let heightUnits = ["meter", "centimeter"]

    var body: some View {
        Form {
            Section("入力") {
                HStack {
                    TextField("身長", text: $height)
                        .keyboardType(.decimalPad)
                        .onChange(of: height, initial: true) { oldValue, newValue in
                            calculateBMI()
                        }
                    Picker("", selection: $heightUnit) {
                        ForEach(heightUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                HStack {
                    TextField("体重", text: $weight)
                        .keyboardType(.decimalPad)
                        .onChange(of: weight, initial: true) { oldValue, newValue in
                            calculateBMI()
                        }
                    Text("kg")
                }
            }
            Section("結果") {
                Text("\(bmi)")
            }
        }
    }
    func calculateBMI() {
        guard let heightValue = Double(height),
            let weightValue = Double(weight)
        else {
            bmi = "NaN"
            return
        }
        
        let heightInMeter: Double
        switch heightUnit {
            case "meter":
                heightInMeter = heightValue
            case "centimeter":
                heightInMeter = heightValue / 100
        default:
            return bmi = "0.0"
        }
        
        let bmi = weightValue / (heightInMeter * heightInMeter)
        self.bmi = String(format: "%.2f", bmi)
    }
}

#Preview {
    ContentView()
}
