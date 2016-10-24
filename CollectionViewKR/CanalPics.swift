//
//  CanalPics.swift
//  CollectionViewKR
//
//  Created by Keith Russell on 5/5/16.
//  Copyright © 2016 Keith Russell. All rights reserved.
//

import Foundation
import UIKit

class CanalPics {
    
    private var _name: String!
    private var _imgId:String!
    
    var name: String {
        return _name
    }
    
    var imgId: String {
        return _imgId
    }

    init(name:String, imgId: String){
        self._name = name
        self._imgId = imgId
    }
}
