//
//  SettingView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct SettingView: View {
    @State private var isTerms = false
    @State private var isShared = false
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    Text("目標設定")
                }, header: { Text("基本設定") })
                
                Section(content: {
                    Text("レビューを書く")
                    Button(action: {
                        isShared = true
                    }) {
                        Text("アプリをシェア")
                    }
                }, header: { Text("評価") })
                
                Section(content: {
                    Button(action: {
                        isTerms = true
                    }) {
                        Text("利用規約")
                    }
                    HStack {
                        Text("バージョン")
                        Spacer()
                        Text("1.0")
                    }
                }, header: { Text("情報") })
            }
        }
        .sheet(isPresented: $isTerms) {
            TermsOfServiceView()
        }
        .sheet(isPresented: $isShared) {
            ActivityView(activityItems: [URLManager.share])
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
