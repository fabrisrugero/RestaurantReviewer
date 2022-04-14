//
//  ViewController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-01.
//

import UIKit

class ReviewsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var reviewmodels = [Restuarant]()
    @IBOutlet weak var reviews: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllReviews()
        reviews.delegate = self
        reviews.dataSource = self
        reviews.rowHeight = UITableView.automaticDimension
        searchBar.searchTextField.backgroundColor = .white
        let nib = UINib(nibName: "ReviewCell", bundle: nil)
        reviews.register(nib, forCellReuseIdentifier: "ReviewCell")
    }
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewmodels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reviewmodel = reviewmodels[indexPath.row]
        let tablecell = reviews.dequeueReusableCell(withIdentifier: "ReviewCell",for:indexPath) as! ReviewCell
        tablecell.loadReview(review: Int(reviewmodel.review))
        tablecell.layer.borderColor = UIColor.gray.cgColor
        tablecell.reviewname.text = reviewmodel.name
        tablecell.layer.borderWidth = 2
        return tablecell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showReview", sender: self)
    }
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        // Return `false` if you do not want the
        //  specified item to be editable.
        return true
    }
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let review:Restuarant = reviewmodels[indexPath.row]
            if(self.deleteReview(restuarant: review)){
            // Delete the row from the data source
            reviewmodels.remove(at: indexPath.row)
            // Then, delete the row from the table itself
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.green // Your color here!
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReviewViewController{
            destination.review = reviewmodels[(reviews.indexPathForSelectedRow?.row)!]
        }
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        if(reviews.isEditing){
            reviews.isEditing = false}
        else{
            performSegue(withIdentifier: "showMenu", sender: self)}
    }
    @IBAction func closeUnwindAction(unwindSegue: UIStoryboardSegue){
        getAllReviews()
    }
    @IBAction func createUnwindAction(unwindSegue: UIStoryboardSegue){
        if let source = unwindSegue.source as? ReviewFormController{
        let newReview = Restuarant(context: context)
            newReview.url = source.url.text
            newReview.name = source.name.text
            newReview.info = source.info.text
            newReview.price = source.price.text
            newReview.hours = source.hours.text
            newReview.contact = source.contact.text
            newReview.review = Int16(source.rating)
            newReview.address = [source.address1.text, source.address2.text].compactMap { $0 }.joined(separator: "")
            newReview.tags = [source.tags1.text, source.tags2.text].compactMap { $0 }.joined(separator: "")
            
            do {
                try context.save()
                getAllReviews()
            } catch let nserror as NSError{
                print("ERROR: Coredata error \(nserror)")
            }
        }
    }
    
    @IBAction func deleteUnwindAction(unwindSegue: UIStoryboardSegue){
        reviews.isEditing = true
    }
    
    func getAllReviews()  {
        do {
            reviewmodels = try context.fetch(Restuarant.fetchRequest())
            DispatchQueue.main.async {
                self.reviews.reloadData()
            }
            
        } catch let nserror as NSError{
            print("ERROR: Coredata error \(nserror)")
        }
    }
    
    func deleteReview(restuarant: Restuarant) -> Bool {
        context.delete(restuarant)
        do {
            try context.save()
            return true
        }catch let nserror as NSError{
            print("ERROR: Coredata error \(nserror)")
            return false
        }
    }
}

