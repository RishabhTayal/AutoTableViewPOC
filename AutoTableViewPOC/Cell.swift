//
//  Cell.swift
//  AutoTableViewPOC
//
//  Created by Tayal, Rishabh on 9/3/19.
//  Copyright © 2019 Tayal, Rishabh. All rights reserved.
//

import UIKit
import SDWebImage
import Kingfisher

class Cell: UITableViewCell {

    @IBOutlet var myImage: UIImageView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        myImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(item: [String: Any]) {
        
//        DispatchQueue.global(qos: .default).async {
//            let data = try? Data.init(contentsOf: URL.init(string: item["imageUrl"] as! String)!)
//            DispatchQueue.main.async {
//                let image = UIImage.init(data: data!)!
////                self.myImage.image = image
//
//                let aspect = image.size.width / image.size.height
//
//                let constraint = NSLayoutConstraint(item: self.myImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.myImage, attribute: NSLayoutConstraint.Attribute.height, multiplier: aspect, constant: 0.0)
//                constraint.priority = UILayoutPriority(rawValue: 999)
//
//                self.aspectConstraint = constraint
//
//                self.myImage.image = image
//
//            }
//        }
    }
}

//    internal var aspectConstraint : NSLayoutConstraint? {
//        didSet {
//            if oldValue != nil {
//                self.myImage.removeConstraint(oldValue!)
//            }
//            if aspectConstraint != nil {
//                self.myImage.addConstraint(aspectConstraint!)
//            }
//        }
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        aspectConstraint = nil
//    }
//}
