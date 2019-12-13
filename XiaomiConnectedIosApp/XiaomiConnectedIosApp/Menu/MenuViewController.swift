//
//  MenuViewController.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 05/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    let multipeerService = MultipeerService()
    
    
    var collectionView: UICollectionView!
    
    var customizeCollectionView: CustomCollectionView = CustomCollectionView()
    
    @IBOutlet var label: UILabel!
    
    
    var screensize = CGRect()

    var menu: [Menu] = [Menu]()
    
    var feedbackGenerator : UISelectionFeedbackGenerator? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        createMenuArray()

        let flowLayout = UICollectionViewFlowLayout()

        collectionView = UICollectionView(frame: screensize, collectionViewLayout: flowLayout)

        customizeCollectionView.customize(collectionView: collectionView)
        
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        view.addSubview(collectionView)
        
        customizeCollectionView.addConstraints(collectionView: collectionView, view: self.view)
        
        collectionView.delegate = self
        
        collectionView.dataSource = self

        //collectionView.showsVerticalScrollIndicator = false
        
        //collectionView.alwaysBounceVertical = true
               
    }

    
    
    func createMenuArray() {
        menu.append(Menu(name: "Cardiac Frequency", image: UIImage(named: "heartbeat")  ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Pedometer", image: UIImage(named: "foot") ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Battery Life", image: UIImage(named: "batteryLife") ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Accelerometer Datas", image: UIImage(named: "accelerometer") ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Calories Tracking", image: UIImage(named: "calorie") ?? UIImage(named: "default")!))
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MenuCollectionViewCell
        
        cell.menuCell = menu[indexPath.item]
        
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var controllerName: String = (((menu[indexPath.row].featureName)?.replacingOccurrences(of: " ", with: ""))!)
        controllerName.append("ViewController")
        let controller: UIViewController = UIViewController(nibName: controllerName, bundle: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width/3
        
        let width = collectionViewWidth - 25
        
        return CGSize(width: width, height: width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 100, left: 20, bottom: 0, right: 20)
    }
    
    //set Minimum spacing between 2 items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //set minimum vertical line spacing here between two lines in collectionview
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}



