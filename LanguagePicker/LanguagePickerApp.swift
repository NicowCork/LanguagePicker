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
    var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        
        let menu = createMenu()
        
        statusBarItemm.button?.image = NSImage(named: NSImage.Name("menu_icone_g"))
        statusBarItemm.button?.imagePosition = .imageLeading
        statusBarItemm.button?.frame.size = CGSize(width: 16, height: 16)
        statusBarItemm.menu = menu
        
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: SettingView())
        
    }
    
    func createMenu() -> NSMenu {
        let menu = NSMenu()
        
        let settingsAboutItem = NSMenuItem(title: "Settings", action: #selector(showView), keyEquivalent: "")
        settingsAboutItem.target = self
        menu.addItem(settingsAboutItem)
        
        let aboutMenuItem = NSMenuItem(title: "About LanguagePicker", action: #selector(about), keyEquivalent: "")
        aboutMenuItem.target = self
        menu.addItem(aboutMenuItem)
        
        let quitMenuItem = NSMenuItem(title: "Quit LanguagePicker", action: #selector(quit), keyEquivalent: "")
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)
        
        return menu
    }
    
    @objc func showView(sender: NSMenuItem) {
        if let button = statusBarItemm.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
    
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(nil)
    }
}
