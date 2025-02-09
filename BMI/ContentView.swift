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
    let heightUnits = ["meter", "centimeter"]

    var body: some View {
        Form {
            Section("入力") {
                HStack {
                    TextField("身長", text: $height)
                        .keyboardType(.decimalPad)
                    Picker("", selection: $heightUnit) {
                        ForEach(heightUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                HStack {
                    TextField("体重", text: $weight)
                        .keyboardType(.decimalPad)
                    Text("kg")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
