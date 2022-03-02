//
//  ViewController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    let placeholders = [1,1,1,1,1,1]
    @IBOutlet weak var reviews: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        reviews.delegate = self
        reviews.dataSource = self
        reviews.rowHeight = UITableView.automaticDimension
        searchBar.searchTextField.backgroundColor = .white
        let nib = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        reviews.register(nib, forCellReuseIdentifier: "ReviewTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = reviews.dequeueReusableCell(withIdentifier: "ReviewTableViewCell",for:indexPath) as! ReviewTableViewCell
        tablecell.layer.borderColor = UIColor.gray.cgColor
        tablecell.layer.borderWidth = 2
        return tablecell
    }
    
}

