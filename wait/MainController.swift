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
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
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
