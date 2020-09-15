//
//  myAlert.swift
//  task2
//
//  Created by MAK on 4/7/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

class MyAlert{
    private  let circle = UIView()
    private  let lodingMessage = UILabel()
    private let Button = UIButton()
    private var imageView = UIImageView(image:#imageLiteral(resourceName: "backGround.jpg"))
    var finish :Bool = false
    
    func showAlert(image: UIImage ,message: String , view : UIView){
        finish = false
        myLoddingShape(view: view)
        imageIcon(image: image)
        alertMessage(message: message)
        cancelButton(view: view)
        delayForSeconds(delay: 2.5) {
            self.dismissAlertByTime()
            self.finish = true
        }
    }
    
    private func myLoddingShape(view: UIView){
        view.addSubview(self.circle)
        circle.alpha = 0
        circle.layer.cornerRadius = 20
        circle.backgroundColor = .white
        circle.layer.shadowOpacity = 10
        circle.layer.shadowRadius = 10
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circle.widthAnchor.constraint(equalToConstant:( ScreenDimension.ScreenWidth() - 50 ) ).isActive = true
        circle.heightAnchor.constraint(equalToConstant: (ScreenDimension.ScreenHeight() * 30/100)  ).isActive = true
        UIView.animate(withDuration: 2) { () -> Void in
            self.circle.alpha = 1
        }
    }
    private func cancelButton(view : UIView){
        circle.addSubview(Button)
        Button.alpha = 1
        Button.setTitle("Cancel", for: .normal)
        Button.setTitleColor(UIColor.systemBlue, for: .normal)
        Button.backgroundColor = .white
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
        Button.bottomAnchor.constraint(equalTo: circle.bottomAnchor).isActive = true
        Button.widthAnchor.constraint(equalToConstant:((ScreenDimension.ScreenWidth()-50)-80)).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 40  ).isActive = true
        Button.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
    }
    @objc func cancelButtonAction(sender: UIButton!) {
        imageView.image = nil;
        Button.removeFromSuperview()
        imageView.removeFromSuperview()
        lodingMessage.removeFromSuperview()
        circle.removeFromSuperview()
        
    }
    private func dismissAlertByTime(){
        UIView.animate(withDuration: 3) { () -> Void in
            self.circle.alpha = 0
            self.Button.alpha = 0
        }
        delayForSeconds(delay: 3) {
            self.imageView.image = nil;
            self.Button.removeFromSuperview()
            self.imageView.removeFromSuperview()
            self.lodingMessage.removeFromSuperview()
            self.circle.removeFromSuperview()
        }
    }
    private func imageIcon(image : UIImage){
        imageView.image = nil;
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        circle.addSubview(imageView)
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: circle.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: (ScreenDimension.ScreenWidth() - 50 ) - 120    ).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: (ScreenDimension.ScreenHeight() * 30/100)  - 120   ).isActive = true
    }
    private func alertMessage(message : String){
        circle.addSubview(lodingMessage)
        lodingMessage.numberOfLines = 0
        lodingMessage.textAlignment = .center
        lodingMessage.text = message
        lodingMessage.textColor = .black
        lodingMessage.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        lodingMessage.translatesAutoresizingMaskIntoConstraints = false
        lodingMessage.topAnchor.constraint(equalTo: imageView.bottomAnchor , constant: 10).isActive = true
       // lodingMessage.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
      //  lodingMessage.centerYAnchor.constraint(equalTo: circle.centerYAnchor).isActive = true
        lodingMessage.widthAnchor.constraint(equalToConstant: (ScreenDimension.ScreenWidth() - 50 )).isActive = true
        lodingMessage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    public func delayForSeconds(delay: Double, completion: @escaping() -> ()) {
        let timer = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: timer) {
            completion()
        }
    }
}
