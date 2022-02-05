//
//  ViewController.swift
//  Biometrics
//
//  Created by Ahmed Fayeq on 05/02/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let authButton    = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        authButton.center = view.center
        authButton.setTitle("Authenticate", for: .normal)
        authButton.backgroundColor = .systemGreen
        authButton.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
        view.addSubview(authButton)
    }
    
    @objc func authenticate(){
        
    }


}

