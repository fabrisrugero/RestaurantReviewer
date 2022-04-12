//
//  ReviewFormController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-25.
//

import UIKit

class ReviewFormController: UIViewController {
    var review: Restuarant?
    let maxcharonline: Int = 20
    @IBOutlet weak var url: UITextField!
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var hours: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var address2: UITextField!
    
    @IBOutlet weak var tags2: UITextField!
    @IBOutlet weak var tags1: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var fifthstar: UIButton!
    @IBOutlet weak var fourthstar: UIButton!
    @IBOutlet weak var thirdstar: UIButton!
    @IBOutlet weak var secondstar: UIButton!
    @IBOutlet weak var firststar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unwrappedreview = review {
            url.text = unwrappedreview.url
            name.text = unwrappedreview.name
            info.text = unwrappedreview.info
            price.text = unwrappedreview.price
            hours.text = unwrappedreview.hours
            contact.text = unwrappedreview.contact
            if let addr = unwrappedreview.address {
              address1.text = splitText(text: addr, prefix: true)
              address2.text = splitText(text: addr, prefix: false)
            }
            if let tags = unwrappedreview.tags {
              tags1.text = splitText(text: tags, prefix: true)
              tags2.text = splitText(text: tags, prefix: false)
            }
        }
    }
    
    func splitText(text:String, prefix:Bool) -> String {
        if(prefix) {
            let length = text.count > maxcharonline ? maxcharonline: text.count
            return text.prefix(length).description
        }
        else {
            return text.count > maxcharonline ? text.suffix(text.count - maxcharonline).description : ""
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
