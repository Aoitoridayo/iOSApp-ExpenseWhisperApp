//
//  DetailCardData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class DetailCardData: ObservableObject {
    
    @Published var costs: [UsedCost] = [
        UsedCost(usedCost: 0, category: CostCategory.food, empty: "食"),
        UsedCost(usedCost: 0, category: CostCategory.transportation, empty: "交"),
        UsedCost(usedCost: 0, category: CostCategory.entertainment, empty: "娯"),
        UsedCost(usedCost: 0, category: CostCategory.medicalAndCosme, empty: "医"),
        UsedCost(usedCost: 0, category: CostCategory.livingware, empty: "生"),
        UsedCost(usedCost: 0, category: CostCategory.others, empty: "他")
    ]
    
    func plusCost(cost: Cost) {
        switch cost.category {
        case .food:
            self.costs[0].usedCost += cost.price
        case .transportation:
            self.costs[1].usedCost += cost.price
        case .entertainment:
            self.costs[2].usedCost += cost.price
        case .medicalAndCosme:
            self.costs[3].usedCost += cost.price
        case .livingware:
            self.costs[4].usedCost += cost.price
        case .others:
            self.costs[5].usedCost += cost.price
        }
    }
    
    func minusCost(cost: Cost) {
        switch cost.category {
        case .food:
            self.costs[0].usedCost -= cost.price
            MainCardData.used -= cost.price
        case .transportation:
            self.costs[1].usedCost -= cost.price
            MainCardData.used -= cost.price
        case .entertainment:
            self.costs[2].usedCost -= cost.price
            MainCardData.used -= cost.price
        case .medicalAndCosme:
            self.costs[3].usedCost -= cost.price
            MainCardData.used -= cost.price
        case .livingware:
            self.costs[4].usedCost -= cost.price
            MainCardData.used -= cost.price
        case .others:
            self.costs[5].usedCost -= cost.price
            MainCardData.used -= cost.price
        }
    }
    
    func firstCalclation(costs: [Cost]) {
        for cost in costs {
            plusCost(cost: cost)
        }
        updata()
    }
    
    func clear() {
        for index in self.costs.indices {
            self.costs[index].usedCost = 0
        }
    }
    
    private func updata() {
        MainCardData.used = 0
        
        for cost in costs {
            MainCardData.used += cost.usedCost
        }
    }
}
