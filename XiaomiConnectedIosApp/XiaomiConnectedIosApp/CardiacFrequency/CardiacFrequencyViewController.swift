//
//  CardiacFrequencyViewController.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 06/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import UIKit

class CardiacFrequencyViewController: UIViewController {
    lazy var xiaomiService = XiaomiMiBand2Service()
    
    @IBAction func synchronize(_ sender: Any) {
        xiaomiService.synchronizePeripherals()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
}






