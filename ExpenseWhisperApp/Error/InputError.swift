//
//  InputError.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

enum InputError: Error {
    case emptyTitle
    case wrongPrice
    case emptyCategory
    
    var title: String {
        switch self {
            
        case .emptyTitle:
            return "タイトルを入力してください"
        case .wrongPrice:
            return "正しい金額を入力してください"
        case .emptyCategory:
            return "カテゴリーを選択してください"
        }
    }
}
