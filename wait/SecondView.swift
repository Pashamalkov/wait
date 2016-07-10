//
//  SecondView.swift
//  Wait
//
//  Created by Паша on 09.07.16.
//  Copyright © 2016 Паша. All rights reserved.
//




import UIKit
import AVFoundation

class SecondView: UIViewController, AVAudioPlayerDelegate {
    
    
    @IBOutlet weak var pointsLabel2: UILabel!
    @IBOutlet weak var pointsLabel1: UILabel!
    @IBOutlet weak var pointsRight1: UIButton!
    @IBOutlet weak var pointsRight2: UIButton!
    
    @IBOutlet weak var aqualizerView: UIView!
    var audioPlayer = AVAudioPlayer()
    
    var nameOfSound = ""
    //
    //    var buttons = [UIButton]()
    
    @IBAction func reloadAudio(sender: AnyObject) {
    }

    @IBAction func back(sender: AnyObject) {
                self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    var randomFrame : CGFloat = 0
    
    func updateTime()
    {
        
        if (true) {
            
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
    
    var timer : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //        for i in 0...3 {
        //
        //
        //
        //            let but = UIButton(frame: CGRectMake(CGFloat(30 + i%2*160), CGFloat(90 + i/2*300), 150, 250))
        //            buttons.append(but)
        //            buttons[i].setTitle("AAAAAA", forState: .Normal)
        //            buttons[i].backgroundColor = UIColor.whiteColor()
        //
        //            self.view.addSubview(buttons[i])
        //
        //        }
        
        pointsLabel1.text = "0"
        pointsLabel2.text = "0"
        
        pointsLabel1.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        
        
        newTask()
        
        
        timer = nil
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
        for view in aqualizerView.subviews {
            
            if let imageView : UIImageView  = view as? UIImageView {
                
                imageView.transform = CGAffineTransformMakeScale(1, 0)
                
            }
            
        }

    }
    
    
    
    func setDefault()
    {
//        falseAnswersLabel.text = "\(falseAnswersNum)"
//        rightAnswersLabel.text = "\(rightAnswersNum)"
        for i in 1...4{
            let button = self.view.viewWithTag(i) as! UIButton
            let button2 = self.view.viewWithTag(i+4) as! UIButton
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2.5
            button2.layer.cornerRadius = 5
            button2.layer.borderWidth = 2.5
        }
    }
    
    
    func setDefaultColors(inout button: UIButton, tag: Int)
    {
        let button2 = self.view.viewWithTag(tag+4) as! UIButton
        if(tag == 4){
            button.backgroundColor = UIColor(red: 229/255, green: 117/255, blue: 73/255, alpha: 0.8)
            button.layer.borderColor = UIColor.clearColor().CGColor
            button2.backgroundColor = UIColor(red: 229/255, green: 117/255, blue: 73/255, alpha: 0.8)
            button2.layer.borderColor = UIColor.clearColor().CGColor
        }
        if(tag == 3){ //
            button.backgroundColor = UIColor(red: 174/255 , green: 224/255, blue: 179/255, alpha: 1.0)
            button.layer.borderColor = UIColor.clearColor().CGColor
            button2.backgroundColor = UIColor(red: 174/255 , green: 224/255, blue: 179/255, alpha: 1.0)
            button2.layer.borderColor = UIColor.clearColor().CGColor
        }
        
        if(tag == 2){
            button.backgroundColor = UIColor(red: 151/255, green: 188/255, blue: 230/255, alpha: 1.0)
            button.layer.borderColor = UIColor.clearColor().CGColor
            button2.backgroundColor = UIColor(red: 151/255, green: 188/255, blue: 230/255, alpha: 1.0)
            button2.layer.borderColor = UIColor.clearColor().CGColor
        }
        if(tag == 1){
            button.backgroundColor = UIColor(red: 197/255, green: 156/255, blue: 195/255, alpha: 0.9)
            button.layer.borderColor = UIColor.clearColor().CGColor
            button2.backgroundColor = UIColor(red: 197/255, green: 156/255, blue: 195/255, alpha: 0.9)
            button2.layer.borderColor = UIColor.clearColor().CGColor
        }
    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    @IBAction func playButton(sender: AnyObject) {
        
        self.playAudio(nameOfSound)
        
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
    
    
    func newTask() {
        
        enabletNum = 0
        for i in 1...8 {
            
            let button = self.view.viewWithTag(i) as! UIButton
            button.enabled = true
        }
        
        falseAnswers.removeAll()
        falAn = -1
        
        randNum = Int(arc4random_uniform(UInt32(dialects.count)))
        
        nameOfSound = dialects[randNum]
        
        trueAnswer = Int(arc4random_uniform(UInt32(4)) + 1)
        
        playAudio(nameOfSound)
        
        for i in 1...4 {
            var button1 = self.view.viewWithTag(i) as! UIButton
            
            button1.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
//            button1.backgroundColor = UIColor.whiteColor()
            
            let button2 = self.view.viewWithTag(i+4) as! UIButton
            
            button2.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
//            button2.backgroundColor = UIColor.whiteColor()
            
            
            setDefaultColors(&button1, tag: i)
            if i == trueAnswer {
                
                button1.setTitle(nameOfSound, forState: .Normal)
                button2.setTitle(nameOfSound, forState: .Normal)
                
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
                button1.setTitle(dialects[falAn], forState: .Normal)
                button2.setTitle(dialects[falAn], forState: .Normal)
                
                falAn = -1
            }
            
            
            button1.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            
            
        }
        
        
    }
    
    var enabletNum = 0
    
    func buttonTapped(sender: UIButton) {
        
        //        let a =
        
//        for i in 1...8 {
//            
//            let button = self.view.viewWithTag(i) as! UIButton
//            utton.enabled = false
//        }
        
        if(sender.tag > 4)
        {
            for i in 5...8 {
                if(i != sender.tag)
                {
                    let button = self.view.viewWithTag(i) as! UIButton
                    button.enabled = false
                }
            }
        }
        else {
            for i in 1...4 {
                if(i != sender.tag)
                {
                    let button = self.view.viewWithTag(i) as! UIButton
                    button.enabled = false
                }
            }
        }
        
            
            
        
        if (sender.currentTitle == nameOfSound) {
            
            sender.backgroundColor = GREEN
            
            if sender.tag > 4 {
                
                pointsLabel2.text = String(Int(pointsLabel2.text!)! + 1)
                let name = checkColor(Int(pointsLabel2.text!)!)
                pointsRight2.setImage(UIImage(named: name), forState: .Normal)
                
            } else {
                
                pointsLabel1.text = String(Int(pointsLabel1.text!)! + 1)
                let name = checkColor(Int(pointsLabel1.text!)!)
                pointsRight1.setImage(UIImage(named: name),forState: .Normal)
            }
            
            
            enabletNum = 0
            
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.newTask()
                
            }
            
            
            
        } else {
            
            
            sender.backgroundColor = RED
            
            if sender.tag > 4 {
                
                pointsLabel2.text = String(Int(pointsLabel2.text!)! - 1)
                let name = checkColor(Int(pointsLabel2.text!)!)
                pointsRight2.setImage(UIImage(named: name), forState: .Normal)
                
            } else {
                
                pointsLabel1.text = String(Int(pointsLabel1.text!)! - 1)
                let name = checkColor(Int(pointsLabel1.text!)!)
                pointsRight1.setImage(UIImage(named: name), forState: .Normal)
            }
            
            if enabletNum < 1 {
                var koef = 0
                
                if sender.tag > 4 {
                    koef = 4
                }
                
                for i in 1+koef...4+koef {
                    
                    let button = self.view.viewWithTag(i) as! UIButton
                    button.enabled = false
                }
                
                enabletNum += 1
            } else {
                enabletNum = 0
                
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    self.newTask()
                }
            }
        }
    }
    
    
    func checkColor(i:Int) -> String {
        if(i == 0)
        {
            return "graycircle.png"
        }
        if(i<0)
        {
            return "redcircle.png"
        }
        if(i>0)
        {
            return "right.png"
        }
        return ""
    }
    
}