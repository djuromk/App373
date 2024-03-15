//
//  PlanDetail.swift
//  App373
//
//  Created by DJUROM on 8/03/2024.
//

import SwiftUI

struct PlanDetail: View {

    @StateObject var viewModel: ProductionViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .regular))
                            
                         Text("Back")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Spacer()
                }
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Bakery products")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.system(size: 12, weight: .regular))
                        
                        Text(viewModel.selectedPlan?.planProducts ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Quantity")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("\(viewModel.selectedPlan?.planQuantity ?? "") pcs")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Baker")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.system(size: 12, weight: .regular))
                        
                        Text(viewModel.selectedPlan?.planBaker ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color("bg2"))
                        .frame(maxHeight: .infinity)
                        .frame(width: 1)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Bakers phone number")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("\(viewModel.selectedPlan?.planNumber ?? "") pcs")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.5)))
                
                Text("Description")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(viewModel.selectedPlan?.planDescription ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Completed")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    
                })
            }
            .padding()
        }
    }
}

#Preview {
    PlanDetail(viewModel: ProductionViewModel())
}
