//
//  ViewController.swift
//  AutoTableViewPOC
//
//  Created by Tayal, Rishabh on 9/3/19.
//  Copyright © 2019 Tayal, Rishabh. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var array = [[String: Any]]()
    var imagesSeen: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 1000
        
        URLSession.shared.dataTask(with: URL.init(string: "http://www.mocky.io/v2/5d6eb40032000084aea8aa50")!) { (data, response, error) in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                if let json = json as? [[String: Any]] {
                    DispatchQueue.main.async {
                        self.array = json
                        self.tableView.reloadData()
                    }
                }
                
            }
            }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        
        let item = array[indexPath.row]
        let url = URL.init(string: item["imageUrl"] as! String)!
        
        cell.myImage.image = nil
        DispatchQueue.global().async {
            let data = try! Data.init(contentsOf: url)
            DispatchQueue.main.async {
                
                let image = UIImage.init(data: data)!
                if let cell = tableView.cellForRow(at: indexPath) as? Cell, cell.myImage.image == nil {
                    
                    let multiplier = cell.myImage.bounds.width / image.size.width
                    cell.heightConstraint.constant =  multiplier * image.size.height
                    
                    cell.myImage.image = image
                    
                    cell.layoutIfNeeded()
                }
            }
        }
        
        return cell
    }
}
