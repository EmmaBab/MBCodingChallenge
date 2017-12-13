//
//  ViewController.swift
//  MapBox
//
//  Created by Emma Babayan on 12/13/17.
//  Copyright © 2017 Emma Babayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var wrongUserName: UILabel!
    @IBOutlet weak var wrongPassword: UILabel!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        userName.text = ""
        password.text = ""
    }

    @IBAction func submit(_ sender: UIButton) {
        if checkTexts() {
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            self.navigationController?.pushViewController(VC, animated: true)}
    }
    func checkTexts ()-> Bool {
        var correct = true
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        if (userName.text?.count)! < 8  || userName.text?.rangeOfCharacter(from: characterset.inverted) != nil {
            wrongUserName.isHidden = false
            correct = false}
        else  { wrongUserName.isHidden = true}
        if (password.text?.count)! < 8 {
            wrongPassword.isHidden = false
            correct = false}
        else {wrongPassword.isHidden = true}
        return correct
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

