//
//  Notific.swift
//  App373
//
//  Created by DJUROM on 13/03/2024.
//

import SwiftUI
import OneSignalFramework

struct Notific: View {
 
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
 
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Notif")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("DON'T MISS ANYTHING")
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                        status = true
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable notifications")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                })
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true

                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(5)
                            .background(Circle().fill(.black))
                    })
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Notific()
}
