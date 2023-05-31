//
//  CostListData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class CostListData: ObservableObject {
    @Published var costList: [Cost] = [
//        Cost(title: "焼肉", price: 12000, category: CostCategory.food),
//        Cost(title: "新幹線", price: 20000, category: CostCategory.transportation),
//        Cost(title: "ゲーム", price: 6000, category: CostCategory.entertainment),
//        Cost(title: "ハンドクリーム", price: 800, category: CostCategory.medicalAndCosme),
//        Cost(title: "筆記具", price: 400, category: CostCategory.livingware),
//        Cost(title: "お小遣い", price: 1000, category: CostCategory.others)
    ]
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
    
    func didTapPlusButton() {
        isAddView = true
    }
}
