//
//  TestModel.swift
//  CKCC
//
//  Created by Bun Leap on 4/10/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import Foundation

struct TestModel: Decodable {
    
    var id: Int! {
        get {
            return Int(replacedId) ?? 0
        }
        set{
            replacedId = String(newValue)
        }
    }
    var replacedId: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        
        case replacedId = "id"
        case name = "name"
        
    }
    
}
