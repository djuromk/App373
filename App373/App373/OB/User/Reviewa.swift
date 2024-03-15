//
//  Reviewa.swift
//  App373
//
//  Created by DJUROM on 13/03/2024.
//

import SwiftUI
import StoreKit

struct Reviewa: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
   
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("RATE OUR APP IN THE APPSTORE")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Notific()
                            .navigationBarBackButtonHidden()
                    }
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                })
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviewa(telegram: URL(string: "")!, isTelegram: false)
}
