//
//  PlusButton.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct PlusButton: View {
    let action: () -> Void
        var body: some View {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        action()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                    }
                    .frame(width: 70, height: 70)
                    .padding()
                }
            }
        }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton(action: {})
    }
}
