//
//  User1.swift
//  App373
//
//  Created by DJUROM on 10/03/2024.
//

import SwiftUI

struct User1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
 
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("User1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("INCREASE YOUR INCOME")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewa(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
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
    }
}

#Preview {
    User1(telegram: URL(string: "")!, isTelegram: false)
}
