//
//  Rev1.swift
//  App373
//
//  Created by DJUROM on 10/03/2024.
//

import SwiftUI

struct Rev1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Rev1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("KEEP RECORDS OF SALES")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Rev2()
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
    Rev1()
}
