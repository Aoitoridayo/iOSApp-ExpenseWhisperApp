//
//  SettingView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var mainCardData: MainCardData
    @EnvironmentObject var costListData: CostListData
    @EnvironmentObject var chartData: ChartData
    @EnvironmentObject var detailCardData: DetailCardData
    
    @State private var isTerms = false
    @State private var isShared = false
    @State private var isSetView = false
//    @State private var isDetermineAlert = false
    @State private var isResetAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    Button(action: {
                        isSetView = true
                    }) {
                        Text("目標設定")
                    }
//                    Button(action: {
//                        isDetermineAlert = true
//                    }) {
//                        Text("支出を確定する")
//                    }
                }, header: { Text("基本設定") })
                
                Section(content: {
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
                Button(action: {
                    isResetAlert = true
                }) {
                    Text("入力をリセット")
                        .foregroundColor(Color.red)
                }
            }
        }
//        .alert("警告", isPresented: $isDetermineAlert) {
//            Button("キャンセル") {
//                isDetermineAlert = false
//            }
//            Button("続行") {
//                chartData.didTapDetermineButton(value: mainCardData.usedMoney)
//                detailCardData.clearAll()
//                costListData.clearAll()
//                mainCardData.clearUsed()
//                isDetermineAlert = false
//            }
//        } message: {
//            Text("今月の支出が確定され\n入力がリセットされます")
//        }
        .alert("警告", isPresented: $isResetAlert) {
            Button("キャンセル") {
                isResetAlert = false
            }
            Button("続行") {
//                mainCardData.clearAll()
                costListData.clearAll()
//                chartData.clearAll()
                detailCardData.clearAll()
                isResetAlert = false
            }
        } message: {
            Text("支出の入力がリセットされます")
        }
        .sheet(isPresented: $isShared) {
            ActivityView(activityItems: [URLManager.share])
        }
        .sheet(isPresented: $isSetView) {
            SettingGoalView(
                text: String(mainCardData.goalMoney),
                save: { price in
                    mainCardData.goalMoney = price
                    mainCardData.set()
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
            .environmentObject(CostListData())
            .environmentObject(ChartData())
            .environmentObject(DetailCardData())
    }
}
