//
//  CostCategory.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation
import SwiftUI

enum CostCategory {
    case food
    case transportation
    case entertainment
    case medicalAndCosme
    case livingware
    case others
    
    var title: String {
        switch self {
            
        case .food:
            return "食費"
        case .transportation:
            return "交通費"
        case .entertainment:
            return "趣味"
        case .medicalAndCosme:
            return "医薬品・コスメ"
        case .livingware:
            return "生活用品"
        case .others:
            return "その他"
        }
    }
    
    var color: Color {
        switch self {
            
        case .food:
            return Color.green
        case .transportation:
            return Color.blue
        case .entertainment:
            return Color.pink
        case .medicalAndCosme:
            return Color.brown
        case .livingware:
            return Color.yellow
        case .others:
            return Color.gray
        }
    }
}
