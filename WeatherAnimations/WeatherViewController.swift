//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    
    var sunXAnchor: NSLayoutConstraint!
    var sunYAnchor: NSLayoutConstraint!
    var moonXAnchor: NSLayoutConstraint!
    var moonYAnchor: NSLayoutConstraint!
    var lightningXAnchor: NSLayoutConstraint!
    var lightningYAnchor: NSLayoutConstraint!
    var cloudXAnchor: NSLayoutConstraint!
    var cloudYAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cloud.isHidden = true
        
        self.view.backgroundColor = UIColor.blue
        self.changeBackgroundColor()
        
        animateSunandMoon()
        createLightningButton()
        generateCloudsAndLightning()
    }
    
    func changeBackgroundColor() {
        UIView.animateKeyframes(withDuration: 20, delay: 0.0, options: [.calculationModeCubic, .allowUserInteraction, .repeat], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            }, completion: nil)

    }
    
    func animateSunandMoon() {
        
        self.view.addSubview(sun)
        self.view.addSubview(moon)

        self.sun.translatesAutoresizingMaskIntoConstraints = false
        self.moon.translatesAutoresizingMaskIntoConstraints = false
        
        self.sunXAnchor = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * 1.0)
        self.sunXAnchor.isActive = true
        self.sunYAnchor = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * 1.0)
        self.sunYAnchor.isActive = true
        
        self.moonXAnchor = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * 1.0)
        self.moonXAnchor.isActive = true
        self.moonYAnchor = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * 1.0)
        self.moonYAnchor.isActive = true
        
        self.view.layoutIfNeeded()
        
        UIView.animateKeyframes(withDuration: 20.0, delay: 0.0, options: [.repeat, .calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.sunXAnchor.isActive = false
                self.sunYAnchor.isActive = false
                self.sunYAnchor = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * -0.25)
                self.sunXAnchor = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.sunXAnchor.isActive = true
                self.sunYAnchor.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.sunXAnchor.isActive = false
                self.sunYAnchor.isActive = false
                self.sunYAnchor = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * 0.50)
                self.sunXAnchor = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * -0.70)
                self.sunXAnchor.isActive = true
                self.sunYAnchor.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                self.moonXAnchor.isActive = false
                self.moonYAnchor.isActive = false
                self.moonXAnchor = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.moonYAnchor = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * -0.25)
                self.moonXAnchor.isActive = true
                self.moonYAnchor.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.moonXAnchor.isActive = false
                self.moonYAnchor.isActive = false
                self.moonXAnchor = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.maxX * -0.70)
                self.moonYAnchor = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.maxY * 0.50)
                self.moonYAnchor.isActive = true
                self.moonXAnchor.isActive = true
                self.view.layoutIfNeeded()
            })
            
            }, completion: nil)
    }
    
    
    func createLightningButton() {
        let lightningButton =  UIButton(type: .system)
        view.addSubview(lightningButton)
        lightningButton.translatesAutoresizingMaskIntoConstraints = false
        lightningButton.setTitle("🌩", for: .normal)
        lightningButton.addTarget(self, action: #selector(moveClouds), for: .touchUpInside)
        lightningButton.isUserInteractionEnabled = true
        
        lightningButton.heightAnchor.constraint(equalToConstant: 50)
        lightningButton.widthAnchor.constraint(equalToConstant: 50)
        lightningButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.maxY * 0.25).isActive = true
        lightningButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        lightningButton.backgroundColor = UIColor.white
        lightningButton.layer.borderColor = UIColor.gray.cgColor
        lightningButton.layer.borderWidth = 2
    }
    
    func generateCloudsAndLightning() {
        view.addSubview(cloud)
        view.addSubview(lightning)
        lightning.translatesAutoresizingMaskIntoConstraints = false
        cloud.translatesAutoresizingMaskIntoConstraints = false
        
        cloud.isHidden = true
        self.cloudXAnchor = self.cloud.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.cloudYAnchor = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50)
        self.cloudXAnchor.isActive = true
        self.cloudYAnchor.isActive = true
        self.cloud.alpha = 0.0
        
        lightning.isHidden = true
        self.lightningXAnchor = self.lightning.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        self.lightningYAnchor = self.lightning.topAnchor.constraint(equalTo: self.cloud.bottomAnchor, constant: -5.5)
        self.lightningXAnchor.isActive = true
        self.lightningYAnchor.isActive = true
        self.lightning.alpha = 1.0
    }
    
    
    func moveClouds() {
        
        UIView.animateKeyframes(withDuration: 8.0, delay: 0, options: [.calculationModeCubic, .repeat], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2/8.0, animations: {
                self.cloud.isHidden = false
                self.cloudYAnchor.isActive = false
                self.cloud.alpha = 1.0
                
                //moves cloud up .2xviewheight
                self.cloudYAnchor = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height * -0.2)
                
                self.cloudYAnchor.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 4/8.0, animations: {
                self.cloudYAnchor.isActive = false
                
                //moves cloud down to center
                self.cloudYAnchor = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                
                self.cloudYAnchor.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 2/8.0, animations: {
                self.cloudYAnchor.isActive = false
                self.cloud.alpha = 0
                self.lightning.alpha = 0
                
                //moves cloud up again
                self.cloudYAnchor = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height * -0.2)
                
                self.cloudYAnchor.isActive = true
                self.view.layoutIfNeeded()
            })
            
            
            }, completion: nil )
        


    
    UIView.animateKeyframes(withDuration: 1, delay: 3.0, options: .autoreverse, animations: {
        
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/7, animations: {
            self.lightning.isHidden = false
            self.lightning.alpha = 0
        })
        
        UIView.addKeyframe(withRelativeStartTime: 1/7, relativeDuration: 1/7, animations: {
            self.lightning.alpha = 1
        })
        
        UIView.addKeyframe(withRelativeStartTime: 2/7, relativeDuration: 1/7, animations: {
            self.lightning.alpha = 0
        })
        
        UIView.addKeyframe(withRelativeStartTime: 3/7, relativeDuration: 1/7, animations: {
            self.lightning.alpha = 1
        })
        
        UIView.addKeyframe(withRelativeStartTime: 4/7, relativeDuration: 1/7, animations: {
            self.lightning.alpha = 0
        })
        
        UIView.addKeyframe(withRelativeStartTime: 5/7, relativeDuration: 1/7, animations: {
            self.lightning.alpha = 1
        })
        
        UIView.addKeyframe(withRelativeStartTime: 6/7, relativeDuration: 1/7, animations: {
            self.lightning.alpha = 0
        })
        
        }, completion: nil)
        
    }

}
