//
//  CostListView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct CostListView: View {
    @StateObject var costListData = CostListData()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if costListData.costList.isEmpty {
                    Image("backImage")
                        .resizable()
                        .scaledToFit()
                } else {
                    List {
                        ForEach(costListData.costList) { item in
                            ListRow(item: item)
                        }
                        .onDelete(perform: costListData.delete)
                    }
                    .listStyle(InsetListStyle())
                }
                PlusButton(action: costListData.didTapPlusButton)
            }
        }
        .sheet(isPresented: $costListData.isAddView) {
            InputView(save: costListData.didTapSaveButton,
                      cancel: costListData.didTapCancelButton)
        }
    }
}

struct CostListView_Previews: PreviewProvider {
    static var previews: some View {
        CostListView()
    }
}
