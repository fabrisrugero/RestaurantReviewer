//
//  ReviewFormController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-25.
//

import UIKit

class ReviewFormController: UIViewController {
    var rating: Int = 0
    var review: Restuarant?
    let maxcharonline: Int = 20
    var unwindSaveSegue: String?
    var unwindCancelSegue: String?
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
        savebtn.isEnabled = false
        super.viewDidLoad()
        setFieldsDelegate()
        loadReview()
    }
    
    func setFieldsDelegate()  {
        url.delegate = self
        name.delegate = self
        info.delegate = self
        tags1.delegate = self
        price.delegate = self
        hours.delegate = self
        contact.delegate = self
        address1.delegate = self
    }
    
    func loadReview()  {
        if let unwrappedreview = review {
            url.text = unwrappedreview.url
            name.text = unwrappedreview.name
            info.text = unwrappedreview.info
            price.text = unwrappedreview.price
            hours.text = unwrappedreview.hours
            contact.text = unwrappedreview.contact
            loadRating(review: Int(unwrappedreview.review))
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
    
    @IBOutlet weak var savebtn: UIButton!
    @IBAction func saveReview(_ sender: UIButton) {
        if let _ = contact.text!.range(of: #"^\(\d{3}\)\s\d{3}-\d{4}"#,
                                         options: .regularExpression) {
            performSegue(withIdentifier: unwindSaveSegue!, sender: sender)
        } else {
        
        let alert = UIAlertController(title: "Formart Error",
                                      message: "Phone format is (###) ### ####",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        performSegue(withIdentifier: unwindCancelSegue!, sender: sender)
    }
    func loadRating(review: Int) {
        switch review {
        case 1:
            firststarclick(firststar)
        case 2:
            secondstarclick(secondstar)
        case 3:
            thirdstarclick(thirdstar)
        case 4:
            fourthstarclick(fourthstar)
        case 5:
            fifthstarclick(fifthstar)
        default:
            firststar.setImage(UIImage(named: "Star 3"), for: .normal)
            secondstar.setImage(UIImage(named: "Star 3"), for: .normal)
            thirdstar.setImage(UIImage(named: "Star 3"), for: .normal)
            fourthstar.setImage(UIImage(named: "Star 3"), for: .normal)
            fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
        }
    }
    
    @IBAction func firststarclick(_ sender: UIButton) {
        rating = 1
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 3"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func secondstarclick(_ sender: UIButton) {
        rating = 2
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func thirdstarclick(_ sender: UIButton) {
        rating = 3
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func fourthstarclick(_ sender: UIButton) {
        rating = 4
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func fifthstarclick(_ sender: UIButton) {
        rating = 5
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 1"), for: .normal)
    }
}

extension ReviewFormController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if url.text!.isEmpty || name.text!.isEmpty || info.text!.isEmpty
            || tags1.text!.isEmpty || price.text!.isEmpty || hours.text!.isEmpty || address1.text!.isEmpty {
            savebtn.isEnabled = false
        }
        else {
            savebtn.isEnabled = true
        }
    }
}




