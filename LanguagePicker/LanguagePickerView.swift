//
//  ContentView.swift
//  LanguagePicker
//
//  Created by Nicolas on 10/03/2024.
//

import SwiftUI
import SwiftData
import Foundation

enum LanguageType: String {
    case fr = "fr"
    case ko = "ko"
    case en = "en"
    case pt = "pt"
    case zh = "zh"
    case ja = "ja"
    case none = ""
}

struct LanguagePickerView: View {
    //    @Environment(\.modelContext) private var modelContext
    //    @Query private var items: [Item]
    
    @discardableResult
    func shell(_ command: String) -> String {
        let task = Process()
        let pipe = Pipe()
        
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        task.standardInput = nil
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
    
    func changeLanguage(forLanguage language: LanguageType) {
        shell("defaults write -g AppleLanguages -array \(language)")
        shell("killall Finder")
    }
    
    @State var whatIsSelected: LanguageType = .none
        
    var body: some View {
        HStack {
            Spacer(minLength: 5)
            VStack(alignment: .leading) {
                
                Text("  LanguagePicker 🌍")
                
                Divider()
          
                Button {
                    changeLanguage(forLanguage: LanguageType.fr)
                    whatIsSelected = .fr
                } label: {
                    Text("French")
                        .foregroundColor(whatIsSelected == .fr ? .green : .white)
                }
        
                Button {
                    changeLanguage(forLanguage: LanguageType.en)
                    whatIsSelected = .en
                } label: {
                    Text("English")
                        .foregroundColor(whatIsSelected == .en ? .green : .white)
                }
                        
                Button {
                    changeLanguage(forLanguage: LanguageType.ko)
                    whatIsSelected = .ko
                } label: {
                    Text("Korean")
                        .foregroundColor(whatIsSelected == .ko ? .green : .white)
                }
                
                Button {
                    changeLanguage(forLanguage: LanguageType.zh)
                    whatIsSelected = .zh
                } label: {
                    Text("Chinese")
                        .foregroundColor(whatIsSelected == .zh ? .green : .white)
                }
                
                Button {
                    changeLanguage(forLanguage: LanguageType.pt)
                    whatIsSelected = .pt
                } label: {
                    Text("Português")
                        .foregroundColor(whatIsSelected == .pt ? .green : .white)
                }
                
                Button {
                    changeLanguage(forLanguage: LanguageType.ja)
                    whatIsSelected = .ja
                } label: {
                    Text("Japanese")
                        .foregroundColor(whatIsSelected == .ja ? .green : .white)
                }
                
            }
        }
    }
}
#Preview {
    LanguagePickerView()
        .modelContainer(for: Item.self, inMemory: true)
}

//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//            .toolbar {
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
