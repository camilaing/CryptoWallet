//
//  CryptoListView.swift
//  CryptoWallet
//
//  Created by Camila Ingberg on 11/11/2022.
//

import SwiftUI

struct CryptoListView: View {
    
    @StateObject var viewModel = CryptoListViewModel()
    @State var presentingModal = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    CryptoCoinView(viewModel: viewModel)
                }
                .navigationTitle("Crypto App")
                .font(.subheadline)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.presentingModal = true
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $presentingModal) { SettingsView(presentedAsModal: self.$presentingModal, cryptoCoins: viewModel.cryptoCoins) }
                    }
                }
            }
            if viewModel.isLoading {
                ZStack {
                    Color(.white)
                        .opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView("Fetching Coins")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemBackground))
                        )
                        .shadow(radius: 10)
                }
                
            }
        }
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
