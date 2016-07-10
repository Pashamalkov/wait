//
//  TableController.swift
//  wait
//
//  Created by Mikhail  Arzumanov on 10.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit
import AVFoundation

class TableController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,AVAudioPlayerDelegate {

    
    
    @IBOutlet weak var closeBar: UIButton!
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var DetailBar: UIView!
    
    @IBOutlet weak var aqualizerView: UIView!
    @IBOutlet weak var DetailText: UITextView!
    @IBOutlet weak var DetailIMage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func Back(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func CloseBar(sender: AnyObject) {
        DetailBar.hidden = true
        
        
        if(wasPlaying)
        {
            audioPlayer.stop()
        }
        
        setDefaults()
    }
    
    
    var timer : NSTimer!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        back.image = UIImage(named: "3back.png")
        DetailBar.hidden = true
        
        
        timer = nil
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
    }
    
    
    var randomFrame : CGFloat = 0
    
    func updateTime()
    {
        
        if (isPlaying) {
            
            for view in aqualizerView.subviews {
                
                if let imageView : UIImageView  = view as? UIImageView {
                    randomFrame = CGFloat(arc4random_uniform(UInt32(10))+1)/10
                    
                    UIView.animateWithDuration(1, animations: {
                        imageView.transform = CGAffineTransformMakeScale(1, 1*self.randomFrame)
                    })
                    
                }
                
            }
            
        }
        
        //timeLabel.text = "\(minPart):\(secPart)"
    }
    

    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer.currentTime = 0.0
//        for view in self.aqualizerView.subviews {
//            
//            if let imageView : UIImageView  = view as? UIImageView {
//                
//                UIView.animateWithDuration(2, animations: {
//                    imageView.transform = CGAffineTransformMakeScale(1, 0)
//                })
//            }
//            
//        }
//        
        isPlaying = false
        playButton.setImage( UIImage(named: "play3.png"), forState: .Normal)
        
        
   
        
        
    }
    
    
    var audioPlayer = AVAudioPlayer()
    
    var nameOfSound = ""

    
    var isPlaying : Bool = false
    var wasPlaying : Bool = false
    
    @IBAction func playButton(sender: AnyObject) {
        if(wasPlaying != true)
        {
            playAudio(nameOfSound)
            wasPlaying = true
            isPlaying = true
        }
        else{
        if(isPlaying)
        {
            self.audioPlayer.pause()
            isPlaying = false
            playButton.setImage( UIImage(named: "play3.png"), forState: .Normal)
            
        }
        else{
            self.audioPlayer.play()
            isPlaying = true
            playButton.setImage( UIImage(named: "pause3.png"), forState: .Normal)
            }
        }

    }
    
    func playAudio(soundName:String){
        
        //sender.enabled = false
        let soundURL: NSURL = NSBundle.mainBundle().URLForResource(soundName, withExtension: "mp3")!
        audioPlayer = try! AVAudioPlayer(contentsOfURL: soundURL)
        audioPlayer.delegate = self
        audioPlayer.play()
        isPlaying = true
        playButton.setImage( UIImage(named: "pause3.png"), forState: .Normal)
    }

    
    func setDefaults()
    {
        isPlaying = false
        playButton.setImage( UIImage(named: "play3.png"), forState: .Normal)
        wasPlaying = false
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dialects.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        DetailIMage.image = UIImage(named: "\(dialects[indexPath.item]).png")
        nameOfSound = "\(dialects[indexPath.item])"
        
        
        for view in aqualizerView.subviews {
            
            if let imageView : UIImageView  = view as? UIImageView {
                
                    imageView.transform = CGAffineTransformMakeScale(1, 0)
                
            }
            
        }


        let frame = DetailBar.frame
        self.DetailBar.frame.origin.y = 900
        self.DetailBar.hidden = false
        UIView.animateWithDuration(0.6, animations: {
            
            
            //cell.mapImage.frame = self.DetailIMage.frame
            //cell.bounds = self.DetailIMage.bounds
            
            self.DetailBar.frame = frame
        
        })
        
      
        
        
        
        
        DetailText.text  = descriptions[nameOfSound]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? MyCell
        cell?.mapLabel.text = dialects[indexPath.item]
        cell?.mapImage.image = UIImage(named: "\(dialects[indexPath.item]).png")
        return cell! 
    }
    
    
    
}
