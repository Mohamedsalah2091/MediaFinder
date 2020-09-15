//
//  myLodingAnimation.swift
//  task2
//
//  Created by MAK on 4/6/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

class LodingAnimation{
    
    private let circle = UIView()
    private var timer : CADisplayLink!
    private let lodingMessage = UILabel()
    private var alphaPercentage : CGFloat =  0.0
    private var ShowAndHide = false
    
    func starterCode(view : UIView){
        myLoddingShape(view: view)
        lodingMessageShape()
        timer = CADisplayLink(target: self, selector: #selector(doLodingAnimation))
        timer.add(to: RunLoop.main, forMode: .default)
    }
    @objc fileprivate func doLodingAnimation(){
        ShowAndHide ? (alphaPercentage -= 1) : (alphaPercentage += 1)
        circle.backgroundColor = UIColor.orange.withAlphaComponent(alphaPercentage / 100 )
        if alphaPercentage > 100 || alphaPercentage < 0{
            ShowAndHide = !ShowAndHide
        }
    }
    
    func stopLoding(){
        alphaPercentage = 0.0
        timer.remove(from: RunLoop.main, forMode: .default)
        lodingMessage.removeFromSuperview()
        circle.removeFromSuperview()
    }
    
    fileprivate func myLoddingShape(view : UIView){
        view.addSubview(circle)
        circle.layer.cornerRadius = 120
        circle.backgroundColor = .white
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 150).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    fileprivate func lodingMessageShape(){
        circle.addSubview(lodingMessage)
        lodingMessage.text = "wating"
        lodingMessage.textColor = .gray
        lodingMessage.font = UIFont(name:"HelveticaNeue-Bold", size: 18.5)
        lodingMessage.translatesAutoresizingMaskIntoConstraints = false
        lodingMessage.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
        lodingMessage.centerYAnchor.constraint(equalTo: circle.centerYAnchor).isActive = true
        lodingMessage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        lodingMessage.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
