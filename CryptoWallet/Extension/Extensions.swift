//
//  Extensions.swift
//  CryptoWallet
//
//  Created by Camila Ingberg on 11/11/2022.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrencyFormatter() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    private var percentageFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toPercentageFormatter() -> String {
        guard let number = percentageFormatter.string(for: self) else { return ""}
        return number + "%"
    }
}
