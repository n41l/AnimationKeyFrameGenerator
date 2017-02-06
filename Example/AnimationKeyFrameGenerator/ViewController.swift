//
//  ViewController.swift
//  AnimationKeyFrameGenerator
//
//  Created by n41l on 02/06/2017.
//  Copyright (c) 2017 n41l. All rights reserved.
//

import UIKit
import AnimationKeyFrameGenerator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let test = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        test.backgroundColor = UIColor.red
        self.view.addSubview(test)
        
        let kfGenerator = KFGenerator<CGFloat>.default.timingFunction(.elasticEaseOut).from(5, to: 100)
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = kfGenerator.keyFrames()
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        test.layer.add(animation, forKey: "center.x")
        test.layer.position.x = 100

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

