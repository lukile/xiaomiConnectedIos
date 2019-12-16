//
//  AppDelegate.swift
//  XiaomiMiBandMac
//
//  Created by Lukile on 16/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    private var window: NSWindow?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let windowSize = NSSize(width: 480, height: 480)
        let screenSize = NSScreen.main?.frame.size ?? .zero
        let rect = NSMakeRect(screenSize.width/2 - windowSize.width/2,
                              screenSize.height/2 - windowSize.height/2,
                              windowSize.width,
                              windowSize.height)
        window = NSWindow(contentRect: rect,
                          styleMask: [.miniaturizable, .closable, .resizable, .titled],
                          backing: .buffered,
                          defer: false)
        
              
        window?.makeKeyAndOrderFront(nil)
        
        // Load Content View Controller for Window
        let bundle = Bundle(for: MyViewController.self)
        let storyboard = NSStoryboard(name: "MyView", bundle: bundle)
        guard let myViewController =     storyboard.instantiateInitialController() as? MyViewController
            else {return}
        window?.contentViewController = myViewController
        
    
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

