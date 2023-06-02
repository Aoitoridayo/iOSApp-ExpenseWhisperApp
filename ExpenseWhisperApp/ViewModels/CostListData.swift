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
    
    func deleteCost(item: Cost) {
        guard let index = costList.firstIndex(where: { $0.id == item.id }) else {
            return
        }
        self.costList.remove(at: index)
        set()
    }
    
    func didTapSaveButton(cost: Cost) {
        costList.append(cost)
        set()
        isAddView = false
    }
    
    func didTapCancelButton() {
        isAddView = false
    }
    
    func didTapPlusButton() {
        isAddView = true
    }
    
    private func set() {
        do {
            try UserDefaultsManager.shared.setList(costs: costList, key: KeyManager.listKey)
        } catch {
            let error = error as? UserDefaultsError ?? UserDefaultsError.unknownError
            print(error)
        }
    }
    
    func onAppear() {
        do {
            let result = try UserDefaultsManager.shared.getList(key: KeyManager.listKey)
            self.costList = result
        } catch {
            let error = error as? UserDefaultsError ?? UserDefaultsError.unknownError
            print(error)
            self.costList = []
        }
    }
}
