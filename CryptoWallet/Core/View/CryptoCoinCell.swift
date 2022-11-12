//
//  CryptoCoinCell.swift
//  CryptoWallet
//
//  Created by Camila Ingberg on 11/11/2022.
//

import SwiftUI
import Kingfisher

struct CryptoCoinCell: View {
     let cryptoCoin: CryptoCoin
    
    var body: some View {
        HStack {
            Text("\(cryptoCoin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            KFImage(URL(string: cryptoCoin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            
            VStack (alignment: .leading, spacing: 4) {
                Text(cryptoCoin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(cryptoCoin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
                
            } .padding(.leading, 2)
            
        Spacer()
            
            VStack (alignment: .trailing, spacing: 4) {
                Text(cryptoCoin.currentPrice.toCurrencyFormatter())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(cryptoCoin.priceChangePercentage24H.toPercentageFormatter())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(getPriceChangeColor(cryptoCoin.priceChangePercentage24H))
                
            } .padding(.leading, 2)
        } .padding(.horizontal)
            .padding(.vertical, 4)
    }
}

func getPriceChangeColor(_ price: Double) -> Color {
    return price > 0 ? Color.green : Color.red
}

//struct CryptoCoinCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CryptoCoinCell(cryptoCoin: CryptoCoin())
//    }
//}
