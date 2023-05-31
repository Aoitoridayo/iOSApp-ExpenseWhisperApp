//
//  CostChart.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation
import SwiftUI

struct CostChart: Identifiable {
    let category: String
    let Int: Int
    let color: Color
    
    var id: String { category }
}
