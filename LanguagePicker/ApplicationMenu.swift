//
//  ApplicationMenu.swift
//  LanguagePicker
//
//  Created by Nicolas on 09/06/2024.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    let languageModel = LanguageModel()
    
    func createMenu() -> NSMenu {
            let languagePickerView = LanguagePickerView(model: languageModel)
            
            let topView = NSHostingController(rootView: languagePickerView)
            topView.view.frame.size = CGSize(width: 145, height: 200)
            
            let customMenuItem = NSMenuItem()
            customMenuItem.view = topView.view
            menu.addItem(customMenuItem)
            
            menu.addItem(NSMenuItem.separator())
            
            let aboutMenuItem = NSMenuItem(title: "About LanguagePicker", action: #selector(about), keyEquivalent: "")
            aboutMenuItem.target = self
            menu.addItem(aboutMenuItem)
            
            let quitMenuItem = NSMenuItem(title: "Quit LanguagePicker", action: #selector(quit), keyEquivalent: "")
            quitMenuItem.target = self
            menu.addItem(quitMenuItem)
            
            return menu
        }
    
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(nil)
    }
}
