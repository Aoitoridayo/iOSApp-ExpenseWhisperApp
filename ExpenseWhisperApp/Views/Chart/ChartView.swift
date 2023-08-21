//
//  ChartView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct ChartView: View {
    @EnvironmentObject var detailCardData: DetailCardData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer()
                VStack(spacing: 30) {
                    BarGraphCard()
                    ChartCard()
//                    DateCard()
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
            .environmentObject(MainCardData())
            .environmentObject(ChartData())
    }
}
