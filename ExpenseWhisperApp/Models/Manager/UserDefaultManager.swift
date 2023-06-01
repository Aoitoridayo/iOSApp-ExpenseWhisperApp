//
//  UserDefaultManager.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/02.
//

import Foundation

class UserDefaultsManager {
    let userDefaults = UserDefaults.standard

    func setList(costs: [Cost], key: String) throws {
        guard let json = encodeList(costs: costs) else {
            throw UserDefaultsError.encodeError
        }
        userDefaults.set(json, forKey: KeyManager.listKey)
    }

    func getList(key: String) throws -> [Cost] {
        guard let json = userDefaults.string(forKey: key) else {
            throw UserDefaultsError.getFailure
        }
        guard let costs = decodeList(json: json) else {
            throw UserDefaultsError.decodeError
        }
        return costs
    }
    
    func setGoal() throws {
        
    }
    
    func getGoal() throws {
        
    }
    

    private func encodeList(costs: [Cost]) -> String? {
        do {
            let data = try JSONEncoder().encode(costs)
            guard let json = String(data: data, encoding: .utf8) else {
                return nil
            }
            return json
        } catch {
            return nil
        }
    }
    
    private func decodeList(json: String) -> [Cost]? {
        do {
            guard let data = json.data(using: .utf8) else {
                return nil
            }
            let costs = try JSONDecoder().decode([Cost].self, from: data)
            return costs
        } catch {
            return nil
        }
    }
    
    private func encodeGoal() {
        
    }
    
    private func decodeGoal() {
        
    }
}

