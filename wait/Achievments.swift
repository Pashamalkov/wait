//
//  Achievments.swift
//  wait
//
//  Created by Mikhail  Arzumanov on 10.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit

class Achievments: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var Back: UIImageView!
    
    @IBOutlet weak var MyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        Back.image = UIImage(named: "back6.png")
        super.viewDidLoad()
        MyCollectionView.delegate = self
        MyCollectionView.dataSource = self
    }
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
 
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dialects.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? MyCell
        cell?.mapLabel.text = dialects[indexPath.item]
        cell?.mapImage.image = UIImage(named: "\(dialects[indexPath.item]).png")
        return cell!
    }

}
