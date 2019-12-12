//
//  XiaomiMiBand2Service.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 12/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import Foundation
import CoreBluetooth

class XiaomiMiBand2Service: NSObject {
    //CentralManager used to discover nearby peripherals
    lazy var manager = CBCentralManager(delegate: self, queue: DispatchQueue.main, options: nil)
    
    var foundPeripherals: [CBPeripheral] = []
    
    override init() {
        super.init()
    }
    
    func synchronizePeripherals() {
        manager.scanForPeripherals(withServices: nil, options: nil)
    }
}


extension XiaomiMiBand2Service: CBCentralManagerDelegate {
    //scan for nearby peripherals
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            manager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    //called every time new peripheral is discovered
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
        foundPeripherals.append(peripheral)
    }
}

extension XiaomiMiBand2Service: CBPeripheralDelegate {
    
}
