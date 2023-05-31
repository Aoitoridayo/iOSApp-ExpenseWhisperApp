//
//  ChartCard.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI
import Charts

struct ChartCard: View {
    @EnvironmentObject var detailCardData: DetailCardData
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 400)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    Spacer()
                    Text("グラフ")
                        .opacity(0.5)
                    Chart(detailCardData.costs) {
                        BarMark(
                            x: .value("kind", $0.empty),
                            y: .value("value", $0.usedCost)
                        )
                        .foregroundStyle(by: .value("Category", $0.category.title))
                    }
                    .padding([.all], 30)
                }
            )
    }
}

struct ChartCard_Previews: PreviewProvider {
    static var previews: some View {
        ChartCard()
            .environmentObject(DetailCardData())
    }
}
