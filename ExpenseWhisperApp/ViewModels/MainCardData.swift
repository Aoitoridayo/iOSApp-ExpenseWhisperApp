//
//  MainCardData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class MainCardData: ObservableObject {
    static var used: Int = 0
    
    @Published var goalMoney: Int = 0
    @Published var usedMoney: Int = 0
    @Published var available: Int = 0
    @Published var isFlipped = false
    @Published var isTutprial = false
    @Published var isFrist = false
    
    func updataUsed(price: Int) {
        Self.used += price
        updataCard()
    }
    
    func clearUsed() {
        Self.used = 0
        updataCard()
    }
    
    func updataCard() {
        usedMoney = Self.used
        available = self.goalMoney - self.usedMoney
    }
    
    func didTapCard() {
        isFlipped.toggle()
    }
    
    func onAppear() {
        let result = UserDefaultsManager.shared.getGoal(key: KeyManager.goalKey)
        self.goalMoney = result
        if self.goalMoney == 0 {
            isTutprial = true
            isFrist = true
        }
        updataCard()
    }
    
    func set() {
        UserDefaultsManager.shared.setGoal(goal: goalMoney, key: KeyManager.goalKey)
    }
    
    func clearAll() {
        clearUsed()
        self.goalMoney = 0
        set()
    }
}
