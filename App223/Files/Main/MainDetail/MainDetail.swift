//
//  MainDetail.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct MainDetail: View {
    
    @StateObject var viewModel: MainViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("home")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay (
                    
                        RoundedRectangle(cornerRadius: 35)
                            .fill(.black.opacity(0.6))
                    )
                    .overlay (
                    
                        VStack {
                            
                            HStack {
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    router.wrappedValue.dismiss()
                                    
                                }, label: {
                                    
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .bold))
                                        .padding(6)
                                        .background(Circle().fill(.black.opacity(0.4)))
                                })
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text(viewModel.selectedProperty?.name ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21, weight: .semibold))
                                
                                Text("Added: Today")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.black.opacity(0.2)))
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                            .padding()
                            .padding(.top, 50)
                    )
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        Text(viewModel.selectedProperty?.text ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    MainDetail(viewModel: MainViewModel())
}
