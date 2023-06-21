//
//  ChartData.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import Foundation

class ChartData: ObservableObject {
    
    @Published var dateList: [DateData] = [
        DateData(date: "01", value: 0),
        DateData(date: "02", value: 0),
        DateData(date: "03", value: 0),
        DateData(date: "04", value: 0),
        DateData(date: "05", value: 0),
        DateData(date: "06", value: 0),
        DateData(date: "07", value: 0),
        DateData(date: "08", value: 0),
        DateData(date: "09", value: 0),
        DateData(date: "10", value: 0),
        DateData(date: "11", value: 0),
        DateData(date: "12", value: 0)
    ]
    private func inputDate(item: DateData) {
        guard let index = self.dateList.firstIndex(where: { $0.date == item.date }) else {
            return
        }
        dateList[index].value = item.value
    }
    
    func didTapDetermineButton(value: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        let date = formatter.string(from: Date())
        inputDate(item: DateData(date: date, value: value))
        set()
    }
    
    private func set() {
        do {
            try UserDefaultsManager.shared.setChart(data: dateList, key: KeyManager.chartsKey)
        } catch {
            let error = error as? UserDefaultsError ?? UserDefaultsError.unknownError
            print(error)
        }
    }
    
    func onAppear() {
        do {
            let result = try UserDefaultsManager.shared.getCharts(key: KeyManager.chartsKey)
            self.dateList = result
        } catch {
            let error = error as? UserDefaultsError ?? UserDefaultsError.unknownError
            print(error)
        }
    }
    
    func clearAll() {
        for index in self.dateList.indices {
            self.dateList[index].value = 0
        }
        set()
    }
}
