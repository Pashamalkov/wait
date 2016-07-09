//
//  ViewController.swift
//  wait
//
//  Created by Mikhail  Arzumanov on 09.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    @IBOutlet weak var but3: UIButton!
    @IBOutlet weak var but4: UIButton!
    @IBOutlet weak var playBut: UIButton!

    @IBOutlet weak var falseAnswersLabel: UILabel!
    @IBOutlet weak var rightAnswersLabel: UILabel!
    var audioPlayer = AVAudioPlayer()
    
    var nameOfSound = ""
    
    var falseAnswersNum : Int = 0
    var rightAnswersNum : Int = 0
    
    @IBOutlet weak var Back: UIImageView!
    
    override func viewDidLoad() {
        Back.image = UIImage(named: "1.png")
        super.viewDidLoad()
//        newTask()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
       //
       // loadMyView()
        setDefault()
        newTask()
    }
    
    var isPlaying : Bool = false
    
    @IBAction func playButton(sender: AnyObject) {
        

        
        if(isPlaying)
        {
            self.audioPlayer.pause()
            isPlaying = false
            playBut.setImage( UIImage(named: "play.png"), forState: .Normal)
        
        }
        else{
            self.audioPlayer.play()
            isPlaying = true
            playBut.setImage( UIImage(named: "pause.png"), forState: .Normal)
        }
    }
    
    
    func setDefault()
    {
        falseAnswersLabel.text = "\(falseAnswersNum)"
        rightAnswersLabel.text = "\(rightAnswersNum)"
        for i in 1...4{
            let button = self.view.viewWithTag(i) as! UIButton
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2.5
        }
    }
    
    
    func playAudio(soundName:String){
        
        //sender.enabled = false
        let soundURL: NSURL = NSBundle.mainBundle().URLForResource(soundName, withExtension: "mp3")!
        audioPlayer = try! AVAudioPlayer(contentsOfURL: soundURL)
        audioPlayer.delegate = self
        audioPlayer.play()
        isPlaying = true
        playBut.setImage( UIImage(named: "pause.png"), forState: .Normal)
    }
    
    var randNum = -1
    
    var trueAnswer = 0
    
    var falseAnswers = [Int]()
    var falAn = -1
    
    
    func setDefaultColors(inout button: UIButton, tag: Int)
    {
        if(tag == 1){
            but1.backgroundColor = UIColor(red: 229/255, green: 117/255, blue: 73/255, alpha: 0.8)
            but1.layer.borderColor = UIColor.clearColor().CGColor
        }
        if(tag == 2){
            but2.backgroundColor = UIColor(red: 240/255 , green: 214/255, blue: 115/255, alpha: 1.0)
            but2.layer.borderColor = UIColor.clearColor().CGColor
        }

        if(tag == 3){
            but3.backgroundColor = UIColor(red: 151/255, green: 188/255, blue: 230/255, alpha: 1.0)
            but3.layer.borderColor = UIColor.clearColor().CGColor
        }
        if(tag == 4){
            but4.backgroundColor = UIColor(red: 197/255, green: 156/255, blue: 195/255, alpha: 0.9)
            but4.layer.borderColor = UIColor.clearColor().CGColor
        }
    }
    
    
    func newTask() {
        NSLog("\n\n")
        falseAnswers.removeAll()
        falAn = -1
        randNum = Int(arc4random_uniform(UInt32(dialects.count)))
        nameOfSound = dialects[randNum]
        trueAnswer = Int(arc4random_uniform(UInt32(4)) + 1)
        
        for i in 1...4 {
            var button = self.view.viewWithTag(i) as! UIButton
            let imgView = self.view.viewWithTag(i+4) as! UIImageView
            //let color = UIColor(red: 229, green: 117, blue: 73, alpha: 0.8)
            
            //button.backgroundColor = UIColor.blueColor()
            
            button.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
            setDefaultColors(&button, tag: i)

            
            if i == trueAnswer {
                
                button.setTitle(nameOfSound, forState: .Normal)
                NSLog("\(nameOfSound) true")
                imgView.image  = UIImage(named: nameOfSound)
                
            } else {
                while (falAn < 0) {
                  falAn = Int(arc4random_uniform(UInt32(dialects.count)))
                  
                    
                    if dialects[falAn] == nameOfSound {
                        falAn = -1
                        continue
                    }
                    
                    for j in falseAnswers {
                        if falAn == j {
                            falAn = -1
                            break
                        }
                    }
                    
                }
                
                falseAnswers.append(falAn)
                button.setTitle(dialects[falAn], forState: .Normal)
                NSLog("\(dialects[falAn])")
                imgView.image  = UIImage(named: dialects[falAn])
                falAn = -1
            }
            
            
        }
        self.playAudio(
            nameOfSound)
        NSLog("\n\n")
    }
    
    func buttonTapped(sender: UIButton) {
        
        
        if (sender.currentTitle == nameOfSound) {
            
            sender.backgroundColor = UIColor.greenColor()
            rightAnswersNum = rightAnswersNum + 1
            rightAnswersLabel.text = "\(rightAnswersNum)"
            audioPlayer.stop()
            isPlaying = false
            playBut.setImage( UIImage(named: "play.png"), forState: .Normal)
            
        } else {
            
            sender.backgroundColor = UIColor.redColor()
            falseAnswersNum = falseAnswersNum + 1
            falseAnswersLabel.text = "\(falseAnswersNum)"
            audioPlayer.stop()
            isPlaying = false
            playBut.setImage( UIImage(named: "play.png"), forState: .Normal)
        }
        
        for i in 1...4 {
            let button = self.view.viewWithTag(i) as! UIButton
            if i == trueAnswer {
                button.layer.borderColor = UIColor.greenColor().CGColor
            }
        }
        
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.newTask()
            
        }
        
        
    }
    @IBAction func stopPlaying(sender: AnyObject) {
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        isPlaying = false
        playBut.setImage( UIImage(named: "play.png"), forState: .Normal)
        audioPlayer.prepareToPlay()
    }
}

