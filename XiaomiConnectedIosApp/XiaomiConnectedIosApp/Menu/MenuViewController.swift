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
    
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    var menu: [Menu] = [Menu]()
    
    var size = CGSize(width: 50, height: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMenuArray()
        self.menuTableView.delegate = self
        
        self.menuTableView.dataSource = self
   
    }

    
    
    func createMenuArray() {
        menu.append(Menu(featureName: "Cardiac frequency", featureImage: UIImage(named: "heartbeat")  ?? UIImage(named: "default")!))
        menu.append(Menu(featureName: "Pedometer", featureImage: UIImage(named: "foot") ?? UIImage(named: "default")!))
        menu.append(Menu(featureName: "Battery life", featureImage: UIImage(named: "batteryLife") ?? UIImage(named: "default")!))
        menu.append(Menu(featureName: "Accelerometer datas", featureImage: UIImage(named: "accelerometer") ?? UIImage(named: "default")!))
        menu.append(Menu(featureName: "Calorie tracking", featureImage: UIImage(named: "calorie") ?? UIImage(named: "default")!))
 
       
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
       
        sizeTableView(menuTableView: self.menuTableView, menu: self.menu)
        
        return cell
    }
    
    
}

func sizeTableView(menuTableView: UITableView, menu: [Menu]) {
    var height: Int = Int(menuTableView.rowHeight)
    height *= menu.count
    
    var tableFrame: CGRect = menuTableView.frame
    tableFrame.size.height = CGFloat(height)
    menuTableView.frame = tableFrame
}

extension MenuViewController: UITableViewDelegate {
    
}
