//
//  SettingView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var mainCardData: MainCardData
    
    @State private var isTerms = false
    @State private var isShared = false
    @State private var isSetView = false
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    HStack {
                        Button(action: {
                            isSetView = true
                        }) {
                            Text("目標設定")
                        }
                    }
                }, header: { Text("基本設定") })
                
                Section(content: {
                    //                    NavigationLink("レビューを書く", destination: Color.red)
                    Button(action: {
                        isShared = true
                    }) {
                        Text("アプリをシェア")
                    }
                }, header: { Text("評価") })
                
                Section(content: {
                    NavigationLink("利用規約", destination: TermsOfServiceView())
                    HStack {
                        Text("バージョン")
                        Spacer()
                        Text("1.0")
                    }
                }, header: { Text("情報") })
            }
        }
        .sheet(isPresented: $isShared) {
            ActivityView(activityItems: [URLManager.share])
        }
        .sheet(isPresented: $isSetView) {
            SettingGoalView(
                text: String(mainCardData.goalMoney),
                save: { price in
                    MainCardData.goal = price
                    mainCardData.updataCard()
                    isSetView = false
                },
                cancel: { isSetView = false }
            )
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(MainCardData())
    }
}
