//
//  BarGraphCard.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/01.
//

import SwiftUI
import Charts

struct BarGraphCard: View {
    @EnvironmentObject var detailCardData: DetailCardData
    @EnvironmentObject var mainCardData: MainCardData
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 250)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    Spacer()
                    Text("使った金額")
                        .opacity(0.5)
                    Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            Text("\(mainCardData.usedMoney) / \(mainCardData.goalMoney)円")
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 30)
                        Chart(detailCardData.costs) {
                            BarMark(
                                x: .value("value", $0.usedCost)
                            )
                            .foregroundStyle(by: .value("Category", $0.category.title))
                        }
                        .chartXScale(domain: [0, mainCardData.goalMoney])
                        .frame(height: 100)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .chartPlotStyle { content in
                            content
                                .background(Color(white: 0.85))
                                .cornerRadius(10)
                        }
                    }
                }
            )
    }
}

struct BarGraphCard_Previews: PreviewProvider {
    static var previews: some View {
        BarGraphCard()
            .environmentObject(DetailCardData())
            .environmentObject(MainCardData())
    }
}
