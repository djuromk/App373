//
//  LoadingView.swift
//  App373
//
//  Created by DJUROM on 13/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 260)
                
                Spacer()
                
                ProgressView()
            }
            .padding(.vertical, 100)
        }
    }
}

#Preview {
    LoadingView()
}
