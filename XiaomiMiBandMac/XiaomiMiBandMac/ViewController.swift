//
//  ViewController.swift
//  XiaomiMiBandMac
//
//  Created by Lukile on 16/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    override func loadView() {
        let view = NSView(frame: NSMakeRect(0,0,100,100))
        view.wantsLayer = true
        view.layer?.borderWidth = 2
        view.layer?.borderColor = NSColor.red.cgColor
        self.view = view
    }
  


}

