//
//  VoxImplant.swift
//  Wait
//
//  Created by Паша on 10.07.16.
//  Copyright © 2016 Паша. All rights reserved.
//

import Foundation


import UIKit
import AVFoundation


class VoxImplantController: UIViewController, VoxImplantDelegate  {
    
    var delegate : VoxImplantDelegate? //= VoxImplant.getVoxDelegate()
    
    var sdk = VoxImplant.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let delegate = sdk.getVoxDelegate() // as! VoxImplantDelegate
        sdk.voxDelegate = self
        sdk.connect()
        print("1")
        
    }
    
    func onConnectionSuccessful() {
        print("good")
        sdk.loginWithUsername("Pavel@wait.pashamalkov.voximplant.com", andPassword: "463761637qwe")
        print("2")

        
    }
    
    func onConnectionFailedWithError(reason: String!) {
        print(reason)
        
    }
    
    func onLoginSuccessfulWithDisplayName(displayName: String!) {
        print("3");
        print(displayName)
    }
    
    
    
    func onLoginFailedWithErrorCode(errorCode: NSNumber!) {
        print("4");
        print(errorCode)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onCallFailed(callId: String!, withCode code: Int32, andReason reason: String!, withHeaders headers: [NSObject : AnyObject]!) {
        print("8")
        print(reason)
    }
    
    func onCallAudioStarted(callId: String!) {
        print("9")
        print(callId)
        
    }
    
    func onCallDisconnected(callId: String!, withHeaders headers: [NSObject : AnyObject]!) {
        print("10")
        print(callId)
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        
        print("5")
        sdk = VoxImplant.getInstance()
        let num = "79854890333"
        //Charset.forName("UTF-8").encode(num)
        let value = String(UTF8String: num.cStringUsingEncoding(NSUTF8StringEncoding)!)
        let activeCallId : NSString = sdk.createCall(value, withVideo: false, andCustomData: nil)
        print("6")
        let headers = [String : String]()
        sdk.attachAudioTo(activeCallId as String)
        sdk.startCall(activeCallId as String, withHeaders: headers)
        
        print("7")
        //let activeCall = Call(
        
    }
    override func viewDidAppear(animated: Bool) {
        
        
    }
    
    
    
}