//
//  LoginViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 19/03/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //Proceso de autenticación
    //Guardamos las variables
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var autentication: Bool = Bool() //Checa si el usuario fue autenticado
    let alert = UIAlertController(title: "Por favor, verifica que tu usuario y contraseña sean correctos.", message: nil, preferredStyle: .alert)
    

    @IBAction func autenticacion(_ sender: UIButton) {
        //Autenticamos que exista ese nombre de usuario y contraseña
        autentication = Model.autenticate(user: username.text!, password: password.text!)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        if(identifier == "auth"){
            if autentication{
                return true
            }else{
                self.present(alert, animated: true)
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "auth") {
            let controller = segue.destination as? ViewController
            controller?.username = username.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
