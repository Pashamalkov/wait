//
//  MapController.swift
//  wait
//
//  Created by Mikhail  Arzumanov on 10.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit
import AVFoundation

class MapController: UIViewController , AVAudioPlayerDelegate, UIGestureRecognizerDelegate{

    
    
    @IBOutlet weak var playBut: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    var nameOfSound = ""
    
    
    @IBOutlet weak var Back: UIImageView!
    
    @IBOutlet weak var MapView: UIImageView!
    
    
    override func viewDidLoad()
    {
        Back.image = UIImage(named: "back4.png")
        
        
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MapController.mapTapped(_:)))
        tap.delegate = self
        MapView.userInteractionEnabled = true
        self.MapView.addGestureRecognizer(tap)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        newTask()
    }
    
    
    func mapTapped(sender: UITapGestureRecognizer? = nil) {
        
        //        let imageView = UIImageView(frame: CGRect(origin: sender!.locationInView(MapView), size: CGSize(width: 20,height: 20)))
        //        imageView.backgroundColor = UIColor.greenColor()
        //        MapView.addSubview(imageView)
        
        MapView.userInteractionEnabled = false
        for dialect in dialects {
            
            let image = UIImage(named: dialect)
            
            let color : UIColor = getPixelColorAtPoint(sender!.locationInView(MapView), image: image!)!
            
            let components = CGColorGetComponents(color.CGColor)
            
            if (components[0] > 0.5 && components[1] < 0.4 && components[2] < 0.4) {
                
                audioPlayer.pause()
                isPlaying = false
                playBut.setImage( UIImage(named: "play4.png"), forState: .Normal)
            
                self.MapView.image = image
                
                
                if dialect == self.nameOfSound {
                    
                    MapView.layer.borderWidth = 3
                    MapView.layer.borderColor  = GREEN.CGColor
                    
                    
                    
                } else {
                    
                    MapView.layer.borderWidth = 3
                    MapView.layer.borderColor = RED.CGColor
                }
                
                
                
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    
                    self.MapView.userInteractionEnabled = true
                    self.newTask()
                }
                
                
                return
            }
        }
        
        self.MapView.userInteractionEnabled = true
        //getPixelColorAtPoint(loc)
        //        print(color)
    }
    
    
    
    func getPixelColorAtPoint(point:CGPoint, image: UIImage) -> UIColor?
    {
        
        guard let pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage)) else {
            return UIColor.clearColor()
        }
        let data = CFDataGetBytePtr(pixelData)
        let x = Int(point.x * (imgSize!.width/(MapView.frame.size.width)))
        let y = Int(point.y * (imgSize!.height/MapView.frame.size.height))
        let index = Int(self.imgSize!.width) * y + x
        let expectedLengthA = Int(self.imgSize!.width * self.imgSize!.height)
        let expectedLengthRGB = 3 * expectedLengthA
        let expectedLengthRGBA = 4 * expectedLengthA
        let numBytes = CFDataGetLength(pixelData)
        switch numBytes {
        case expectedLengthA:
            return UIColor(red: 0, green: 0, blue: 0, alpha: CGFloat(data[index])/255.0)
        case expectedLengthRGB:
            return UIColor(red: CGFloat(data[3*index])/255.0, green: CGFloat(data[3*index+1])/255.0, blue: CGFloat(data[3*index+2])/255.0, alpha: 1.0)
        case expectedLengthRGBA:
            return UIColor(red: CGFloat(data[4*index])/255.0, green: CGFloat(data[4*index+1])/255.0, blue: CGFloat(data[4*index+2])/255.0, alpha: CGFloat(data[4*index+3])/255.0)
        default:
            // unsupported format
            return UIColor.clearColor()
        }
        
        
        
        //        let aa = (imgSize!.width/(MapView.frame.size.width))
        //        let bb = (imgSize!.height/MapView.frame.size.height)
        //        let x = point.x * (imgSize!.width/(MapView.frame.size.width))
        //        let y = point.y * (imgSize!.height/MapView.frame.size.height)
        //
        //        if x < 0 || x > imgSize!.width || y < 0 || y > imgSize!.height {
        //            return nil
        //        }
        //        let provider = CGImageGetDataProvider(img!.CGImage)
        //        let providerData = CGDataProviderCopyData(provider)
        //        let data = CFDataGetBytePtr(providerData)
        //        let numberOfComponents = 4
        //        let pixelData = Int(((imgSize!.width * y) + x)) * numberOfComponents
        //        let r = CGFloat(data[pixelData]) / 255.0
        //        let g = CGFloat(data[pixelData + 1]) / 255.0
        //        let b = CGFloat(data[pixelData + 2]) / 255.0
        //        let a = CGFloat(data[pixelData + 3]) / 255.0
        //        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    func playAudio(soundName:String){
        
        //sender.enabled = false
        let soundURL: NSURL = NSBundle.mainBundle().URLForResource(soundName, withExtension: "mp3")!
        audioPlayer = try! AVAudioPlayer(contentsOfURL: soundURL)
        audioPlayer.delegate = self
        audioPlayer.play()
        
    }
    
    var randNum = -1
    
    var trueAnswer = 0
    
    var falseAnswers = [Int]()
    var falAn = -1
    
    var imgSize : CGSize?
    var img : UIImage?
    
    func newTask() {
        
        
        let image = UIImage(named: "map")
        imgSize = image?.size
        img = image
        MapView.image = image
        
        
        MapView.layer.borderWidth = 0
        
        falseAnswers.removeAll()
        falAn = -1
        
        randNum = Int(arc4random_uniform(UInt32(dialects.count)))
        
        nameOfSound = dialects[randNum]
        
        trueAnswer = Int(arc4random_uniform(UInt32(4)) + 1)
        
        //playAudio("dialects/" + nameOfSound)
        
        //        let image = UIImage(named: "South East.jpg")//"images/" + nameOfSound)
        //        let image = UIImage(named: "images/" + nameOfSound)
        //        imgSize = image?.size
        //        img = image
        //        MapView.image = image//resizeImage(image!, newWidth: MapView.frame.width)
        
        playAudio(nameOfSound)
        wasPlaying = true
        playBut.setImage( UIImage(named: "pause4.png"), forState: .Normal)
    }
    
    
    var isPlaying : Bool = false
    var wasPlaying : Bool = false

    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer.currentTime = 0.0
        isPlaying = false
        playBut.setImage( UIImage(named: "play4.png"), forState: .Normal)
    }
    
    
    @IBAction func playButton(sender: AnyObject) {
        
        
        if(wasPlaying != true)
        {
            playAudio(nameOfSound)
            isPlaying = true
            wasPlaying = true
        }
        else{
            if(isPlaying)
            {
                self.audioPlayer.pause()
                isPlaying = false
                playBut.setImage( UIImage(named: "play4.png"), forState: .Normal)
                
            }
            else{
                self.audioPlayer.play()
                isPlaying = true
                playBut.setImage( UIImage(named: "pause4.png"), forState: .Normal)
            }
        }
    }
    

    @IBAction func Stop(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        isPlaying = false
        playBut.setImage( UIImage(named: "play4.png"), forState: .Normal)
        audioPlayer.prepareToPlay()
        
    }

    @IBAction func goBack(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
}
