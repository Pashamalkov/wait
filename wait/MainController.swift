//
//  MainController.swift
//  wait
//
//  Created by Mikhail  Arzumanov on 09.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var Back: UIImageView!
    override func viewDidLoad() {
        
        //loadMyView()
        
        Back.image = UIImage(named: "mainBack.png")
        pic1.image = UIImage(named: "wordcloud.png")
        pic2.image = UIImage(named: "wordcloud2.png")
        pic3.image = UIImage(named: "text.jpg")
        pic4.image = UIImage(named: "wordcloud4.jpg")
        super.viewDidLoad()
        
        
        
        

    
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var lock2: UIImageView!
    @IBOutlet weak var lock3: UIImageView!
    @IBOutlet weak var lock4: UIImageView!
    @IBOutlet weak var lock2Label: UILabel!
    @IBOutlet weak var lock3Label: UILabel!
    @IBOutlet weak var lock4Label: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setInteger(0, forKey: "record")
        if (NSUserDefaults.standardUserDefaults().objectForKey("record") != nil) {
            let i = defaults.integerForKey("record")
            if (i < 2)
            {
                button2.enabled = false
                button3.enabled = false
                button4.enabled = false
                lock2.hidden = false
                lock3.hidden = false
                lock4.hidden = false
                lock2Label.hidden = false
                lock3Label.hidden = false
                lock4Label.hidden = false
                rightLabel.text = "\(i)/2"
            }
            if (i>=2 && i<4){
                button2.enabled = true
                lock2.hidden = true
                lock2Label.hidden = true
                button3.enabled = false
                button4.enabled = false
                lock3.hidden = false
                lock4.hidden = false
                lock3Label.hidden = false
                lock4Label.hidden = false
                
                rightLabel.text = "\(i)/4"
            }
            if (i>=4 && i<6)
            {
                button2.enabled = true
                button3.enabled = true
                lock2.hidden = true
                lock3.hidden = true
                lock2Label.hidden = true
                lock3Label.hidden = true
                button4.enabled = false
                lock4.hidden = false
                lock4Label.hidden = false
                rightLabel.text = "\(i)/6"
            }
            if (i>=6)
            {
                button2.enabled = true
                button3.enabled = true
                button4.enabled = true
                lock2.hidden = true
                lock3.hidden = true
                lock4.hidden = true
                lock2Label.hidden = true
                lock3Label.hidden = true
                lock4Label.hidden = true
                rightLabel.text = "\(i)/29"
            }
        }
        else{
            defaults.setInteger(0, forKey: "record")
            button2.enabled = false
            button3.enabled = false
            button4.enabled = false
            lock2.hidden = false
            lock3.hidden = false
            lock4.hidden = false
            lock2Label.hidden = false
            lock3Label.hidden = false
            lock4Label.hidden = false
            rightLabel.text = "0/2"
        }
    }
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var pic1: UIImageView!
    
    @IBOutlet weak var pic2: UIImageView!
    
    @IBOutlet weak var pic3: UIImageView!
    
    @IBOutlet weak var pic4: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
//        loadMyView()
    }
    
    override func viewWillDisappear(animated: Bool) {
       // unloadMyView()
    }
    
    @IBAction func performCustomSegue(sender: AnyObject) {
        self.performSegueWithIdentifier("custom", sender: self)
    }
    
    @IBAction func loadFisrtView(sender: AnyObject) {
        self.performSegueWithIdentifier("custom", sender: self)
        
    }
    func loadMyView()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.4)
        self.navigationController?.navigationBar.translucent = true
        
        let statusBar: UIView = UIApplication.sharedApplication().valueForKey("statusBar") as! UIView
        if statusBar.respondsToSelector(Selector("setBackgroundColor:")) {
            statusBar.backgroundColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.4)
            
        }
    }
}
