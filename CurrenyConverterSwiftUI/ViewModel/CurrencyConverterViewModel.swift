//
//  CurrencyConverterViewModel.swift
//  CurrencyConverterSwiftUI
//
//  Created by Harsha Narsietty on 19/07/25.
//

import Foundation



@MainActor
final class CurrencyConverterViewModel: ObservableObject {
    
    var access_key = ""
    
    @Published var convertedAmount: Double?
    
    
    func convert(amountText: String, from: String, to: String) {
        
        
        guard let amount = Double(amountText), amount > 0 else {
            convertedAmount = nil
            return
        }
        
        
        Task {
            do {
                let result = try await fetchConvertedAmount(amount: amount, from: from, to: to)
                self.convertedAmount = result
            }catch{
                print("Conversion error: \(error)")
                self.convertedAmount = nil
            }
        }
        
    }
        
    private func fetchConvertedAmount(amount: Double, from: String, to: String) async throws -> Double {
            let urlString = "https://api.exchangerate.host/convert?access_key=\(access_key)&from=\(from)&to=\(to)&amount=\(amount)"
            guard let url = URL(string: urlString) else {
                throw URLError(.badURL)
                
            }
        
        
        let (data,_) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
        return decoded.result
        
        }
        
        
    
        
        
        
        
}
    
    
    
    
