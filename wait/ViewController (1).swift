extension NSMutableData {
    
    /// Append string to NSMutableData
    ///
    /// Rather than littering my code with calls to `dataUsingEncoding` to convert strings to NSData, and then add that data to the NSMutableData, this wraps it in a nice convenient little extension to NSMutableData. This converts using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `NSMutableData`.
    
    func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
}
//
//  ViewController.swift
//  test
//
//  Created by Mikhail  Arzumanov on 03.07.16.
//  Copyright © 2016 Mikhail  Arzumanov. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidAppear(animated: Bool) {
        //makeRequest("qreeq2.1gb.ru/getPosts.php")
    }
    
    var img : UIImage!
    @IBAction func куйгуые(sender: AnyObject) {
         //makeRequest("http://qreeq2.1gb.ru/getPosts.php")
        //makePostRequest()
        //makeCommentPostRequest(0, PostId: 0, Text: "Новый коммент")
        img  = UIImage(named:"test")
        let param = [
            "Name":"Cafe",
            "OwnerId":"0",
            "Description":"Best",
            "LocationAddress":"Советская",
            "LocationCoordinatesVertical":"0.3",
            "LocationCoordinatesHorizontal":"0.6",
            "Type":"food",
            "emotionIndex":"20"]
        
        imageUploadRequest(img!,param: param)
       // makeDisLikePostRequest(99, PostId: 99)
}
    
   
    
    
    
    
    
    //GET REQUESTS
    
    
    
    func makeGetPostRequest()
    {
        let URL = "http://qreeq2.1gb.ru/getPosts.php"
        let requestURL: NSURL = NSURL(string: URL as String)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let currentTask = session.dataTaskWithRequest(urlRequest) {
            data, response, error in
            if(response == nil)
            {
                return
            }
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    NSLog("\(json)")
                    
                    //Здесь надо парсить.

                }
                catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        currentTask.resume()
        NSLog("Resumed")
    }
    
    func makeGetCommentsRequest(PostId: Int)
    {
        let URL = "http://qreeq2.1gb.ru/getCommentsForPost.php?postId=\(PostId)"
        let requestURL: NSURL = NSURL(string: URL as String)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let currentTask = session.dataTaskWithRequest(urlRequest) {
            data, response, error in
            if(response == nil)
            {
                return
            }
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    NSLog("\(json)")
                    
                    //Здесь надо парсить.
                    
                }
                catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        currentTask.resume()
        NSLog("Resumed")
    }
    
    func makeGetLikesRequest(PostId: Int)
    {
        let URL = "http://qreeq2.1gb.ru/getLikesForPost.php?postId=\(PostId)"
        let requestURL: NSURL = NSURL(string: URL as String)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let currentTask = session.dataTaskWithRequest(urlRequest) {
            data, response, error in
            if(response == nil)
            {
                return
            }
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    NSLog("\(json)")
                    
                    //Здесь надо парсить.
                    
                }
                catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        currentTask.resume()
        NSLog("Resumed")
    }
    
    func makeGetDisLikesRequest(PostId: Int)
    {
        let URL = "http://qreeq2.1gb.ru/getDisLikesForPost.php?postId=\(PostId)"
        let requestURL: NSURL = NSURL(string: URL as String)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let currentTask = session.dataTaskWithRequest(urlRequest) {
            data, response, error in
            if(response == nil)
            {
                return
            }
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    NSLog("\(json)")
                    
                    //Здесь надо парсить.
                    
                }
                catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        currentTask.resume()
        NSLog("Resumed")
    }

    
    
    //POST-REQUESTS
    
    
    
    
    func makeLikesPostRequest(UserId: Int, PostId: Int)  //Пост запрос без фото
    {
        
    let request = NSMutableURLRequest(URL: NSURL(string: "http://qreeq2.1gb.ru/postLikesForPost.php")!)
    request.HTTPMethod = "POST"
    let postString = "PostId=\(PostId)&UserId=\(UserId)"  //Параметры запроса PostId и UserId - поля (все регистро-зависимо)
    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
        guard error == nil && data != nil else {                                                          // check for fundamental networking error
            print("error=\(error)")
            return
        }
        
        if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
            print("response = \(response)")
        }
        
        let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print("responseString = \(responseString)")
    }
    task.resume()
    }
    
    
    
    
    func makeDisLikePostRequest(UserId: Int, PostId: Int)  //Пост запрос без фото
    {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://qreeq2.1gb.ru/postDisLikesForPost.php")!)
        request.HTTPMethod = "POST"
        let postString = "PostId=\(PostId)&UserId=\(UserId)"  //Параметры запроса PostId и UserId - поля (все регистро-зависимо)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    
    
    func makeCommentPostRequest(UserId: Int, PostId: Int, Text: String)  //Пост запрос без фото
    {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://qreeq2.1gb.ru/postCommentsForPost.php")!)
        request.HTTPMethod = "POST"
        let postString = "PostId=\(PostId)&UserId=\(UserId)&Text=\(Text)"  //Параметры запроса PostId и UserId - поля (все регистро-зависимо)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
        
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    
    
    
    
    
    
    
    
    
    //  NEW POST
    
    
    func imageUploadRequest(imageView: UIImage, param: [String:String]?) {
        
        let uploadUrl = NSURL(string: "http://qreeq2.1gb.ru/postNewPost.php");
        
        let request = NSMutableURLRequest(URL:uploadUrl!);
        request.HTTPMethod = "POST"
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let imageData = UIImageJPEGRepresentation(imageView, 1)
        
        if(imageData==nil)  { return; }
        
        request.HTTPBody = createBodyWithParameters(param, filePathKey: "fileToUpload", imageDataKey: imageData!, boundary: boundary)
        
 
        
        let task =  NSURLSession.sharedSession().dataTaskWithRequest(request,
                                                                     completionHandler: {
            (data, response, error) -> Void in
        if let data = data {
 
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")

            
                                                                            
        } else if let error = error {
            print(error.description)
        }
        })
        task.resume()
        
        
    }
    
    
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        let body = NSMutableData();
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        let filename = "name.jpg"
        
        let mimetype = "image/jpg"
        
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.appendData(imageDataKey)
        body.appendString("\r\n")
        
        body.appendString("--\(boundary)--\r\n")
        
        return body
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
    
}// extension for impage uploading


