//
//  ChartView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI
import Charts

struct ChartView: View {
    @EnvironmentObject var detailCardData: DetailCardData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer()
                VStack {
                    ChartCard()
                }
                .padding(.horizontal, 50)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(DetailCardData())
    }
}
