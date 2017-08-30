//
//  News.swift
//  StretchMyHeader
//
//  Created by Jaewon Kim on 2017-08-29.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import Foundation

class News{
    
    var category:Category = .world
    var headLine:String = ""
    
    init(category:Category, headLine:String) {
        self.category = category
        self.headLine = headLine
    }
    
}
