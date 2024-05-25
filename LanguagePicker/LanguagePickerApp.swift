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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        Settings {
            EmptyView()
        }
        .modelContainer(sharedModelContainer)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItemm = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        
        statusBarItemm.button?.image = NSImage(named: NSImage.Name("menu_icone_g"))
        statusBarItemm.button?.imagePosition = .imageLeading
        statusBarItemm.button?.frame.size = CGSize(width: 16, height: 16)
        statusBarItemm.menu = menu.createMenu()
        
    }
}
