//
//  UIViewController+Alert.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/7/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import UIKit
extension UIViewController {
    
  func presentAlert(withMessage  message: String) {
    let alertController = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .cancel)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
