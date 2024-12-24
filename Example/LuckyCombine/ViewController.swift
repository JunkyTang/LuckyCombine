//
//  ViewController.swift
//  LuckyCombine
//
//  Created by 汤俊杰 on 04/20/2024.
//  Copyright (c) 2024 汤俊杰. All rights reserved.
//

import UIKit
import Combine
import LuckyCombine

class ViewController: UIViewController {
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    let fld = UITextField(frame: CGRectMake(100, 100, 100, 100))
    
    let value = CurrentValueSubject<CGRect, Never>(.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        value.bindTo(object: fld, keyPath: \.frame).store(in: &cancellables)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
    }
    
}

