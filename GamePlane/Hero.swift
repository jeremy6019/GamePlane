//
//  Hero.swift
//  GamePlane
//
//  Created by 503 on 2020/02/27.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class Hero: GameObject {

    //부모의 메서드 나한테 맞게 커스터마이징 하자
    //자바의 오버라이딩
    
    //물리량 변화 메서드
    override func tick(){
        
        x = x + velX
        y = y + velY
        
        for obj in objectManager.objectArray{
            //적군만 추출한다
            if obj.objectId == ObjectId.Enemy {
                //총알과 충돌여부를 검사항 대상이 됨
                let result = self.imgView.frame.intersects(obj.imgView.frame)
                if result == true{
                    //나죽고(배열제거 + 그래픽처리
                    objectManager.removeObject(obj: self)
                    self.imgView.removeFromSuperview()
                    //너죽고 배열제거 + 그래픽처리
                    objectManager.removeObject(obj:obj)
                    obj.imgView.removeFromSuperview()
                }
            }
            
        }
    }
    //화면에 표사될 그래픽 처리
    override func render(){
        imgView.frame.origin.x = x
        imgView.frame.origin.y = y
    }
    
}
