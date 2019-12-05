//
//  MenuViewController.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 05/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var collectionView: UICollectionView!
    
    @IBOutlet var label: UILabel!
    
    
    var screensize = CGRect()

    var menu: [Menu] = [Menu]()
    
    var feedbackGenerator : UISelectionFeedbackGenerator? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        
        createMenuArray()

        let flowLayout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: screensize, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.alwaysBounceVertical = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        
        
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    
    
    func createMenuArray() {
        menu.append(Menu(name: "Cardiac frequency", image: UIImage(named: "heartbeat")  ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Pedometer", image: UIImage(named: "foot") ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Battery life", image: UIImage(named: "batteryLife") ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Accelerometer datas", image: UIImage(named: "accelerometer") ?? UIImage(named: "default")!))
        menu.append(Menu(name: "Calorie tracking", image: UIImage(named: "calorie") ?? UIImage(named: "default")!))
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
        //        feedbackGenerator = UISelectionFeedbackGenerator()
        //
        //        // Prepare the generator when the gesture begins.
        //        feedbackGenerator?.prepare()
        //
        //        feedbackGenerator?.selectionChanged()
        //
        //        // Keep the generator in a prepared state.
        //        feedbackGenerator?.prepare()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //         feedbackGenerator = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.2, animations: {
            collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2, animations: {
            collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform.identity
        }, completion: nil)
        //        feedbackGenerator = nil
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




