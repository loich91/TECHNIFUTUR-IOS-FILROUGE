//
//  CollectionViewCellHome.swift
//  FR01
//
//  Created by Student06 on 30/09/2021.
//

import UIKit
protocol HomeItemCellDelegate: AnyObject {
    func redirectTab(index: Int)
}
class CollectionViewCellHome: UICollectionViewCell {
    @IBOutlet var image: UIImageView!
    @IBOutlet var text: UILabel!
    @IBOutlet var viewCell: UIView!
    private var homeItem : DataHomePager?
    weak var delegate: HomeItemCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerview()
    }
    private func cornerview(){
        viewCell.layer.cornerRadius = 30
        viewCell.layer.masksToBounds =  true
        self.backgroundColor = .clear
    }
    func defineCell(homeItem: DataHomePager) {
        image.image = UIImage(named: homeItem.image)
        text.text = homeItem.lien
        self.homeItem = homeItem
    }
    @IBAction func btnNav(_ sender: Any) {
        if let homeItem = self .homeItem?.redirect{
            self.delegate?.redirectTab(index:homeItem)
        }
        
    }
}
