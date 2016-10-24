//
//  ViewController.swift
//  CollectionViewKR
//
//  Created by Keith Russell on 5/5/16.
//  Copyright © 2016 Keith Russell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var picCaptions = [
        "Chesapeake City Bridge 1",
        "Canal ship 1",
        "Trail entry",
        "Chesapeake City Bridge 2",
        "Delaware line",
        "Summit Bridge 1",
        "Summit Bridge 2",
        "Turkey Vultures",
        "Canal ship 2",
        "Under Summit Bridge",
        "Canal Signage",
        "Summit North Marina"]
    
    var imgids = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var canalpics = [CanalPics]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "PhotoVC"{
            guard let indexPath = sender as? NSIndexPath else { return}
            let imgID = self.imgids[indexPath.row]
            let picLbl = self.picCaptions[indexPath.row]
            let photoVC = segue.destination as? PhotoVC
            photoVC?.imgID = imgID
            photoVC?.picLbl = picLbl
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CanalView", for: indexPath as IndexPath) as? CanalView {
            for index in 0...imgids.count-1 {
                let pics  = CanalPics(name: "\(picCaptions[index])", imgId: "\(imgids[index])")
                canalpics.append(pics)
            }
            let pic = canalpics[indexPath.row]
            cell.configCell(canalPics: pic)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
        performSegue(withIdentifier: "PhotoVC", sender: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //changes intra - min row spacing
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //changes interrow  - min spacing
        return 20
    }
    
    private func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.size.width/2 - 40, height: view.frame.size.width/2 - 40)
    }
}

