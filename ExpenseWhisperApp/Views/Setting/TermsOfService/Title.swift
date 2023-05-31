//
//  Title.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct Title: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .padding(.leading, 20)
                .opacity(0.8)
            Spacer()
        }
        
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(title: "タイトル")
    }
}
