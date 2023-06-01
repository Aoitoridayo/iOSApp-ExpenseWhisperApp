//
//  ExpenseWhisperAppApp.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

@main
struct ExpenseWhisperAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(MainCardData())
                .environmentObject(DetailCardData())
                .environmentObject(CostListData())
        }
    }
}
