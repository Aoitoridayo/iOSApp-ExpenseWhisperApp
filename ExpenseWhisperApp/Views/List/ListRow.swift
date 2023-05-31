//
//  ListRow.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct ListRow: View {
    @State var item: Cost
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                Spacer()
                Text("\(item.price)円")
            }
            .font(.title3)
            .padding()
            HStack {
                Image(systemName: "app.fill")
                    .foregroundColor(item.category.color)
                Text(item.category.title)
            }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(item: Cost(title: "おかし", price: 400, category: CostCategory.food))
    }
}
