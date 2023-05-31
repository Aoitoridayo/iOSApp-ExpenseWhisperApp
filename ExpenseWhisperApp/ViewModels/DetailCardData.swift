//
//  DetailCardData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class DetailCardData: ObservableObject {
    
    @Published var costs: [UsedCost] = [
        UsedCost(usedCost: 0, category: CostCategory.food),
        UsedCost(usedCost: 0, category: CostCategory.transportation),
        UsedCost(usedCost: 0, category: CostCategory.entertainment),
        UsedCost(usedCost: 0, category: CostCategory.medicalAndCosme),
        UsedCost(usedCost: 0, category: CostCategory.livingware),
        UsedCost(usedCost: 0, category: CostCategory.others)
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
    
}
