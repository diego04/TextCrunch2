//
//  User.swft.swift
//  TextCrunch
//
//  Created by Derek Dowling on 2015-01-12.
//  Copyright (c) 2015 Text Crunch. All rights reserved.
//

import Foundation

class User : PFUser, PFSubclassing {

    override init() {
        super.init()
    }
    
    convenience init(email: String, stripeId: String = "") {
        self.init()
        
        self.email = email
        self.username = email
        //self.setStripeId(stripeId)
        
    }
//
////    func setStripeId(id: String) {
////        self["stripeId"] = id
////    }
////    
////    func getStripeId() -> String {
////        return self["stripeId"] as String
////    }
//    
////    func currentUser() -> User {
////        return self.currentUser() as User
////    }
//
}
