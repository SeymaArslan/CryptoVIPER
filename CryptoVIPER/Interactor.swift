//
//  Interactor.swift
//  CryptoVIPER
//
//  Created by Seyma on 13.10.2023.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set } // interactor kiminle konuşuyor? presenter ile bu yüzden ekliyoruz.
    func downloadCryptos()
}

class CryptoInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in  // [weak self] eklersek güçlü değil zayıf referans olduğunu belirtmiş oluruz.. daha compleks bir uygulamada güçlü referanslar görünüm değiştiğinde garbage collector'ün işini yapmasına engel olabiliyor o yüzden hafıza da kalabiliyor ve weak self ile bu tarz verilerde bu verilerin de gitmesini ve bir daha karşımıza çıkmamasını sağlayabiliriz.
            
            guard let data = data, error == nil else {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            } catch {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task.resume()
    }
}
