//
//  Router.swift
//  CryptoVIPER
//
//  Created by Seyma on 13.10.2023.
//

import Foundation

protocol AnyRouter {
    static func startExecution() -> AnyRouter // static deme sebebimiz diğer sınıflardan da bu metoda erişebilme isteğimiz
}

class CryptoRouter: AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
    
    
    
}
