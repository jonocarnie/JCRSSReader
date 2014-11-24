//
//  TutorialViewController.swift
//  JCRSSReader
//
//  Created by Jonathan Carnie on 23/11/2014.
//  Copyright (c) 2014 Jonathan Carnie. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var tutorialURL: NSURL!
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!

    
    @IBAction func showPublishDate(sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("Then here!")
        
        webview.hidden = true
        toolbar.hidden = true
        self.navigationItem.title = "AppCoda Tutorials"
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if tutorialURL != nil {
            let request : NSURLRequest = NSURLRequest(URL: tutorialURL)
            webview.loadRequest(request)
            
            if webview.hidden {
                webview.hidden = false
                toolbar.hidden = false
            }
        }
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
