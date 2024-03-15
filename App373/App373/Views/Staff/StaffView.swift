//
//  StaffView.swift
//  App373
//
//  Created by DJUROM on 6/03/2024.
//

import SwiftUI

struct StaffView: View {

    @StateObject var viewModel = StaffViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Staff")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        }
                        .frame(width: 120, height: 40)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    })
                    .opacity(viewModel.staffs.isEmpty ? 0 : 1)
                    .disabled(viewModel.staffs.isEmpty ? true : false)
                }
                
                if viewModel.staffs.isEmpty {
                    
                    VStack {
                        
                        Text("Make a work plan")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("Add")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        })
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.staffs, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedStaff = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("Name")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text(index.staffName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Text("Labor assessment")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            let starCount = max(Int(index.staffStars), 1)

                                            HStack {
                                                
                                                ForEach(1..<starCount, id: \.self) { indexer in
                                                    
                                                    Image(systemName: "star.fill")
                                                         .foregroundColor(Int(index.staffStars) >= indexer ? .yellow : .gray)
                                                         .font(.system(size: 16, weight: .regular))
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("Post")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text("\(index.staffPost ?? "")")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Text("Salary")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text("\(index.staffSalary ?? "")")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.5)))
                                })
                                .padding(.bottom, 7)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchStaffs()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddStaff(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Dismiss")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure want to fire this person?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteStaff(withStaffName: viewModel.selectedStaff?.staffName ?? "", completion: {
                            
                            viewModel.fetchStaffs()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Dismiss")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
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
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    StaffView()
}
