//
//  Alerts.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import UIKit

func showAlerts(title:String, message:String) {
    DispatchQueue.main.async {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        if let topVC = UIApplication.shared.topMostViewController {
            topVC.present(alert, animated: true, completion: nil)
        }
    }
}

extension UIApplication {
  var topMostViewController : UIViewController? {
    let keyWindow = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
    return keyWindow?.rootViewController?.topMostViewController
  }
}
extension UIViewController {
  var topMostViewController : UIViewController {
    
    if let presented = self.presentedViewController {
      return presented.topMostViewController
    }
    
    if let navigation = self as? UINavigationController {
      return navigation.visibleViewController?.topMostViewController ?? navigation
    }
    
    if let tab = self as? UITabBarController {
      return tab.selectedViewController?.topMostViewController ?? tab
    }
    
    return self
  }
}
