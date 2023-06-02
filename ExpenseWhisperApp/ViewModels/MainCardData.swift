//
//  MainCardData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class MainCardData: ObservableObject {
    static var used: Int = 0
    static var goal: Int = 0
    
    @Published var goalMoney: Int = 0
    @Published var usedMoney: Int = 0
    @Published var available: Int = 0
    @Published var isFlipped = false
    @Published var isFrist = false
    
    func updataGoal(goal: Int) {
        Self.goal = goal
    }
    
    func updataUsed(price: Int) {
        Self.used += price
        updataCard()
    }
    
    func clearUsed() {
        Self.used = 0
        updataCard()
    }
    
    func updataCard() {
        goalMoney = Self.goal
        usedMoney = Self.used
        available = Self.goal - Self.used
    }
    
    func didTapCard() {
        isFlipped.toggle()
    }
    
    func onAppear() {
        if self.goalMoney == 0 {
            isFrist = true
        }
    }
}
