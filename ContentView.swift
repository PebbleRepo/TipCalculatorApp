//
//  ContentView.swift
//  
//
//  Name: Dylan Rock
//  Student ID: A20474094
//

import SwiftUI

struct ContentView: View {
    //State Variables
    @State private var billAmount: Double = 50.0
    @State private var tipPercentage: Double = 15.0
    @State private var numberOfPeople: Double = 1.0
    @State private var showResults: Bool = false
    
    //Computed Properties
    var tipAmount: Double {
        return billAmount * (tipPercentage / 100)
    }
    
    var totalAmount: Double {
        return billAmount + tipAmount
    }
    
    var amountPerPerson: Double {
        return totalAmount / numberOfPeople
    }
    
    //Body
    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Dollar Sign Icon
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 80, height: 80)
                Text("$")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 10)
            
            // Bill Amount Section
            VStack(spacing: 8) {
                Text("Bill Amount")
                    .font(.headline)
                Text("\(billAmount, format: .currency(code: "USD"))")
                    .font(.title2)
                    .foregroundColor(.orange)
                Slider(value: $billAmount, in: 0...500, step: 1)
                    .tint(.purple)
            }
            .padding(.horizontal)
            
            // Tip Percentage Section
            VStack(spacing: 8) {
                Text("Tip Percentage")
                    .font(.headline)
                Text("\(Int(tipPercentage))%")
                    .font(.title2)
                    .foregroundColor(.orange)
                Slider(value: $tipPercentage, in: 0...30, step: 1)
                    .tint(.green)
            }
            .padding(.horizontal)
            
            // Number of People Section
            VStack(spacing: 8) {
                Text("Number of People")
                    .font(.headline)
                Text("\(Int(numberOfPeople))")
                    .font(.title2)
                    .foregroundColor(.green)
                Slider(value: $numberOfPeople, in: 1...20, step: 1)
                    .tint(.gray)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Calculate/Hide Results Button
            Button(action: {
                showResults.toggle()
            }) {
                Text(showResults ? "Hide Results" : "Calculate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(showResults ? Color.red : Color.black)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .shadow(radius: 5)
            
            // Results Section
            if showResults {
                VStack(spacing: 10) {
                    Text("Tip Amount: \(tipAmount, format: .currency(code: "USD"))")
                        .font(.headline)
                    Text("Total Amount: \(totalAmount, format: .currency(code: "USD"))")
                        .font(.headline)
                    Text("Amount per Person: \(amountPerPerson, format: .currency(code: "USD"))")
                        .font(.headline)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Modern Tip Calculator")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
