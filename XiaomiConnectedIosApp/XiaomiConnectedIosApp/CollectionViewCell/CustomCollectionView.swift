//
//  CustomCollectionView.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 06/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import Foundation
import UIKit

class CustomCollectionView {
    var screensize = CGRect()
    
    
    func customize(collectionView: UICollectionView) {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
    }
    
    func addConstraints(collectionView: UICollectionView, view: UIView) {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
