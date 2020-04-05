//
//  FirstViewController.swift
//  MVVM
//
//  Created by Field Employee on 4/4/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func placeHolderJsonParse() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/photos") {
            URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options:[]) as? [String: Any]
                if let subjson = json!["RelatedTopics"] as? [[String: Any]] {
        
                    for item in subjson {
                        print(item["Text"] as Any)
                        let simson = SimpsonCharact()
                        guard let splitstring = item["Text"] as? String else{
                            return
                        }
                        let subcast = splitstring.components(separatedBy: " - ")
                        guard (item["Text"] as? String) != nil  else {
                            return
                        }
                        guard (item["Text"] as? String) != nil else{
                            return
                        }
                        
                        simson.name = subcast[0]
                        
                        simson.description = subcast[1]
                        if let image = item["Icon"] as? [String: Any] {
                            guard let imageUrl = image["URL"] as? String else{
                                 return
                            }
                           simson.image = imageUrl
                            print(imageUrl)
                        }
                        self.simsonObjects.append(simson)
                        
                        
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                     }
                 }.resume()
            
              }
       
    }

}

