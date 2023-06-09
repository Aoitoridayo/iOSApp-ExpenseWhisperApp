//
//  UsedCost.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

struct UsedCost: Identifiable {
    let id = UUID()
    var usedCost: Int
    let category: CostCategory
    let empty: String
}
