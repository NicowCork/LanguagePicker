//
//  LanguageModel.swift
//  LanguagePicker
//
//  Created by Nicolas on 09/06/2024.
//

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

class LanguageModel: ObservableObject {
    @Published var currentLanguage: LanguageType = .none

    @discardableResult
    private func shell(_ command: String) -> String {
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
    
    func changeLanguage(to language: LanguageType) {
        shell("defaults write -g AppleLanguages -array \(language.rawValue)")
        shell("killall Finder")
        currentLanguage = language
    }
}
