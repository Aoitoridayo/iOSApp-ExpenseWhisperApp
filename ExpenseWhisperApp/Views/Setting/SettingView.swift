//
//  SettingView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    Text("目標設定")
                }, header: { Text("基本設定") })
                
                Section(content: {
                    Text("レビューを書く")
                    Text("アプリをシェア")
                }, header: { Text("評価") })
                
                Section(content: {
                    Text("利用規約")
                    HStack {
                        Text("バージョン")
                        Spacer()
                        Text("1.0")
                    }
                }, header: { Text("情報") })
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
