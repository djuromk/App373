//
//  SalesView.swift
//  App373
//
//  Created by DJUROM on 7/03/2024.
//

import SwiftUI

struct SalesView: View {
    
    @StateObject var viewModel = SalesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Sales")
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
                        
                        Text("Quantity sales per month")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.needSale)/\(viewModel.haveSale)")
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
                            
                            if viewModel.currentPair.isEmpty {
                                
                                Text("\(viewModel.curPair)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                                
                            } else {
                                
                                Text("\(viewModel.currentPair)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            
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
                        
                        VStack {
                            
                            Text("Earned")
                                .foregroundColor(.black.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("$\(viewModel.earned)")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddEarned = true
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
                
                if viewModel.PP.isEmpty {
        
                    VStack(spacing: 12) {
                        
                        Text("Specify which pastries are most popular in your bakery")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding()
                        
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
                    .frame(height: 180)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.6)))
                    
                    Spacer()
                    
                } else {
                    
                    VStack(spacing: 12) {
           
                        HStack {
                            
                            Image("\(viewModel.PF)")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text("Popular parties")
                                    .foregroundColor(.black.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text(viewModel.PP)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text("Sold")
                                    .foregroundColor(.black.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text(viewModel.PS)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
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
                    .frame(height: 180)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.6)))
                    
                    Spacer()
                }
            }
            .padding()
        }
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
                        
                        Text("Quantity sales per month")
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
                            .opacity(viewModel.needSale1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.needSale1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
                    
                    Text("Sold")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.haveSale1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.haveSale1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)

                    Button(action: {
                        
                        viewModel.needSale = viewModel.needSale1
                        viewModel.haveSale = viewModel.haveSale1
                        
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
                    .disabled(viewModel.needSale1.isEmpty || viewModel.haveSale1.isEmpty ? true : false)
                    .opacity(viewModel.needSale1.isEmpty || viewModel.haveSale1.isEmpty ? 0.5 : 1)
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
                
                Color.black.opacity(viewModel.isAddEarned ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddEarned  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddEarned  = false
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
                        
                        Text("Earned")
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
                            .opacity(viewModel.earned1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.earned1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
   
                    Button(action: {
                        
                        viewModel.earned = viewModel.earned1
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddEarned  = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                    })
                    .disabled(viewModel.earned1.isEmpty ? true : false)
                    .opacity(viewModel.earned1.isEmpty ? 0.5 : 1)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddEarned  ? 0 : UIScreen.main.bounds.height)
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
                        
                        Text("Popular pastries")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                            .padding()
                        
                    }
      
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.PF1 = index
                                viewModel.PF = viewModel.PF1
                                
                            }, label: {
                                
                                Text("\(viewModel.PF)")
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.PF1.isEmpty {
                            
                            Image(systemName: "photo")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 150)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                                .padding(.horizontal, 40)
                            
                        } else {
                            
                            Image("\(viewModel.PF)")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 150)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                                .padding(.horizontal, 40)
                        }
                    })
                    
                    Text("Name")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.PP1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.PP1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
                    
                    Text("Sold")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.PS1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.PS1)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding(1)
   
                    Button(action: {
                        
                        viewModel.PP = viewModel.PP1
                        viewModel.PS = viewModel.PS1
                        viewModel.PF = viewModel.PF1
                        
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
                    .disabled(viewModel.PP1.isEmpty || viewModel.PS1.isEmpty || viewModel.PF1.isEmpty ? true : false)
                    .opacity(viewModel.PP1.isEmpty || viewModel.PS1.isEmpty || viewModel.PF1.isEmpty ? 0.5 : 1)
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
                
                Color.black.opacity(viewModel.isCurrencies ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCurrencies  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isCurrencies  = false
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
                        
                        Text("Currency pair")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                            .padding()
                        
                    }
                    
                    LazyVStack {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                      Button(action: {
                          
                          viewModel.currentPair = index
                          
                      }, label: {
                          
                          HStack {
                              
                              Text(index)
                                  .foregroundColor(.black)
                                  .font(.system(size: 18, weight: .regular))
                              
                              Spacer()
                              
                              Image(systemName: "chevron.right")
                                  .foregroundColor(.black)
                                  .font(.system(size: 18, weight: .regular))
                          }
                          .padding()
                          .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.5)))
                      })
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isCurrencies  ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
    
    func calculatePercentage() -> Double {
        
        let value = Int(viewModel.haveSale)
        let maxValue = Int(viewModel.needSale)
        
        let percentCircle = Double(value ?? 0) / Double(maxValue ?? 1) * 100
        
        return percentCircle
    }
}

#Preview {
    SalesView()
}
