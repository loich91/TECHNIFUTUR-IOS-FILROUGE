//
//  JokeViewController.swift
//  FR01
//
//  Created by Student06 on 01/09/2021.
//

import UIKit
import Alamofire
class JokeViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    var tab :[Value]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ajoutData()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    func ajoutData() {
        AF.request("https://api.icndb.com/jokes/random/20")
            .response{
                data in
        switch data.result{
            case .success(let data):
                
                    if let getData = data{
                           
                                let decoder = JSONDecoder()
                                
                        let person = try! decoder.decode(DataChucknorris.self, from: getData)
                        self.tab = person.value
                        self.tableView.reloadData()
                    }
            case .failure(let error):
                    print(error)
            }
        }
    }
}
extension JokeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table1 = tab?[indexPath.row]

        let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if let table = table1{
            TableViewCell.setupCell(table1: table,index: indexPath.row)
        }
        
        return TableViewCell
    }
    
}

