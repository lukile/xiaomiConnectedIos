//
//  BatteryLifeViewController.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 06/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import UIKit
import CoreBluetooth

class BatteryLifeViewController: UIViewController {
    @IBAction func synchronize(_ sender: Any) {
        xiaomiService.synchronizePeripherals()
    }

    lazy var xiaomiService = XiaomiMiBand2Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = xiaomiService
    }
}
