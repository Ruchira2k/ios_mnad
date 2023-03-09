//
//  ContentView.swift
//  BMICalculator
//
//  Created by Ruchira Sahabandu  on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    @State private var weight:String = ""
    @State private var height:String = ""
    @State private var bmi:String = "0.0"
    
    var body: some View {
        VStack {
            Text("BMI Calculator")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Weight (kg)")
            TextField("Enter your weight", text: $weight).keyboardType(.decimalPad)
            Text("Height (m)")
            TextField("Enter your height", text: $height).keyboardType(.decimalPad)
            
            Button {
                guard let weightVal = Double(weight), let heightVal = Double(height) else {
                    print("Invalid inputs")
                    return
                }
//                let weight = Double(weight)!
//                let height = Double(height)!
                let bmi = weightVal / pow(heightVal, 2)
                self.bmi = String(bmi)

                print(bmi)
            } label: {
                Text("Calculate BMI")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.cyan)
                    .cornerRadius(15)
                    .padding()
            }
            
            Text("Your BMI: \(bmi)").font(.title).foregroundColor(.orange)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
