//
//  MainCardView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct MainCardView: View {
    @EnvironmentObject var mainCardData: MainCardData
    
    var body: some View {
        ZStack {
            Front()
            // isFlippedがtrueの場合、透明度を0（非表示）に、falseの場合は1（表示）にする
                .opacity(mainCardData.isFlipped ? 0 : 1)
            
            Back()
                .opacity(mainCardData.isFlipped ? 1 : 0)
        }
        // 3D回転アニメーションを適用。isFlippedがtrueの場合、180度回転させ、falseの場合は0度にする
        .rotation3DEffect(.degrees(mainCardData.isFlipped ? 180 : 0),
                          axis: (x: 1, y: 0, z: 0))
        // アニメーションの設定。値が変更されたときにアニメーションを実行
        .animation(.spring(response: 0.7, dampingFraction: 0.6, blendDuration: 0), value: mainCardData.isFlipped)
        .onTapGesture {
            mainCardData.didTapCard()
        }
        
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView()
            .environmentObject(MainCardData())
    }
}
