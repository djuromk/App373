//
//  IndredientsView.swift
//  App373
//
//  Created by DJUROM on 9/03/2024.
//

import SwiftUI

struct IndredientsView: View {
    
    @StateObject var viewModel = IngredientsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Ingredients")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    VStack(spacing: 5) {
                        
                        ZStack {
                            
                            Circle()
                                .stroke(Color.white.opacity(0.2), lineWidth: 5)
                                .frame(width: 80, height: 80)
                                .padding()
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                                .stroke(Color.white, lineWidth: 5)
                                .frame(width: 80, height: 80)
                                .rotationEffect(.degrees(-90))
                            
                            Text("\(String(format: "%.f", calculatePercentage()))%")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                        }

                        Text("Ingredients")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.needIng)/\(viewModel.haveIng)")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddHavent = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "pencil")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Change")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .frame(width: 100, height: 35)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg").opacity(0.7)))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    VStack {
                        
                        VStack {
                            
                            Text("Today")
                                .foregroundColor(.black.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Text(Date().convertDate(format: "MMM dd YYYY"))
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 107)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        VStack {
                            
                            Text("Wastes")
                                .foregroundColor(.black.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            Text("$\(viewModel.spent)")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddSpent = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "pencil")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Text("Change")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                .frame(width: 100, height: 35)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg").opacity(0.7)))
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 107)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                    }
                }
                
                HStack {
                    
                    Text("Necessary buy")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Spacer()
                 
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddIng = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(width: 100, height: 35)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                        .opacity(viewModel.ingredients.isEmpty ? 0 : 1)
                        .disabled(viewModel.ingredients.isEmpty ? true : false)
                    })
                }
                .padding(.vertical, 9)
                
                if viewModel.ingredients.isEmpty {
                    
                    VStack(spacing: 8) {
                        
                        Text("Add the missing ingredients")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 160)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddIng = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Add")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                            .padding(.horizontal)
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.ingredients, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedIngredient = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            Text(index.iName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Text(index.iQuantity ?? "")
                                                .foregroundColor(.black.opacity(0.5))
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("$\(index.iCost ?? "")")
                                            .foregroundColor(.black.opacity(0.5))
                                            .font(.system(size: 18, weight: .regular))
                                    }
                                })
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.2)))
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchIng()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddIng ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddIng  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddIng  = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(5)
                                    .background(Circle().fill(.white.opacity(0.2)))
                            })
                            
                            Spacer()
                            
                        }
                        
                        Text("Necessary buy")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                    }
                    
                    Text("Name")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.iName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.iName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
                    
                    Text("Quantity")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.iQuantity.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.iQuantity)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
                    
                    Text("Cost")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.iCost.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.iCost)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)

                    Button(action: {
                        
                        viewModel.addIng()
                        
                        viewModel.iName = ""
                        viewModel.iQuantity = ""
                        viewModel.iCost = ""
                        
                        viewModel.fetchIng()
                            
                        withAnimation(.spring()) {
                            
                            viewModel.isAddIng  = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        
                    })
                    .disabled(viewModel.iName.isEmpty || viewModel.iQuantity.isEmpty || viewModel.iCost.isEmpty ? true : false)
                    .opacity(viewModel.iName.isEmpty || viewModel.iQuantity.isEmpty || viewModel.iCost.isEmpty ? 0.5 : 1)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddIng  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddHavent ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHavent  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddHavent  = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(5)
                                    .background(Circle().fill(.white.opacity(0.2)))
                            })
                            
                            Spacer()
                            
                        }
                        
                        Text("Ingredients")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                            .padding()
                        
                    }
                    
                    Text("Required quantity")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.needIng1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.needIng1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
                    
                    Text("Have")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.haveIng1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.haveIng1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)

                    Button(action: {
                        
                        viewModel.needIng = viewModel.needIng1
                        viewModel.haveIng = viewModel.haveIng1
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddHavent  = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                    })
                    .disabled(viewModel.needIng1.isEmpty || viewModel.haveIng1.isEmpty ? true : false)
                    .opacity(viewModel.needIng1.isEmpty || viewModel.haveIng1.isEmpty ? 0.5 : 1)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddHavent  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddSpent ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddSpent  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddSpent  = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(5)
                                    .background(Circle().fill(.white.opacity(0.2)))
                            })
                            
                            Spacer()
                            
                        }
                        
                        Text("Spent on purchases")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                            .padding()
                        
                    }
                    
                    Text("Amount")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.spent1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.spent1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
   
                    Button(action: {
                        
                        viewModel.spent = viewModel.spent1
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddSpent  = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                    })
                    .disabled(viewModel.spent1.isEmpty ? true : false)
                    .opacity(viewModel.spent1.isEmpty ? 0.5 : 1)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddSpent  ? 0 : UIScreen.main.bounds.height)
            }
        )
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
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteIng(withIName: viewModel.selectedIngredient?.iName ?? "", completion: {
                            
                            viewModel.fetchIng()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
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
    
    func calculatePercentage() -> Double {
        
        let value = Int(viewModel.haveIng)
        let maxValue = Int(viewModel.needIng)
        
        let percentCircle = Double(value ?? 0) / Double(maxValue ?? 1) * 100
        
        return percentCircle
    }
}

#Preview {
    IndredientsView()
}
