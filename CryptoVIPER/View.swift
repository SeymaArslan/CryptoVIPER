//
//  View.swift
//  CryptoVIPER
//
//  Created by Seyma on 13.10.2023.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func update(with cryptos: [Crypto])
    func update(with error: String)
}

class CryptoViewController: UIViewController, AnyView, UITableViewDataSource, UITableViewDelegate {
    var presenter: AnyPresenter?
    
    var cryptos: [Crypto] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // ilk kısımda custom bir cell oluşturursak onu kullanabilirz.
        table.isHidden = true // gizli yapma sebebimiz veri gelmeden önce boş bir table göstermemek yani veri geldiğinde false olacak
        return table
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading.."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() { // ekleme sebebimiz aslında bu subview'lar eklenince çağırılan fonksiyon, burada elementlerimizi el ile oluşturduğumuz için aslında sürekli olarak subview ekleyeceğiz
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds // view.bounds ekran ne kadarsa tableView o kadar olacak dedik.
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50) // CGRect ile ekranda nereye konumlayacağımızı ve boyutunu söylüyoruz. x: view.frame.width / 2 - 100 değerindeki 100 kendi width inin yarısı ve tam ortada durması için ekledik.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos // buradaki cryptos functa ki ve self.cryptos yani viewController da ki cryptos u gelen cryptos ile dolduruyoruz
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        
    }
    
    
}
