//
//  ViewController.swift
//  KingfisherSwiftyJson
//
//  Created by Henry Aguinaga on 2019-04-01.
//  Copyright © 2019 Henry Aguinaga. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    var arrData = [JsonModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonParsing()
   
    }

    func jsonParsing() {
        let url = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try JSON(data: data)
                //print(json)
                
                let results = json["results"]
                //print(results)
                
                for arr in results.arrayValue {
                    //print(arr["trackPrice"])
                    
                    self.arrData.append(JsonModel(json: arr))
                    //print(self.arrData)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                }
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.lblArtist.text = arrData[indexPath.row].artistName
        cell.lblTrack.text = arrData[indexPath.row].trackCensoredName
        
        let imgUrl = URL(string: arrData[indexPath.row].artworkUrl100)
//        cell.imgView.kf.setImage(with: imgUrl)
        cell.imgView.kf.setImage(with: imgUrl, options: [.transition(.fade(0.7))], progressBlock: nil )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
