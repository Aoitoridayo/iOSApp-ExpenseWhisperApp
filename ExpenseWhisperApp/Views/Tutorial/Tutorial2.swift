//
//  Tutorial2.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/02.
//

import SwiftUI

struct Tutorial2: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 300, height: 600)
            .shadow(radius: 5)
            .overlay(
                Image("tutorial2")
                    .resizable()
                    .scaledToFit()
            )
    }

}

struct Tutorial2_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial2()
    }
}
