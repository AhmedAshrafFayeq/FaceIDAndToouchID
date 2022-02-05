//
//  ViewController.swift
//  Biometrics
//
//  Created by Ahmed Fayeq on 05/02/2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let authButton    = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(authButton)
        authButton.center = view.center
        authButton.setTitle("Authenticate", for: .normal)
        authButton.backgroundColor = .systemGreen
        authButton.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
    }
    
    @objc func authenticate(){
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Please authorize"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                guard let self = self else {return}
                DispatchQueue.main.async {
                    guard success, error == nil else{
                        //failed
                        let alert = UIAlertController(title: "Failed to Authenticate", message: "please try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                        self.present(alert, animated: true)
                        return
                    }
                    //show another screen
                    //success
                    let vc = UIViewController()
                    vc.title = "Welcome"
                    vc.view.backgroundColor = .systemBlue
                    self.present(UINavigationController(rootViewController: vc) , animated: true)
                }
            }
        }else{
            //can not use the feature
            let alert = UIAlertController(title: "Unavailable", message: "you can not use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true)
        }
    }


}

