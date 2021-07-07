//
//  ViewController.swift
//  FR01
//
//  Created by Student07 on 31/05/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var view_login_bottom: UIView!
    @IBOutlet weak var image_login_JK: UIImageView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var Mdp: UITextField!
    @IBOutlet weak var buttonConnexion: UIButton!
    @IBOutlet weak var text_title: UILabel!
    @IBOutlet weak var bulle_view: UIView!
    @IBOutlet weak var reponseLabel: UILabel!
    @IBOutlet weak var bulleDirection: UIImageView!
    @IBOutlet weak var constraitBottomButton: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleLoginBottom()
        imageTopJK()
        Mdp.isSecureTextEntry = true
        let tapOnView = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
       view.addGestureRecognizer(tapOnView)
        login.keyboardType = .emailAddress
        buttonConnexion.isEnabled = false
        buttonConnexion.backgroundColor = .systemGray5
        reponseLabel.text = ""
        reponseLabel.textAlignment = .center
        styleViewBulle()
        bulleDirection.image = UIImage(named: "bg_bubble_triangle")
        NotificationCenter.default.addObserver( self,
        selector: #selector(KeyboardActive),
        name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.addObserver( self,
        selector: #selector(keyboardDesactive),
        name: UIResponder.keyboardWillHideNotification, object: nil
        )
         


        

    }
    @objc func notifKeyboard(){
        
    }
    @objc func KeyboardActive(_ notification: Notification)  {
        if let keyBoardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            // get keyboard height
            let keyboardHeight = keyBoardFrame.cgRectValue.height
            constraitBottomButton.constant = keyboardHeight + 50
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardDesactive(_ notification: Notification) {
        constraitBottomButton.constant = 50
        self.view.layoutIfNeeded()
    }
    func styleViewBulle()  {
        bulle_view.clipsToBounds = true
        bulle_view.layer.cornerRadius = 20
        text_title.textColor = .red
        text_title.textAlignment = .center
        text_title.text = "Hey! Komen ksé?!"
    }
    func settingLoginPwd(login:String?,mdp:String?,button:UIButton?) {
        if login?.isEmpty ?? true && mdp?.isEmpty ?? true{
            button?.isEnabled = false
            button?.backgroundColor = UIColor.gray
        }else{
            button?.isEnabled = true
            button?.backgroundColor = UIColor.blue
        }
        
    }
    func styleLoginBottom(){
        view_login_bottom.clipsToBounds = true
        view_login_bottom.layer.cornerRadius = 30
        view_login_bottom.contentMode = .scaleToFill
    }
    func imageTopJK(){
        image_login_JK.image = UIImage(named: "bg_blue_homebording")
        image_login_JK.contentMode = .scaleToFill
    }
    func LoginStatement( login:String?) -> Bool {
        if login?.isEmpty ?? true {
            return false
        }
        else{
            if NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$").evaluate(with: login){
                return true
            }
            return false
        }
        
    }
    func passwordStatement(mdp:String?) -> Bool {
        if NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$").evaluate(with: mdp){
            return true
        }
        return false
    }
    @IBAction func loginChange(_ sender: UITextField) {
        settingLoginPwd(login: login.text, mdp: Mdp.text, button: buttonConnexion)
        reponseLabel.text = "tap tap tap tap tap tap ..."
        if LoginStatement(login: login.text) {
            reponseLabel.text = "waah c'est tout vert"
            login.textColor = .green
        }
        else{
            reponseLabel.text = "pas facile de tapper avec \n des gros doigts"
            login.textColor = .red
        }
    }
    @IBAction func pwdChange(_ sender: UITextField) {
        settingLoginPwd(login: login.text, mdp: Mdp.text, button: buttonConnexion)
        reponseLabel.text = "tap tap tap tap tap tap ..."
        if passwordStatement(mdp: Mdp.text) {
            login.textColor = .green
        }
        else{
            reponseLabel.text = "pas facile de tapper avec \n des gros doigts"
            login.textColor = .red
        }
    }
    
    @IBAction func btn_cnx_acceuil(_ sender: Any) {
        if LoginStatement(login: login.text) && passwordStatement(mdp: Mdp.text){
            if let tab = storyboard?.instantiateViewController(withIdentifier: "tab"){
               tab.modalPresentationStyle = .fullScreen
                    present(tab, animated: true, completion: nil)
                
            }
        }
    }
    
}

