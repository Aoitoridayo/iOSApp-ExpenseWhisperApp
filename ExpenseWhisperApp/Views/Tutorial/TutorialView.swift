//
//  TutorialView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/02.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 50) {
                    Tutorial1()
                    Tutorial2()
                }
                .padding(.horizontal)
            }
            .navigationTitle("チュートリアル")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
