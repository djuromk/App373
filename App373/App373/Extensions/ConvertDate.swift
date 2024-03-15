//
//  ConvertDate.swift
//  App373
//
//  Created by DJUROM on 9/03/2024.
//

import SwiftUI

extension Date {

    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
