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

    @CurrentValueSubjectProperty
    var a: Int = 0
    
    @CurrentValueOnChangeSubjectProperty
    var b: Int = 0
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        $a.sinkOnMain { value in
            print("a: \(value)")
        }.store(in: &cancellables)
        
        $b.sinkOnMain { value in
            print("b: \(value)")
        }.store(in: &cancellables)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        a = 1
        b = 1
    }
    
}

