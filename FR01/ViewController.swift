//
//  ViewController.swift
//  FR01
//
//  Created by Student07 on 31/05/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btn_cnx_acceuil(_ sender: Any) {
        if let tab = storyboard?.instantiateViewController(withIdentifier: "tab"){
           tab.modalPresentationStyle = .fullScreen
                present(tab, animated: true, completion: nil)
            
        }
    }

    
}

