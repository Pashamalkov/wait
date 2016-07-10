//
//  MyCustomSegue.swift
//  wait
//
//  Created by Mikhail  Arzumanov on 10.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit

class MyCustomSegue: UIStoryboardSegue {

    
    
    override func perform() {
        
        
        
        let sourceVC = self.sourceViewController as? MainController
        let destinationVC = self.destinationViewController
        
        
//
//      //  sourceVC!.view.addSubview(destinationVC.view)
//        
//        let view = UIView()
//        view.frame = sourceVC!.view.frame
//        
//        destinationVC.view.frame = sourceVC!.view.frame
//        
//        
//        view.backgroundColor = UIColor(red: 151/255, green: 188/255, blue: 230/255, alpha: 1.0)
//        
////        sourceVC!.view.addSubview(destinationVC.view)
////        sourceVC!.view.bringSubviewToFront(destinationVC.view)
//        sourceVC!.view.addSubview(view)
//        sourceVC!.view.bringSubviewToFront(view)
//        
//        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
//            
//            view.backgroundColor = UIColor(red: 174/255, green: 224/255, blue: 179/255, alpha: 1.0)
//            
//        }) { (finished) -> Void in
//            
//            UIView.animateWithDuration(1.0,  animations: { () -> Void in
//                
//                view.backgroundColor = UIColor(red: 174/255, green: 224/255, blue: 179/255, alpha: 0.0)
//                
//                
//                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.005 *  Double(NSEC_PER_SEC)))
//                
//                dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
//                    sourceVC?.presentViewController(destinationVC, animated: true, completion: nil)
//                    
//                    
//                })
//                
//            
//            }) { (finished) -> Void in
//            
//            view.removeFromSuperview()
//            //destinationVC.view.removeFromSuperview()

       
        
         sourceVC?.presentViewController(destinationVC, animated: true, completion: nil)
        
    }

}
