//
//  CurrencyConverterView.swift
//  CurrencyConverterSwiftUI
//
//  Created by Harsha Narsietty on 18/07/25.
//

import SwiftUI


struct CurrencyConverterView: View {
    
    @StateObject private var viewModel = CurrencyConverterViewModel()
    
    
    @State private var amountText: String = ""
    @State private var fromCurrency: String = "USD"
    @State private var toCurrency: String = "INR"
   
    
    
    
    
    var body: some View {
        
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                Text("Currency Converter")
                    .font(.title2).fontWeight(.bold)
                
                
                Section(header: Text("Amount")) {
                    TextField("Enter amount", text: $amountText)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section(header: Text("From")) {
                    
                    Picker("From", selection: $fromCurrency) {
                        ForEach(["USD","INR","JPY","EUR","GBP"], id: \.self) { code in
                            
                            Text(code)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section(header: Text("To")) {
                    
                    Picker("To", selection: $toCurrency) {
                        ForEach(["USD","INR","JPY","EUR","GBP"], id: \.self) { code in
                            Text(code)
                                
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                    
                }
                
                
                Button("Convert") {
                    
                    viewModel.convert(amountText: amountText, from: fromCurrency, to: toCurrency)
                    
                    
                }.buttonStyle(.borderedProminent)
                
                
                
                if let value = viewModel.convertedAmount {
                    Section(header: Text("Result")) {
                        Text("Amount: \(value, specifier: "%.2f") \(toCurrency)")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
                
                
                
                
                Spacer()
                
                
                
                
            }
            .padding()
            .navigationTitle("Convert")
            
            
            
        }
        
        
        
        
    }
    
    
    
}


#Preview {
    CurrencyConverterView()
}
