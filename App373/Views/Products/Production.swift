//
//  Production.swift
//  App373
//
//  Created by DJUROM on 8/03/2024.
//

import SwiftUI

struct Production: View {

    @StateObject var viewModel = ProductionViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Sales")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        }
                        .frame(width: 120, height: 40)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    })
                    .opacity(viewModel.plans.isEmpty ? 0 : 1)
                    .disabled(viewModel.plans.isEmpty ? true : false)
                }
                
                if viewModel.plans.isEmpty {
                    
                    VStack {
                        
                        Text("Make a work plan")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("Add")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        })
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.plans, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedPlan = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("Bakery products")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text(index.planProducts ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Rectangle()
                                            .fill(Color("bg2"))
                                            .frame(maxHeight: .infinity)
                                            .frame(width: 1)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("Baker")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text("\(index.planBaker ?? "") pcs")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                        
                                        Rectangle()
                                            .fill(Color("bg2"))
                                            .frame(maxHeight: .infinity)
                                            .frame(width: 1)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("Quantity")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text("\(index.planQuantity ?? "") pcs")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.5)))
                                })
                                .padding(.bottom, 7)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlans()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            PlanDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPlan(viewModel: viewModel)
        })
    }
}

#Preview {
    Production()
}
