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
    
    @IBAction func CreateReview(_ sender: UIButton) {
        performSegue(withIdentifier: "createForm", sender: self)
    }
    
    @IBAction func DeleteReview(_ sender: UIButton) {
        
    }
    
    func signedOut(signedIn: Bool) {
        signInBtn.isHidden = signedIn
        signOutBtn.isHidden = !signedIn
        passwordTxb.isHidden = signedIn
        usernameTxb.isHidden = signedIn
        createReviewBtn.isHidden = !signedIn
        deleteReviewBtn.isHidden = !signedIn
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
