//
//  SalesViewModel.swift
//  App373
//
//  Created by DJUROM on 8/03/2024.
//

import SwiftUI
import CoreData

final class SalesViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var curPair = "EUR/USD"
    @AppStorage("currentPair") var currentPair = ""

    @AppStorage("haveSale") var haveSale = "0"
    @AppStorage("needSale") var needSale = "0"
    @Published var haveSale1 = ""
    @Published var needSale1 = ""
    
    @AppStorage("earnes") var earned = ""
    @Published var earned1 = ""
    
    @AppStorage("PP") var PP = ""
    @Published var PP1 = ""
    @AppStorage("PS") var PS = ""
    @Published var PS1 = ""
    @AppStorage("PF") var PF = ""
    @Published var PF1 = ""
    @Published var photos: [String] = ["Cake Pop"]
    
    @Published var isDetail: Bool = false
    @Published var isAddEarned: Bool = false
    @Published var isAddHavent: Bool = false
    @Published var isAddSpent: Bool = false
    @Published var isCurrencies: Bool = false
}
