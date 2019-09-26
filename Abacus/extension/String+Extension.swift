//
//  String+Extension.swift
//  Abacus
//
//  Created by Reena on 26/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension String {
    
    func toInt() -> Int
    {

        if let number = Int(self)
        {
            // number is of type Int
            
            return number
        }
        
        return 0
}

}
