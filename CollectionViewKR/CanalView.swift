//
//  CanalView.swift
//  CollectionViewKR
//
//  Created by Keith Russell on 5/5/16.
//  Copyright © 2016 Keith Russell. All rights reserved.
//

import UIKit

class CanalView: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg:UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var canalPics: CanalPics!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
  
    func configCell (canalPics: CanalPics) {
        
        self.canalPics = canalPics
        nameLbl.text = self.canalPics.name
        thumbImg.image = UIImage(named: "\(self.canalPics.imgId)")
    }
    
}
