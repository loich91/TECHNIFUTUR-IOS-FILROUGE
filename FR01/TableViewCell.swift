//
//  TableViewCell.swift
//  FR01
//
//  Created by Student06 on 01/09/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var textLabel1: UILabel!
    

    @IBOutlet var viewText: UIView!
    @IBOutlet var imageJk: UIImageView!
    @IBOutlet var jkConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(table1:Value, index:Int){
        textLabel1.text = String(table1.joke)
        viewText.layer.cornerRadius = 20
        if index != 0 {
            imageJk.isHidden = true
            jkConstraint.isActive = false
            
        }
        else{
            imageJk.isHidden = false
            jkConstraint.isActive = true
        }
    }
    
}
extension String {

    init?(htmlEncodedString: String) {

        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }

        guard let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
            return nil
        }

        self.init(attributedString.string)
    }
}
