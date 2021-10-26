//
//  AcceuilViewController.swift
//  FR01
//
//  Created by Student07 on 15/06/2021.
//

import UIKit

class AcceuilViewController: UIViewController {

    
    @IBOutlet var tabnav: UIPageControl!
    @IBOutlet var jkImage: UIImageView!
    @IBOutlet var bulleBd: UIView!
    @IBOutlet var text1Label: UILabel!
    @IBOutlet var text2Label: UILabel!
    @IBOutlet var bubbleTriangle: UIImageView!
    @IBOutlet var imageBg: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    private var tab:[DataHomePager]=[]
    private var collectionViewLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "ACCEUIL"

       setup()
        setupDataHome()
        definitionCollectionView()
    }
    

    func setup(){
        jkImage.transform = jkImage.transform.rotated(by: -(.pi/6))
        bulleBd.layer.cornerRadius = 20
        bubbleTriangle.transform = bulleBd.transform.rotated(by: -(.pi/2))
        text1Label.text = "coucou"
        text2Label.text = "jean-kevin"
        text2Label.textColor = .systemPink
        imageBg.contentMode = .scaleToFill
    }

    func setupDataHome(){
        tab.removeAll()
        tab.append(DataHomePager(image: "bgWolf" ,lien: "j'ai une faim d'loup!",redirect: 1))
        tab.append(DataHomePager(image: "bgClown",lien: "je suis en dep!",redirect: 2))
        tab.append(DataHomePager(image: "bgTree",lien: "faut que j'me bouge!",redirect: 3))
    }
    func definitionCollectionView(){
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionViewLayout.itemSize = CGSize(width: collectionView.bounds.width-100, height: collectionView.bounds.height)
        
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(UINib(nibName: "CollectionViewCellHome", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellHome")
        
        
    }
}


extension AcceuilViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tab.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellHome", for: indexPath) as? CollectionViewCellHome{
            cell.defineCell(homeItem: tab[indexPath.row])
            cell.delegate = self
            return cell
            
        }else{
            fatalError()
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tabnav.currentPage = indexOfMajorCell()
    }
}
extension AcceuilViewController{
    private func indexOfMajorCell() -> Int {
        let itemWidth = collectionViewLayout.itemSize.width
        let proportionalOffset = (collectionView.contentOffset.x) / itemWidth
        let index = Int(round(proportionalOffset))
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        return safeIndex
    }
}
extension AcceuilViewController : HomeItemCellDelegate{
    func redirectTab(index : Int)  {
        self.tabBarController?.selectedIndex = index
    }
}

