//
//  SettingsCurrencies.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct SettingsCurrencies: View {
    
    @Environment(\.presentationMode) var router
    
    @State var isChart: Bool = false
    @State var selectedPair: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 17, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 17, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(["EURUSD", "EURTRY", "EURCAD", "EURJPY", "EURRUB", "USDTRY", "USDCAD", "USDJPY", "USDRUB", "TRYUSD", "TRYCAD", "TRYJPY", "TRYKZT"], id: \.self) { index in
                        
                            Button(action: {
                                
                                selectedPair = index
                                isChart = true
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                .padding(.horizontal)
                            })
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isChart, content: {
            
            SettingsChart(pair: selectedPair)
        })
    }
}

#Preview {
    SettingsCurrencies()
}
