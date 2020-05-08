//
//  RequestHelper.swift
//  CryptoCrazy
//
//  Created by mustafacan on 9.05.2020.
//  Copyright © 2020 mustafacan. All rights reserved.
//

import Foundation

class RequestHelper {
    
    func getCurrencies(url: URL, completion: @escaping([ModelCrypto]?) ->() ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
               let cryptoList = try? JSONDecoder().decode([ModelCrypto].self, from: data)
            
                //print(cryptoList)
                
                if let cryptoList = cryptoList {
                  completion(cryptoList)
                }
                
            }
        }.resume()
    }
    
}
