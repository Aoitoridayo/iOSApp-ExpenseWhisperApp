//
//  Tutorial1.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/02.
//

import SwiftUI

struct Tutorial1: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 600)
            .shadow(radius: 5)
            .overlay(
                Image("tutorial1")
                    .resizable()
                    .scaledToFit()
            )
    }
}

struct Tutorial1_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial1()
    }
}
