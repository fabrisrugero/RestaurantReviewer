//
//  ReviewViewController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-11.
//

import UIKit

class ReviewViewController: UIViewController {
    let maxcharonline: Int = 16
    @IBOutlet weak var address2: UILabel!
    @IBOutlet weak var address1: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var url: UILabel!
    var review: Restuarant?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unwrappedreview = review {
            url.text = unwrappedreview.url
            name.text = unwrappedreview.name
            info.text = unwrappedreview.info
            price.text = unwrappedreview.price
            hours.text = unwrappedreview.hours
            phone.text = unwrappedreview.contact
            if let addr = unwrappedreview.address {
                let length = addr.count > maxcharonline ? maxcharonline: addr.count
                address1.text = addr.prefix(length).description
                if(addr.count > maxcharonline){
                    address2.text = addr.suffix(addr.count - length).description
                }
            }
            
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReviewFormController{
            destination.review = review
        }
    }

    @IBAction func editReview(_ sender: UIButton) {
        performSegue(withIdentifier: "editForm", sender: self)
    }
    
    @IBAction func saveUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func cancelUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
}
