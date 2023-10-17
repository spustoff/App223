//
//  MainView.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Main")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack {
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 12, weight: .regular))
                        .padding(5)
                        .background(Circle().fill(.white))
                    
                    Text(viewModel.profile_name.isEmpty ? "Owner" : viewModel.profile_name)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                }
                .padding(6)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
                
                VStack(alignment: .leading, content: {
                    
                    Text("My Property")
                        .foregroundColor(.black)
                        .font(.system(size: 23, weight: .semibold))
                    
                    if viewModel.properties.isEmpty {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Image("empty")
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 23, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("You don't have any added property yet")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.properties, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.isDetail = true
                                        viewModel.selectedProperty = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Image("home")
                                            
                                            VStack(alignment: .leading, spacing: 5, content: {
                                                
                                                Text("18.10.23")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.name ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Text("$\(index.price)")
                                                    .foregroundColor(Color("primary"))
                                                    .font(.system(size: 21, weight: .bold))
                                            })
                                            
                                            Spacer()
                                        }
                                        .padding(.bottom, 5)
                                    })
                                }
                            }
                            .padding()
                        }
                    }
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                .background(Color.white.ignoresSafeArea())
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            MainDetail(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchProperties()
        }
    }
}

#Preview {
    MainView()
}
