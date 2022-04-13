//
//  ReviewViewController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-11.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var greytag: UIButton!
    @IBOutlet weak var yellowtag: UIButton!
    @IBOutlet weak var purpletag: UIButton!
    @IBOutlet weak var orangetag: UIButton!
    @IBOutlet weak var greentag: UIButton!
    @IBOutlet weak var violettag: UIButton!
    @IBOutlet weak var redtag: UIButton!
    @IBOutlet weak var address2: UILabel!
    @IBOutlet weak var address1: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var url: UILabel!
    let maxcharonline: Int = 16
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
            setTags(optionaltags: unwrappedreview.tags)
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReviewFormController{
            destination.review = review
        }
    }

    @IBAction func editReview(_ sender: UIButton) {
        performSegue(withIdentifier: "editForm", sender: self)
    }
    
    @IBAction func saveUnwindAction(unwindSegue: UIStoryboardSegue){
        if let source = unwindSegue.source as? ReviewFormController{
            url.text = source.url.text
            name.text = source.name.text
            info.text = source.info.text
            price.text = source.price.text
            hours.text = source.hours.text
            phone.text = source.contact.text
            if let addr = source.address1.text {
                let length = addr.count > maxcharonline ? maxcharonline: addr.count
                address1.text = addr.prefix(length).description
                if(addr.count > maxcharonline){
                    address2.text = addr.suffix(addr.count - length).description
                }
            }
            address2.text = [address2.text, source.address2.text].compactMap { $0 }.joined(separator: "")
            setTags(optionaltags: [source.tags1.text, source.tags2.text].compactMap { $0 }.joined(separator: ""))
            if let unwrappedreview = review {
                unwrappedreview.url = url.text
                unwrappedreview.name = name.text
                unwrappedreview.info = info.text
                unwrappedreview.price = price.text
                unwrappedreview.hours = hours.text
                unwrappedreview.contact = phone.text
                unwrappedreview.address = [address1.text, address2.text].compactMap { $0 }.joined(separator: "")
                unwrappedreview.tags = [source.tags1.text, source.tags2.text].compactMap { $0 }.joined(separator: "")
            }
            do {
                try context.save()
            } catch  {
                
            }
            
        }
    }
    
    @IBAction func cancelUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    func setTags(optionaltags: String?)  {
        if let tags = optionaltags{
            let tagsArr = tags.components(separatedBy: ";")
            var text: String = tagsArr.count > 0 ? tagsArr[0].prefix(5).description : ""
            if(text != ""){
                redtag.setTitle(text, for: .normal)
                redtag.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont.systemFont(ofSize: 25)
                    return outgoing
                   }
            }else{
                redtag.backgroundColor = UIColor.white
            }
            
            text = tagsArr.count > 1 ? tagsArr[1].prefix(5).description : ""
            if(text != ""){
                violettag.setTitle(text, for: .normal)
                violettag.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont.systemFont(ofSize: 25)
                    return outgoing
                   }
                
            }else{
                violettag.backgroundColor = UIColor.white
            }
            
            text = tagsArr.count > 2 ? tagsArr[2].prefix(10).description : ""
            if(text != ""){
                greentag.setTitle(text, for: .normal)
                greentag.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont.systemFont(ofSize: 25)
                    return outgoing
                   }
            }else{
                greytag.backgroundColor = UIColor.white
            }
            
            text = tagsArr.count > 3 ? tagsArr[3].prefix(12).description : ""
            if(text != ""){
                orangetag.setTitle(text, for: .normal)
                orangetag.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont.systemFont(ofSize: 25)
                    return outgoing
                   }
            }else{
                orangetag.backgroundColor = UIColor.white
            }
            
            text = tagsArr.count > 4 ? tagsArr[4].prefix(5).description : ""
            if(text != ""){
                purpletag.setTitle(text, for: .normal)
                purpletag.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont.systemFont(ofSize: 25)
                    return outgoing
                   }
            }else{
                purpletag.backgroundColor = UIColor.white
            }
            
            text = tagsArr.count > 5 ? tagsArr[5].prefix(5).description : ""
            if(text != ""){
                yellowtag.setTitle(text, for: .normal)
                yellowtag.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont.systemFont(ofSize: 25)
                    return outgoing
                   }
            }else{
                yellowtag.backgroundColor = UIColor.white
            }
            
            text = tagsArr.count > 6 ? tagsArr[7].prefix(5).description : ""
            if(text != ""){
                greytag.setTitle(text, for: .normal)
                greytag.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont.systemFont(ofSize: 25)
                    return outgoing
                   }
            }else{
                greytag.backgroundColor = UIColor.white
            }
        }
    }
}
