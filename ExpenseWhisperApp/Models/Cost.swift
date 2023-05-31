//
//  Cost.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

struct Cost {
    let id = UUID()
    var title: String
    var price: Int
    var category: CostCategory
}
