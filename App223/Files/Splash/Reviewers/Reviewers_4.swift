//
//  Reviewers_4.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct Reviewers_4: View {
    
    @AppStorage("profile_name") var profile_name: String = ""
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: -17) {
                
                Image("man")
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Add a profile")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You can create a profile for yourself, for your loved ones and add their property")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .padding(.bottom)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("You name")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .opacity(profile_name.isEmpty ? 1 : 0)
                        
                        TextField("", text: $profile_name)
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    })
                    .opacity(profile_name.isEmpty ? 0.5 : 1)
                    .disabled(profile_name.isEmpty ? true : false)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 420)
                .background(Color.white.ignoresSafeArea())
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    Reviewers_4()
}
