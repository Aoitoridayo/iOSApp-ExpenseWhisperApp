//
//  RankingCard.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct RankingCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 400)
            .shadow(radius: 5)
    }
}

struct RankingCard_Previews: PreviewProvider {
    static var previews: some View {
        RankingCard()
    }
}
