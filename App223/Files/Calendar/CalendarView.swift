//
//  CalendarView.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Text("Calendar")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach(["July", "Aug", "Sept", "Oct", "Nov", "Dec", "Jan", "Feb", "March"], id: \.self) { index in
                            
                                VStack(alignment: .center, spacing: 6, content: {
                                    
                                    Text("2023")
                                        .foregroundColor(.black)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text(index)
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 16, weight: .medium))
                                })
                                .frame(width: 60)
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
                .background(Color.white.ignoresSafeArea())
                
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
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Amount of property for this period")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("$\(viewModel.properties.map(\.price).reduce(0, +))")
                        .foregroundColor(.black)
                        .font(.system(size: 21, weight: .bold))
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .padding(.horizontal)
                
                VStack(alignment: .leading, content: {
                    
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
        .onAppear {
            
            viewModel.fetchProperties()
        }
    }
}

#Preview {
    CalendarView()
}
