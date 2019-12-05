//
//  MenuCollectionViewCell.swift
//  XiaomiConnectedIosApp
//
//  Created by Lukile on 05/12/2019.
//  Copyright © 2019 Lukile. All rights reserved.
//

import Foundation
import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    
    var menuCell: Menu? {
        didSet {
            showMenuCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // background de notre cellule
        contentView.backgroundColor = .white
        
        // on lui applique un raduis pour qu'elle soit arrondis .
        contentView.layer.cornerRadius = 10
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(imageView)
        
        // constraintes
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: (contentView.bounds.width/1.5) ).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showMenuCell() {
        imageView.image = menuCell!.featureImage
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.roundCorners([.topRight, .topLeft], radius: 10)
    }
    
    
}
