//
//  Presenter.swift
//  CryptoVIPER
//
//  Created by Seyma on 13.10.2023.
//

import Foundation

enum NetworkError: Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }  // hem okunur hem yazılır diye belirttik sadece get okunur demek ve get set eklemezsek hata atar
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            print(cryptos)
        case .failure(let error):
            print(error)
        }
    }
    
    
}
