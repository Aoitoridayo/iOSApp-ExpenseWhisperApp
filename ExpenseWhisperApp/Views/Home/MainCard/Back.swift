//
//  Back.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct Back: View {
    @EnvironmentObject var mainCardData: MainCardData
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 200)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    VStack {
                        Spacer()
                        Text("使える金額")
                            .opacity(0.5)
                        Spacer()
                        Text("\(mainCardData.available)円")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .rotationEffect(.degrees(180))
                    .scaleEffect(x: -1, y: 1, anchor: .center)
                }
            )
    }
}

struct Back_Previews: PreviewProvider {
    static var previews: some View {
        Back()
            .environmentObject(MainCardData())
    }
}
