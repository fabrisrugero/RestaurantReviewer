//
//  ViewController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-01.
//

import UIKit

class ReviewsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    let placeholders = [1,1,1,1,1,1]
    @IBOutlet weak var reviews: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        reviews.delegate = self
        reviews.dataSource = self
        reviews.rowHeight = UITableView.automaticDimension
        searchBar.searchTextField.backgroundColor = .white
        let nib = UINib(nibName: "ReviewCell", bundle: nil)
        reviews.register(nib, forCellReuseIdentifier: "ReviewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = reviews.dequeueReusableCell(withIdentifier: "ReviewCell",for:indexPath) as! ReviewCell
        tablecell.layer.borderColor = UIColor.gray.cgColor
        tablecell.layer.borderWidth = 2
        return tablecell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showReview", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DetailsViewController{
//            destination.data = models[(tableView.indexPathForSelectedRow?.row)!]
//        }
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "showMenu", sender: self)
    }
    
    @IBAction func closeUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func deleteUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
}

