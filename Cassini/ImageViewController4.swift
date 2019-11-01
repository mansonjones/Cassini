//
//  ImageViewController4.swift
//  Cassini
//
//  Created by Manson Jones on 10/31/19.
//  Copyright © 2019 Manson Jones. All rights reserved.
//

import UIKit

class ImageViewController4: UIViewController, UIScrollViewDelegate {

       var imageURL: URL? {
           didSet {
               image = nil
    
               // only fetch if you are on screen
               if view.window != nil {
                   fetchImage()
               }
           }
       }
       
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           if imageView.image == nil {
               fetchImage()
           }
       }

    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
            
        }
    }
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    var imageView = UIImageView()
    
    // This is not a memory cylce, befause self does not have a pointer
    // to the closure.
    
    private func fetchImage() {
        if let url = imageURL {
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContents, url == self?.imageURL {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//            print("imageURL: \(String(describing: imageURL))")
//        }
    }
 
    
}
