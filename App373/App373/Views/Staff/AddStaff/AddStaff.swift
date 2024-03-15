//
//  AddStaff.swift
//  App373
//
//  Created by DJUROM on 6/03/2024.
//

import SwiftUI

struct AddStaff: View {
 
    @StateObject var viewModel: StaffViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {

                    Text("New staff")
                        .foregroundColor(Color.black)
                        .font(.system(size: 18, weight: .medium))
                        .padding()

                Text("Name")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.staffName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.staffName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        
                        Text("Post")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.staffPost.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.staffPost)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)
                        
                        Text("Salary")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.staffSalary.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.staffSalary)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(1)

                        Text("Description")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(1...5, id: \.self) { indexer in
                                
                                Button(action: {
                                    
                                    viewModel.staffStars = indexer
                                    
                                }, label: {
                                    
                                    Image(systemName: "star.fill")
                                         .foregroundColor(Int(viewModel.staffStars) >= indexer ? .yellow : .gray)
                                         .font(.system(size: 16, weight: .regular))
                                })
                            }
                            
                            Spacer()
                        }
                        .padding(.top)
                    }
                }
                
                Spacer()

                Button(action: {
                    
                    viewModel.addStaff()
                    
                    viewModel.staffName = ""
                    viewModel.staffPost = ""
                    viewModel.staffSalary = ""
                    
                    viewModel.fetchStaffs()
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    
                })
                .disabled(viewModel.staffName.isEmpty || viewModel.staffPost.isEmpty || viewModel.staffSalary.isEmpty ? true : false)
                .opacity(viewModel.staffName.isEmpty || viewModel.staffPost.isEmpty || viewModel.staffSalary.isEmpty ? 0.5 : 1)
                
            }
            .padding()
        }
    }
}

#Preview {
    AddStaff(viewModel: StaffViewModel())
}
