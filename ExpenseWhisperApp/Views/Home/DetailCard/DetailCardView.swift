//
//  DetailCardView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct DetailCardView: View {
    @EnvironmentObject var detailCardData: DetailCardData
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 800)
            .shadow(radius: 5)
            .overlay(
                VStack(spacing: 50) {
                    Text("使った金額")
                        .opacity(0.5)
                    ForEach(detailCardData.costs) { cost in
                        VStack(spacing: 15) {
                            HStack {
                                Image(systemName: "app.fill")
                                    .foregroundColor(cost.category.color)
                                Text(cost.category.title)
                            }
                            HStack {
                                Text("\(cost.usedCost)円")
                                    .font(.title)
                            }
                        }
                    }
                }
            )
    }
}

struct DetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardView()
            .environmentObject(DetailCardData())
    }
}
