//
//  Enemy.swift
//  GamePlane
//
//  Created by 503 on 2020/02/27.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class Enemy: GameObject {
    
    override func tick() {
        x = x + velX
    }
    
    override func render() {
        imgView.frame.origin.x = x 
    }
}
