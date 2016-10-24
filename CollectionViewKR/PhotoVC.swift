//
//  PhotoVC.swift
//  CollectionViewKR
//
//  Created by Keith Russell on 10/23/16.
//  Copyright © 2016 Keith Russell. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgLbl: UILabel!
    var imgID: String!
    var picLbl: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let imgID = self.imgID
        let picLbl = self.picLbl
        imgLbl.text = picLbl
        imgView.image = UIImage(named: imgID!)
    }
    
    @IBAction func returnBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
