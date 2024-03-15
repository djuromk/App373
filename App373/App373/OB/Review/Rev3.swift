//
//  Rev3.swift
//  App373
//
//  Created by DJUROM on 10/03/2024.
//

import SwiftUI

struct Rev3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
 
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Rev3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("ENTIRE STAFF IS UNDER YOUR CONTROL")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    Rev3()
}
