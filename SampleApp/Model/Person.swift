//
//  Person.swift
//  AutoLayout
//
//  Created by Ramesh on 17/02/17.
//  Copyright © 2017 Ramesh. All rights reserved.
//
import ObjectMapper

class Persons: Mappable {
    var persons:[Person]!
    required init?(map: Map) {
    }
    // Mappable
    func mapping(map: Map) {
        persons    <- map["Persons"]
    }
}
class Person: Mappable {
    var name:String?
    var age:Int?
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        age     <- map["age"]
    }
}
