//
//  Join.swift
//  App373
//
//  Created by DJUROM on 13/03/2024.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {
 
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("JOIN TELEGRAM AND EARN MONEY")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color(red: 0/255, green: 163/255, blue: 255/255)))
                })
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Notific()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(5)
                            .background(Circle().fill(.black))
                    })
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Join(telegram: URL(string: "f")!)
}
