//
//  Event.swift
//  CKCC
//
//  Created by Bun Leap on 3/26/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import Foundation

struct Event: Decodable {
    
    let id: Int
    let title: String
    let description: String
    let startDate: String
    let endDate: String
    let imageUrl: String
    let location: String
    
}
