//
//  ViewController.swift
//  GamePlane
//
//  Created by 503 on 2020/02/27.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flag:Bool = true
    var objectManager:ObjectManager!
    var hero:Hero!
    
    
    @IBAction func goRight(_ sender: Any) {
        hero.velX = 1
    }
    @IBAction func goLeft(_ sender: Any) {
        hero.velX = -1
    }
    @IBAction func goUp(_ sender: Any) {
        hero.velY = -1
    }
    @IBAction func goDown(_ sender: Any) {
        hero.velY = 1
    }
    @IBAction func rightStop(_ sender: Any) {
        hero.velX = 0
    }
    @IBAction func leftStop(_ sender: Any) {
        hero.velX = 0
    }
    @IBAction func upStop(_ sender: Any) {
        hero.velY = 0
    }
    @IBAction func downStop(_ sender: Any) {
        hero.velY = 0
    }
    
    
    @IBAction func fire(_ sender: Any) {
        print("발사")
        //총알 클래스로부터 인스턴스 생성하고 매니저에게 등록을 의뢰
        let bullet = Bullet(objectId:ObjectId.Bullet, objectManager:objectManager ,parent: self.view, url: "ball.png", x: hero.x + hero.width, y: hero.y + hero.height/2, width: 20, height: 20, velX: 10, velY: 0)
        
        objectManager.addObject(obj: bullet)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
        
        //명단을 매니저에 넘기자
        objectManager = ObjectManager()
        
        createHero()
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
       
        
    }
    
    //주인공생성 
    func createHero(){
        hero = Hero(objectId:ObjectId.Hero, objectManager:objectManager, parent: self.view, url: "plane.png", x: 50, y: 150, width: 80, height: 60, velX: 0, velY: 0)
       
        //생성된 주인공을 오브젝트매니저에게 등록을 의뢰하자!!
        objectManager.addObject(obj: hero)
    }
    
    //적군 생성
    @objc func createEnemy(){
        var name = [
            "e1.png","e2.png","e3.png","e4.png","e5.png"
           ]
        
        for i in 0..<name.count{
            
            var randNum4:Int = Int.random(in: 1...9)
            var randNum3:Int = Int.random(in: 0...4)
            var randNum2:CGFloat = CGFloat.random(in: 1...40)
            
            let en = Enemy(objectId:ObjectId.Enemy,objectManager: objectManager, parent: self.view, url: name[randNum3], x: 700, y: 10 + (CGFloat(i)*(80) + randNum2), width: 50, height: 50, velX: -0.3, velY: 0)
            
            //적군 등장
            objectManager.addObject(obj: en)
        }
        
    }
    
    //게임에 등장하는 대부분의 오브젝트는 애니메아션이 적용되어야 하므로 눈에 보이지않더라도 무한루프가 실행되고 있어야 한다
    //무한류프의 속도는 게임유저거 설정에서 변경할 수도 있ㄷ가
    @objc func gameLoop(){
        //print("루프 실행중..")
        //게임루프에서는 게임에 등장할 명단이 들어있는
        //배열을 대상으로 tick(), render()무조건 호출하면 된다
        //배열ㅇ 들어있는 객체가 없을 경우 nil로 인한 문제도 발생하지 않는다
        for obj in objectManager.objectArray{
            obj.tick()
            obj.render()
        }
        
    }
}

