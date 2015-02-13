//
//  IsbnViewController.swift
//  TextCrunch
//
//  Created by Kevin De Asis on 2015-02-10.
//  Copyright (c) 2015 Text Crunch. All rights reserved.
//

import Foundation
import UIKit

class IsbnViewController: UIViewController {
    
    @IBOutlet weak var isbn: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gradientLayer = BackgroundSetting()
        let background = gradientLayer.background()
        
        background.frame=self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "action") {
            var svc = segue!.destinationViewController as EditListingViewController;
            svc.bookISBN = isbn.text
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}