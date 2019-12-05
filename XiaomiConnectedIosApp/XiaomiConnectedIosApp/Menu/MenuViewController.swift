//
//  MenuViewController.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 05/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var menuTableView: UITableView!
    
    var menu: [Menu] = [Menu]()
    
    var size = CGSize(width: 40, height: 25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMenuArray()
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
    }

    func createMenuArray() {
        menu.append(Menu(featureName: "Cardiac Frequency", featureImage: UIImage(named: "heartbeat")!))
        menu.append(Menu(featureName: "Pedometer", featureImage: UIImage(named: "foot")!))
    }
    
    func resizeImage(newSize: CGSize, image: UIImage) -> UIImage {
        guard image.size != newSize else {
            return image
        }
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = menu[indexPath.row]
   
        cell.textLabel?.text = item.featureName
        cell.imageView!.image = resizeImage(newSize: size, image: item.featureImage)
        return cell
    }
    
    
}

extension MenuViewController: UITableViewDelegate {
    
}
