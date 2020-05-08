//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by mustafacan on 9.05.2020.
//  Copyright © 2020 mustafacan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cryptoListViewModel : ViewModelCryptoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
    }

    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!;
        
        RequestHelper().getCurrencies(url: url) { (cryptoList) in
            if let list = cryptoList {
                
                self.cryptoListViewModel = ViewModelCryptoList(cryptoList: list)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.size()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        
        cell.ContentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        cell.uiView.layer.cornerRadius = 8
        
        cell.lblPrice?.text = cryptoViewModel.price
        
        cell.lblCurrency?.text = cryptoViewModel.name
        
        return cell;
        
    }

}

