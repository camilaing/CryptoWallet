//
//  SettingsView.swift
//  CryptoWallet
//
//  Created by Camila Ingberg on 11/11/2022.
//

import SwiftUI
import UserNotifications
import Combine

struct SettingsView: View {
    @Binding var presentedAsModal: Bool
    @State var cryptoCoins: CryptoCoins
    @State var selection: String = "Choose CryptoCoin"
    @State var textFieldValue: String = "10000"
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle(isOn: .constant(false)) {Text("Notifications") }
                }
                Section {
                    Picker(selection: $selection,
                           label: HStack {
                        Text("CryptoCoin: ")
                    },
                           content: {
                        ForEach(cryptoCoins) { option in
                            Text(option.name)
                                .tag(option.id)
                        }
                    })
                    HStack {
                        Text("Value: ")
                        Spacer()
                        TextField(" ", text: $textFieldValue)
                            .keyboardType(.numberPad)
                            .onReceive(Just(textFieldValue)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.textFieldValue = filtered
                                }
                            }
                    }
                }
            }
            .navigationTitle("Settings")
            .font(.subheadline)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentedAsModal = false
                    }) { Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(presentedAsModal: $true, cryptoCoins: CryptoCoins())
//    }
//}
