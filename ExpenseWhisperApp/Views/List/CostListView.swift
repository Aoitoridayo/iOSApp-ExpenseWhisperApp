//
//  CostListView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct CostListView: View {
    @EnvironmentObject var mainCardData: MainCardData
    @EnvironmentObject var costListData: CostListData
    @EnvironmentObject var detailCardData: DetailCardData
    
    var body: some View {
        NavigationStack {
            ZStack {
                if costListData.costList.isEmpty {
                    Image("BackGroundImage")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.8)
                        .transition(.slide)
                } else {
                    List(costListData.costList) { item in
                        ListRow(item: item)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    withAnimation {
                                        costListData.deleteCost(item: item)
                                        detailCardData.minusCost(cost: item)
                                        mainCardData.updataCard()
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                    }
                    .listStyle(InsetListStyle())
                    .transition(.slide)
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
            .environmentObject(MainCardData())
            .environmentObject(CostListData())
            .environmentObject(DetailCardData())
    }
}
