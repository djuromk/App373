//
//  AddPlan.swift
//  App373
//
//  Created by DJUROM on 18/03/2024.
//

import SwiftUI

struct AddPlan: View {
    
    @StateObject var viewModel: ProductionViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {

                    Text("New work plan")
                        .foregroundColor(Color.black)
                        .font(.system(size: 18, weight: .medium))
                        .padding()

                Text("Bakery products")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.planProducts.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.planProducts)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        
                        Text("Quantity")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.planQuantity.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.planQuantity)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        
                        Text("Baker")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.planBaker.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.planBaker)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        
                        Text("Bakers phone number")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.planNumber.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.planNumber)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.planDescription.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.planDescription)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)

                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addPlan()
                    
                    viewModel.planProducts = ""
                    viewModel.planQuantity = ""
                    viewModel.planBaker = ""
                    viewModel.planNumber = ""
                    viewModel.planDescription = ""
                    
                    viewModel.fetchPlans()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    
                })
                .disabled(viewModel.planProducts.isEmpty || viewModel.planQuantity.isEmpty || viewModel.planBaker.isEmpty || viewModel.planNumber.isEmpty || viewModel.planDescription.isEmpty ? true : false)
                .opacity(viewModel.planProducts.isEmpty || viewModel.planQuantity.isEmpty || viewModel.planBaker.isEmpty || viewModel.planNumber.isEmpty || viewModel.planDescription.isEmpty ? 0.5 : 1)
            }
            .padding()
        }
    }
}

#Preview {
    AddPlan(viewModel: ProductionViewModel())
}
