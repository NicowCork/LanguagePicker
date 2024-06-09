//
//  ContentView.swift
//  LanguagePicker
//
//  Created by Nicolas on 10/03/2024.
//


import SwiftUI

struct LanguagePickerView: View {
    @ObservedObject var model: LanguageModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("LanguagePicker 🌍")
            Divider()
            
            Button {
                model.changeLanguage(to: .fr)
            } label: {
                Text("French")
                    .foregroundColor(model.currentLanguage == .fr ? .green : .white)
            }
            
            Button {
                model.changeLanguage(to: .en)
            } label: {
                Text("English")
                    .foregroundColor(model.currentLanguage == .en ? .green : .white)
            }
            
            Button {
                model.changeLanguage(to: .ko)
            } label: {
                Text("Korean")
                    .foregroundColor(model.currentLanguage == .ko ? .green : .white)
            }
            
            Button {
                model.changeLanguage(to: .zh)
            } label: {
                Text("Chinese")
                    .foregroundColor(model.currentLanguage == .zh ? .green : .white)
            }
            
            Button {
                model.changeLanguage(to: .pt)
            } label: {
                Text("Portuguese")
                    .foregroundColor(model.currentLanguage == .pt ? .green : .white)
            }
            
            Button {
                model.changeLanguage(to: .ja)
            } label: {
                Text("Japanese")
                    .foregroundColor(model.currentLanguage == .ja ? .green : .white)
            }
        }.padding(10)
    }
}
