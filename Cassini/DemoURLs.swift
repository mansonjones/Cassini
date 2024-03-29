//
//  DemoURLs.swift
//  Cassini
//
//  Created by Manson Jones on 10/31/19.
//  Copyright © 2019 Manson Jones. All rights reserved.
//

import Foundation

struct DemoURLs
{
    static let stanford = Bundle.main.url(forResource: "oval", withExtension: "png")
    // static let stanford = Bundle.main.url(forResource: "oval", withExtension: "jpg")
    // static let stanford = URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/55/Stanford_Oval_September_2013_panorama.jpg")
    
    static let cassini = Bundle.main.url(forResource: "cassini", withExtension: "jpg")
    
    static var NASA : Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Cassini" : "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "https://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "https://www.nasa.gov/sites/default/files/saturn_collage.jpg",
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
