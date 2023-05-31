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
        case charts = "情報"
        case setting = "設定"
        
        var id: Self { self }
    }
    
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
                
                InputView()
                    .tabItem({
                        Image(systemName: "note.text")
                        Text("詳細")
                    })
                    .tag(Tabs.input)
                
                ChartView()
                    .tabItem({
                        VStack {
                            Image(systemName: "chart.bar")
                            Text("データ")
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
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
