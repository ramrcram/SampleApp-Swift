//
//  User.swift
//  AutoLayout
//
//  Created by Ramesh on 17/02/17.
//  Copyright © 2017 Ramesh. All rights reserved.
//
import ObjectMapper

class UserModel: Mappable {
    var fname:String?
    var profilePic:String?
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        fname    <- map["fname"]
        profilePic     <- map["profile"]
    }
}
