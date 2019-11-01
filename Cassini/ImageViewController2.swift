//
//  ImageViewController2.swift
//  Cassini
//
//  Created by Manson Jones on 10/31/19.
//  Copyright © 2019 Manson Jones. All rights reserved.
//

import UIKit

class ImageViewController2: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            // only fetch if you are on screen
            if view.window != nil {
                fetchImage()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
            print("imageURL: \(String(describing: imageURL))")
        }
    }




}
