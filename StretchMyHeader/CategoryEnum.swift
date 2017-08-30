//
//  CategoryEnum.swift
//  StretchMyHeader
//
//  Created by Jaewon Kim on 2017-08-29.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import Foundation
import UIKit


//MAKR: - category enum
enum Category: String {
    case world = "World"
    case americas = "Americas"
    case europe = "Europe"
    case middelEast = "Middle East"
    case africa = "Africa"
    case asiaPacific = "AsiaPacific"
    
    func color()-> UIColor{
        switch self{
        case .world:
            return UIColor.red
        case .americas:
            return UIColor.blue
        case .europe:
            return UIColor.green
        case .middelEast:
            return UIColor.yellow
        case .africa:
            return UIColor.orange
        case .asiaPacific:
            return UIColor.purple
        }
    }
    
}
