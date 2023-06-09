//
//  MainTabView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct MainTabView: View {
    
    enum Tabs: String, CaseIterable, Identifiable {
        case home = "ホーム"
        case input = "入力"
        case charts = "詳細"
        case setting = "設定"
        
        var id: Self { self }
    }
    
    @EnvironmentObject var mainCardData: MainCardData
    @EnvironmentObject var detailCardData: DetailCardData
    @EnvironmentObject var costListData: CostListData
    
    @State private var navigationTitle: String = Tabs.home.rawValue
    @State private var selectionTab: Tabs = .home
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectionTab) {
                HomeView()
                    .tabItem({
                        VStack {
                            Image(systemName: "house")
                            Text("ホーム")
                        }
                    })
                    .tag(Tabs.home)
                
                CostListView()
                    .tabItem({
                        Image(systemName: "note.text")
                        Text("入力")
                    })
                    .tag(Tabs.input)
                
                ChartView()
                    .tabItem({
                        VStack {
                            Image(systemName: "chart.bar")
                            Text("詳細")
                        }
                    })
                    .tag(Tabs.charts)
                
                SettingView()
                    .tabItem({
                        VStack {
                            Image(systemName: "gearshape")
                            Text("設定")
                        }
                    })
                    .tag(Tabs.setting)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: selectionTab) { _ in
                navigationTitle = selectionTab.rawValue
            }
            .onAppear(perform: costListData.onAppear)
            .onAppear {
                detailCardData.onAppear(costs: costListData.costList)
            }
            .onAppear(perform: mainCardData.onAppear)
        }
        .sheet(isPresented: $mainCardData.isTutprial) {
            TutorialView()
        }
        .sheet(isPresented: $mainCardData.isFrist) {
            SettingGoalView(
                text: String(mainCardData.goalMoney),
                save: {
                    mainCardData.goalMoney = $0
                    mainCardData.set()
                    mainCardData.updataCard()
                    mainCardData.isFrist = false
                },
                cancel: { mainCardData.isFrist = false })
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(MainCardData())
            .environmentObject(DetailCardData())
            .environmentObject(CostListData())
            .environmentObject(ChartData())
    }
}
