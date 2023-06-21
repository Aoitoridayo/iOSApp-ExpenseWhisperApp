//
//  DateData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/19.
//

import Foundation

struct DateData: Identifiable, Codable {
    let date: String
    var value: Int
    
    var id: String { date }
}
