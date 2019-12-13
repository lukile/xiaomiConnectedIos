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
    private let ids: [XiaomiMiBand2UUID] = [.battery]
    
   
    
    override init() {
        super.init()
        _ = manager
    }
    
    //Just for scan all peripherals available
    func synchronizePeripherals() {
        manager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    //Connect to the appropriate peripheral
    func connectPeripheral(at index: Int) {
        manager.connect(foundPeripherals[index], options: nil)
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
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print(peripheral.services?.map({ ($0, $0.uuid.uuidString) }) as Any)
        peripheral.services?.forEach { service in
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print(error ?? service.characteristics)
        service.characteristics?.forEach { characteristic in
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
  
}
