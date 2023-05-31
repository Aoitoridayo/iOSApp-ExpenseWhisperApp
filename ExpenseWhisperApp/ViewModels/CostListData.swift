//
//  CostListData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class CostListData: ObservableObject {
    @Published var costList: [Cost] = []
    @Published var isAddView = false
    
    func delete(offset: IndexSet) {
        costList.remove(atOffsets: offset)
    }
    
    func didTapSaveButton(cost: Cost) {
        costList.append(cost)
        isAddView = false
    }
    
    func didTapCancelButton() {
        isAddView = false
    }
}
