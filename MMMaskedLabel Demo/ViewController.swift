//
//  ViewController.swift
//  MMMaskedLabel Demo
//
//  Created by Michael MacCallum on 1/19/16.
//  Copyright © 2016 Michael MacCallum. All rights reserved.
//

import UIKit
import MMMaskedLabel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        view.backgroundColor = UIColor.blueColor()
        
        let label = MMMaskedLabel(frame: CGRect(x: 0.0, y: 0.0, width: view.bounds.width * 0.8, height: 80.0))
        label.center = view.center
        label.text = "cooooool"
        label.backgroundColor = UIColor.redColor()
        
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

