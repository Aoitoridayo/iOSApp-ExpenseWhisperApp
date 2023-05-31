//
//  InputView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/05/31.
//

import SwiftUI

struct InputView: View {
    
    @EnvironmentObject var mainCardData: MainCardData
    @EnvironmentObject var detailCardData: DetailCardData
    
    @State private var title = ""
    @State private var price = ""
    @State private var detail = ""
    @State private var category: CostCategory = CostCategory.food
    
    @State private var isAlert = false
    @State private var message = ""
    
    let save: (Cost) -> Void
    let cancel: () -> Void
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("タイトル", text: $title)
                        .keyboardType(.default)
                    ZStack {
                        TextField("金額 (円)", text: $price)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                Section {
                    Picker("カテゴリー", selection: $category) {
                        Text("食費").tag(CostCategory.food)
                        Text("交通費").tag(CostCategory.transportation)
                        Text("娯楽").tag(CostCategory.entertainment)
                        Text("医薬品・コスメ").tag(CostCategory.medicalAndCosme)
                        Text("生活用品").tag(CostCategory.livingware)
                        Text("その他").tag(CostCategory.others)
                    }
                }
                
                Section {
                    ZStack(alignment: .topLeading) {
                        if detail.isEmpty {
                            Text("詳細")
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                                .padding(.leading, 8)
                        }
                        TextEditor(text: $detail)
                            .frame(height: 150)
                            .keyboardType(.default)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        cancel()
                    }) {
                        Text("キャンセル")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        do {
                            let item = try create()
                            save(item)
                            mainCardData.updataUsed(price: item.price)
                            detailCardData.plusCost(cost: item)
                        } catch {
                            let error = error as? InputError ?? InputError.unknown
                            showAlert(message: error.title)
                        }
                    }) {
                        Text("追加")
                    }
                }
            }
            .navigationTitle("新規作成")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert(message, isPresented: $isAlert, actions: {})
    }
    
    private func create() throws -> Cost {
        guard !title.isEmpty else {
            throw InputError.emptyTitle
        }
        guard let price = Int(price) else {
            throw InputError.wrongPrice
        }
        let item = Cost(title: title, price: price, category: category)
        return item
    }
    
    private func showAlert(message: String) {
        self.message = message
        isAlert = true
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(save: { _ in }, cancel: {})
            .environmentObject(MainCardData())
            .environmentObject(DetailCardData())
    }
}
