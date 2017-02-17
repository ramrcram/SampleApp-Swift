//
//  RecipeModel.swift
//  AutoLayout
//
//  Created by Ramesh on 17/02/17.
//  Copyright © 2017 Ramesh. All rights reserved.
//

import ObjectMapper

class RecipeModel: Mappable {
    var recipename:String?
    var makingplace:String?
    var recipeimage:String?
    var time:String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        recipename    <- map["recipename"]
        makingplace    <- map["makingplace"]
        recipeimage    <- map["recipeimage"]
        time           <- map["time"]
    }
}
