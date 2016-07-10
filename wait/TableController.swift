//
//  TableController.swift
//  wait
//
//  Created by Mikhail  Arzumanov on 10.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit

class TableController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        back.image = UIImage(named: "3back.png")
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dialects.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? MyCell
        cell?.mapLabel.text = dialects[indexPath.item]
        cell?.mapImage.image = UIImage(named: "\(dialects[indexPath.item]).png")
        return cell! 
    }
    
}
