//
//  GameObject.swift
//  GamePlane
//
//  Created by 503 on 2020/02/27.
//  Copyright © 2020 ssang. All rights reserved.
//

//게임에 등장할 모든 오브잭트의 촤상위클래스
import UIKit
//열거형 상수 집합
enum ObjectId{
    case Hero, Enemy, Bullet, Item
}
class GameObject: NSObject {
    var objectId:ObjectId
    var objectManager:ObjectManager!
    var parent:UIView! // 이물체를 어느뷰에 붙일지
    var url:String //이미지 경로
    var imgView:UIImageView!
    var x:CGFloat
    var y:CGFloat
    var width:CGFloat
    var height:CGFloat
    var velX:CGFloat
    var velY:CGFloat
    
    //스위프트에서는 생성자는 자식에게 상속된다
    init(objectId:ObjectId,objectManager:ObjectManager, parent:UIView, url:String, x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, velX:CGFloat, velY:CGFloat){
        self.objectId = objectId
        self.objectManager = objectManager
        self.parent = parent
        self.url = url
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.velX = velX
        self.velY = velY
        
        //이미지뷰 생성하고 뷰에 부착
        imgView = UIImageView(image: UIImage(named: url))
         // 이미지 크기
        imgView.frame = CGRect(x: x, y: y, width: width, height: height)
        //이미지뷰 부착
        parent.addSubview(imgView)
        
    }
    //모든 오브젝트가 구현해야할 메서드 정의
    //자바였다면 추상메소드를 정의해야하지만 스위프트에서는 추상메서드가
    //지원되지 않으므로 그냥 로직을 비워놓자
    //하지만 스위프트도 오버라이드를 지원하므로 추후 자식이
    //아래의 메서드를 재정의하면 구현력은 자식의 메서드가 우선시 된다!!
    func tick(){}
    func render(){}
    
    
}
