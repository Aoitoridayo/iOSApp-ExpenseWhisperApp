//
//  Detail.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct Detail: View {
    let detail: String
    var body: some View {
        Text(detail)
            .padding(.horizontal)
            .opacity(0.7)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(detail: "本サービスで提供する情報は、その正確性、信頼性、完全性を保証するものではありません。\nサービス提供者は、本サービスの利用に関して利用者が被った損害につき、賠償する責任を一切負わないものとします。\n利用者は、自己の責任において当サービスを利用するものとし、当サービスの利用における一切の損害につき、サービス提供者を免責するものとします。\nサービス提供者は、いかなる場合にも有料にて提供されるサービス等で受領した利用料金の返金には応じません")
    }
}
