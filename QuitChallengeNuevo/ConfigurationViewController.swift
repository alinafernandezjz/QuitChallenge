//
//  ConfigurationViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 28/04/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var cantidad: UITextField!
    @IBOutlet weak var costo: UITextField!
    @IBOutlet weak var fraseMotiv: UITextField!
    
    let alert = UIAlertController(title: "Los datos fueron actualizados", message: nil, preferredStyle: .alert)
    
    var user = String()
    
    @IBAction func updateData(_ sender: Any) {
        Model.updateUser(usernam: user, pw: password.text!, cant: cantidad.text!, costo: costo.text!, frase: fraseMotiv.text!)
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }

    override func viewWillAppear(_ animated: Bool) {
        password.text = Model.returnParameter(user: self.user, type: "pw")
        cantidad.text = Model.returnParameter(user: self.user, type: "cantidad")
        costo.text = Model.returnParameter(user: self.user, type: "costo")
        fraseMotiv.text = Model.returnParameter(user: self.user, type: "frase")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
