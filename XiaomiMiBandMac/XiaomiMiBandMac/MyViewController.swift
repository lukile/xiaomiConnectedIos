//
//  MyViewController.swift
//  XiaomiMiBandMac
//
//  Created by Lukile on 16/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import Foundation
import Cocoa

class MyViewController: NSViewController {
    var xiaomiService = XiaomiMiBand2Service()
    override func loadView() {
        let view = NSView(frame: NSMakeRect(0,0,450,400))
        view.wantsLayer = true
        view.layer?.borderWidth = 2
        view.layer?.borderColor = NSColor.red.cgColor
        self.view = view
        
        
        var newBut = NSButton(frame: NSRect(x: 150, y: 200, width: 100, height: 50))
        newBut.title = "syncrhonize!"
        self.view.addSubview(newBut)
        

        newBut.action = #selector(MyViewController.printsomething)
    }
    @objc
    func printsomething() {

        //xiaomiService.synchronizePeripherals()
    }
}


