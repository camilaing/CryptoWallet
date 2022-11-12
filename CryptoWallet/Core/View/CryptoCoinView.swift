//
//  CryptoCoinView.swift
//  CryptoWallet
//
//  Created by Camila Ingberg on 11/11/2022.
//

import SwiftUI

struct CryptoCoinView: View {
    @StateObject var viewModel: CryptoListViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.cryptoCoins) { cryptoCoin in
                        CryptoCoinCell(cryptoCoin: cryptoCoin)
                    }
                }
            }
        }
    }
}

//struct CryptoCoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        CryptoCoinView()
//    }
//}
