//
//  RecipeActivityModel.swift
//  AutoLayout
//
//  Created by Ramesh on 17/02/17.
//  Copyright © 2017 Ramesh. All rights reserved.
//
import ObjectMapper

class RecipeActivites: Mappable {
    var RecipeActivites:[RecipeActivityModel]?
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        RecipeActivites    <- map["recipeactivity"]
    }
}

class RecipeActivityModel: Mappable {
    var User:UserModel?
    var Recipe:RecipeModel?
    var ActiviteType:String?
    var Users:[UserModel]?
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        User    <- map["user"]
        Recipe  <- map["recipe"]
        ActiviteType       <- map["type"]
        Users   <- map["users"]
    }
}
