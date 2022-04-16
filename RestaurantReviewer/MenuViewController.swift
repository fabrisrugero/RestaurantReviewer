//
//  MenuViewController.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-31.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signOutBtn: UIButton!
    @IBOutlet weak var aboutBtn: UIButton!
    @IBOutlet weak var deleteReviewBtn: UIButton!
    @IBOutlet weak var createReviewBtn: UIButton!
    @IBOutlet weak var passwordTxb: UITextField!
    @IBOutlet weak var usernameTxb: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        signedOut(signedIn: false)
    }
    
    @IBAction func SignIn(_ sender: UIButton) {
        signedOut(signedIn: true)
    }
    
    @IBAction func SignOut(_ sender: UIButton) {
        signedOut(signedIn: false)
    }
    
    @IBAction func createReview(_ sender: UIButton) {
        performSegue(withIdentifier: "createForm", sender: self)
    }
    
    @IBAction func aboutMeClick(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutMe", sender: self)
    }
    func signedOut(signedIn: Bool) {
        aboutBtn.isHidden = signedIn
        signInBtn.isHidden = signedIn
        signOutBtn.isHidden = !signedIn
        passwordTxb.isHidden = signedIn
        usernameTxb.isHidden = signedIn
        createReviewBtn.isHidden = !signedIn
        deleteReviewBtn.isHidden = !signedIn
    }
    @IBAction func kancelUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReviewFormController{
            destination.unwindCancelSegue = "cancelCreate"
            destination.unwindSaveSegue = "saveCreate"
        }
    }

}
