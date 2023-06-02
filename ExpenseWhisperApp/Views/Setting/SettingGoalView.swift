//
//  SettingGoalView.swift
//  ExpenseWhisperApp
//
//  Created by 渡邊魁優 on 2023/06/02.
//

import SwiftUI

struct SettingGoalView: View {
    @EnvironmentObject var mainCardData: MainCardData
    
    @State private var isAlert = false
    @State private var message = ""
    
    @State var text: String
    @State var new: String = ""
    
    let save: (Int) -> Void
    let cancel: () -> Void
    
    var body: some View {
        NavigationStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(width: 300, height: 200)
                .shadow(radius: 5)
                .overlay(
                    VStack {
                        Text("目標金額")
                            .opacity(0.5)
                        HStack {
                            TextField(text, text: $new)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            .keyboardType(.numberPad)
                            Text("円")
                                .opacity(0.5)
                                .padding(.trailing)
                        }
                        .font(.title)
                    }
            )
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
                                let price = try parse(text: new)
                                save(price)
                            } catch {
                                let error = error as? InputError ?? InputError.unknown
                                showAlert(message: error.title)
                            }
                        }) {
                            Text("保存")
                        }
                    }
                }
        }
        .alert(message, isPresented: $isAlert, actions: {})
    }
    private func parse(text: String) throws -> Int {
        guard let price = Int(text) else {
            throw InputError.wrongPrice
        }
        return price
    }
    
    private func showAlert(message: String) {
        self.message = message
        isAlert = true
    }
}

struct SettingGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SettingGoalView(text: "15000", save: { _ in }, cancel: {})
            .environmentObject(MainCardData())
    }
}
