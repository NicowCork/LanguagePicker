//
//  LanguagePickerApp.swift
//  LanguagePicker
//
//  Created by Nicolas on 10/03/2024.
//



import SwiftUI
import SwiftData

@main
struct LanguagePickerApp: App {
    
    @StateObject private var languageModel = LanguageModel()
       
       var body: some Scene {
           @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
           Settings {
               EmptyView()
           }
       }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let appMenu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        
        let menu = appMenu.createMenu()
        
        statusBarItem.button?.image = NSImage(named: NSImage.Name("menu_icone_g"))
        statusBarItem.button?.imagePosition = .imageLeading
        statusBarItem.button?.frame.size = CGSize(width: 16, height: 16)
        statusBarItem.menu = menu
    }
}
