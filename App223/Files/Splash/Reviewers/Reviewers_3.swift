//
//  Reviewers_3.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct Reviewers_3: View {
    

    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color("primary"))
                .ignoresSafeArea(.all, edges: .top)
                .frame(maxHeight: .infinity, alignment: .top)
            
            VStack {
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Statistics")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Statistics for each month for each of your properties")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 50)
                .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_4()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
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
    Reviewers_3()
}
