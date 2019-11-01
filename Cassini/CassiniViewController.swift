//
//  ImageViewController4.swift
//  Cassini
//
//  Created by Manson Jones on 10/31/19.
//  Copyright © 2019 Manson Jones. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                
                
                if let imageVC = segue.destination.contents as? ImageViewController4 {
                    imageVC.imageURL = url
                    print("URL = \(url)")
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
    

}

extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
