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
    case unknown
    
    var title: String {
        switch self {
            
        case .emptyTitle:
            return "タイトル未入力"
        case .wrongPrice:
            return "不正な金額"
        case .emptyCategory:
            return "カテゴリー未選択"
        case .unknown:
            return "不明なエラー"
        }
    }
}
