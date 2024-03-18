//
//  Rev2.swift
//  App373
//
//  Created by DJUROM on 11/03/2024.
//

import SwiftUI

struct Rev2: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Rev2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("KEEP AN EYE ON THE PRODUCRION")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Rev3()
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
    Rev2()
}
