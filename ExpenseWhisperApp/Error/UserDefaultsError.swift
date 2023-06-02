//
//  UserDefaultsError.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/02.
//

import Foundation

enum UserDefaultsError: Error {
    case getFailure
    case decodeError
    case encodeError
    case unknownError
}
