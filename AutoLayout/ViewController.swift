//
//  ViewController.swift
//  AutoLayout
//
//  Created by Andrew Robinson on 01/03/2018.
//  Copyright © 2018 Andrew Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someView = UIView()
        view.addSubview(someView)
        someView.backgroundColor = .red
        someView.fillSuperview()
        
        let anotherView = UIView()
        view.addSubview(anotherView)
        anotherView.backgroundColor = .blue
        anotherView.anchor(top: someView.topAnchor, left: someView.leftAnchor, topConstant: 50, leftConstant: 20, widthConstant: 50, heightConstant: 50)
    }
}

