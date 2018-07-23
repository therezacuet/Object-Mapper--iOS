//
//  ViewController.swift
//  Object Mapping
//
//  Created by Md. Nasir on 4/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let url: String = "https://jsonplaceholder.typicode.com/users"
    let channelUrl: String = "https://script.google.com/macros/s/AKfycbzj_b_lyrqhynJFe7vfS1kXsugz6Lsfc7V6GuqL4OWkxsSprLu7/exec?id=1Xn-NuEQOXs4l8DrfHL1SA8GMBi3l3Q1uNZ0X3FrjbcU&sheet=channel_list"
    var customers = [Customer]()
    
    var cus = [Customer]()
    
    var channel = [ChannelListItem]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData{
        
            self.tableView.reloadData()
            print("Successfully Data Loaded!!!")
        }
        
        loadChannelData {
            print("djfhgjkdfhgjkhjdfhgj")
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return (cus.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
    
        cell.textLabel?.text = cus[indexPath.row].name
     
        
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    private func loadData(completed: @escaping () -> ()){
        AlamofireWrapper.sharedInstance.getCostumers(url, completion: { customers -> Void in
            //print(customers.count)
            self.cus = customers
            completed()
    
        }) { (error) -> Void in
            print(error)
        }
        
    }
    
    private func loadChannelData(completed: @escaping () -> ()){
        AlamofireWrapper.sharedInstance.getChannels(channelUrl, completion: { channel -> Void in
            //print(channel.count)
            //self.cus = customers
            completed()
            
        }) { (error) -> Void in
            print(error)
        }
        
    }
}

