//
//  ARAnimeObject.swift
//  anime-news
//
//  Created by Lucy Zhang on 1/4/18.
//  Copyright © 2018 Lucy Zhang. All rights reserved.
//

import UIKit
import ARKit
import os.log
class ARAnimeObject: NSObject {
    
    var node: SCNNode!
    var title: String!
    lazy var clonedNode: SCNNode = {
        return self.node.clone()
    }()
    
    init(imageFileName:String) {
        super.init()
        if let image = UIImage(named: imageFileName){
            self.node = loadNodeObject(image: image)
        }
    }
    
    init(image:UIImage){
        super.init()
        self.node = loadNodeObject(image: image)
    }
    
    func loadNodeObject(image: UIImage) -> SCNNode
    {
        let box = SCNBox(width: 0.001, height: 0.1, length: 0.1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = image
        let boxNode = SCNNode()
        boxNode.geometry = box
        return boxNode
    }

}
