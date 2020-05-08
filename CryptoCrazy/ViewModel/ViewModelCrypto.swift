//
//  ViewModelCrypto.swift
//  CryptoCrazy
//
//  Created by mustafacan on 9.05.2020.
//  Copyright © 2020 mustafacan. All rights reserved.
//

import Foundation

struct ViewModelCryptoList {
    let cryptoList : [ModelCrypto]
    
    func size() -> Int{
        return self.cryptoList.count
    }
    
    func cryptoAtIndex(index : Int) -> ViewModelCrypto {
        let crypto = self.cryptoList[index]
        return ViewModelCrypto(crypto: crypto)
    }
}

struct ViewModelCrypto {
    let crypto : ModelCrypto
    
    var name : String{
        return self.crypto.currency
    }
    
    var price : String{
        return self.crypto.price
    }
}
