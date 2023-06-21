//
//  DateCard.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/19.
//

import SwiftUI
import Charts

struct DateCard: View {
    @EnvironmentObject var chartData: ChartData
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 500)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    Chart(chartData.dateList) {
                        BarMark(
                            x: .value("kind", $0.value),
                            y: .value("value", $0.date + "月 " + "\($0.value)円")
                        )
                        .foregroundStyle(by: .value("Category", $0.date))
                    }
                    .chartLegend(.hidden
                    )
                    .padding([.all], 30)
                }
            )
            .onAppear(perform: chartData.onAppear)
    }
}

struct DateCard_Previews: PreviewProvider {
    static var previews: some View {
        DateCard()
            .environmentObject(ChartData())
    }
}
