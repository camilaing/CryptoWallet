//
//  CryptoListViewModel.swift
//  CryptoWallet
//
//  Created by Camila Ingberg on 11/11/2022.
//

import Foundation
import SwiftUI

class CryptoListViewModel: ObservableObject {
    
    struct ServiceError: Identifiable {
        let id = UUID().uuidString
        let errorString: String
    }
    
    @Published var cryptoCoins = CryptoCoins()
    @Published var isLoading: Bool = false
    var serviceError: ServiceError? = nil
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        isLoading = true
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false&price_change_percentage=24h"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.isLoading = false
                self.serviceError = ServiceError(errorString: error.localizedDescription)
#if DEBUG
                print("DEBUG: Error \(error.localizedDescription)")
#endif
                return
            }
            
            if let response = response as? HTTPURLResponse {
#if DEBUG
                print("DEBUG: Response code \(response.statusCode)")
#endif
            }
            
            guard let data = data else { return }
            
            do {
                let cryptoCoins = try JSONDecoder().decode(CryptoCoins.self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.cryptoCoins = cryptoCoins
                }
                
            } catch let error {
                self.isLoading = false
                self.serviceError = ServiceError(errorString: error.localizedDescription)
#if DEBUG
                print("DEBUG: Error \(error.localizedDescription)")
#endif
            }
        }.resume()
    }
}
