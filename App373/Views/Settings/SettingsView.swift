//
//  SettingsView.swift
//  App373
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isReset: Bool = false
    
    @AppStorage("haveIng") var haveIng = "0"
    @AppStorage("needIng") var needIng = "0"
    @AppStorage("haveSale") var haveSale = "0"
    @AppStorage("needSale") var needSale = "0"
    @AppStorage("spent") var spent = ""
    @AppStorage("currentPair") var currentPair = ""
    @AppStorage("PP") var PP = ""
    @AppStorage("PS") var PS = ""
    @AppStorage("PF") var PF = ""
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                }
                
                Button(action: {
                    
                    guard let url = URL(string: DataManager().usagePolicy) else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "list.bullet.clipboard.fill")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.5)))
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Rate app")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("bg3"))
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.5)))
                })
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        isReset = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Reset")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.5)))
                })
                
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to reset all records? ")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        
                        haveIng = "0"
                        needIng = "0"
                        haveSale = "0"
                        needSale = "0"
                        spent = ""
                        currentPair = ""
                        PP = ""
                        PS = ""
                        PF = ""
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg").opacity(0.9)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
