//
//  ReviewTableViewCell.swift
//  RestaurantReviewer
//
//  Created by Rugero Fabris on 2022-03-02.
//

import UIKit

class ReviewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var reviewname: UILabel!
    @IBOutlet weak var firststar: UIButton!
    @IBOutlet weak var secondstar: UIButton!
    @IBOutlet weak var thirdstar: UIButton!
    @IBOutlet weak var fourthstar: UIButton!
    @IBOutlet weak var fifthstar: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadReview(review: Int) {
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
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 3"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func secondstarclick(_ sender: UIButton) {
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func thirdstarclick(_ sender: UIButton) {
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 3"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func fourthstarclick(_ sender: UIButton) {
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 3"), for: .normal)
    }
    @IBAction func fifthstarclick(_ sender: UIButton) {
        firststar.setImage(UIImage(named: "Star 1"), for: .normal)
        secondstar.setImage(UIImage(named: "Star 1"), for: .normal)
        thirdstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fourthstar.setImage(UIImage(named: "Star 1"), for: .normal)
        fifthstar.setImage(UIImage(named: "Star 1"), for: .normal)
    }
}
