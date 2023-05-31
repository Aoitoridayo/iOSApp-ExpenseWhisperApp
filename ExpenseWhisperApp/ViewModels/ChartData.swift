//
//  ChartData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation
import SwiftUI

class ChartData: ObservableObject {
    @Published var chartData: [CostChart] = [
        CostChart(category: "食費", Int: 0, color: Color.green),
        CostChart(category: "交通費", Int: 0, color: Color.blue),
        CostChart(category: "娯楽", Int: 0, color: Color.pink),
        CostChart(category: "医薬品・コスメ", Int: 0, color: Color.brown),
        CostChart(category: "生活用意品", Int: 0, color: Color.yellow),
        CostChart(category: "その他", Int: 0, color: Color.gray),
    ]
}


