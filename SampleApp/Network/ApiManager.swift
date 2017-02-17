//
//  ApiManager.swift
//  AutoLayout
//
//  Created by Ramesh on 17/02/17.
//  Copyright © 2017 Ramesh. All rights reserved.
//

import UIKit

class ApiManager {

    func getPersons(jsonFile:NSString,completionBlock:((NSString)->())?) {
        if (completionBlock != nil) {
            
            parseJson(jsonFile: jsonFile, completionBlock:{(jsString) in
                completionBlock!(jsString)
            })
        }
    }
    
    func parseJson(jsonFile:NSString,completionBlock:((NSString)->())?) {
        if let path = Bundle.main.path(forResource: jsonFile as String, ofType: "json")
        {
            let jsData =  NSData(contentsOfFile: path)
            if let JSONString = String(data: jsData as! Data, encoding: String.Encoding.utf8){
                completionBlock!(JSONString as NSString)
            }
        }
    }
}
