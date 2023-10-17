//
//  AddView.swift
//  App223
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct AddView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
    
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("New Property")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        Image("home_2")
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("User")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
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
                        })
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Property")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100.000")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.price.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.text.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.text)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.endEditing()
                    
                    viewModel.addProperty {
                        
                        viewModel.fetchProperties()
                        
                        viewModel.name.removeAll()
                        viewModel.price.removeAll()
                        viewModel.text.removeAll()
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.price.isEmpty || viewModel.text.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.price.isEmpty || viewModel.text.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddView()
}


extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
