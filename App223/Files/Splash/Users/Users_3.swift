//
//  Users_3.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct Users_3: View {
    
    let telegram: URL
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color(red: 12/255, green: 132/255, blue: 228/255))
                .ignoresSafeArea(.all, edges: .top)
                .frame(maxHeight: .infinity, alignment: .top)
            
            VStack {
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Join and earn")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Join our Telegram group trade with our team")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 50)
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 12/255, green: 132/255, blue: 228/255)))
                })
                
                NavigationLink(destination: {
                    
                    if isContacts == true {
                        
                        Manager()
                            .navigationBarBackButtonHidden()
                        
                    } else if isContacts == false {
                        
                        Users_5()
                            .navigationBarBackButtonHidden()
                    }
                    
                }, label: {
                    
                    Text("Skip")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                })
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg")).ignoresSafeArea())
            .frame(height: 300)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    Users_3(telegram: URL(string: "h")!, isContacts: false)
}
