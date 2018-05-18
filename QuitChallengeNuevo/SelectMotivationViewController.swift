//
//  SelectMotivationViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 18/03/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class SelectMotivationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectionBtn: UIButton!
    var motivSeleccionada: String = ""
    var date: String = String()
    
    @IBAction func selectPressed(_ sender: UIButton) {
        if pickerView.isHidden{
            pickerView.isHidden = false
        }
    }
    
    @IBAction func fijarMotivacion(_ sender: UIButton) {
        //insertar registro
    }
    
    let motivation = ["Salud","Dinero","Seres queridos","Estética","Otro"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return motivation.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return motivation[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectionBtn.setTitle(motivation[row], for: .normal)
        self.pickerView.isHidden = true
        motivSeleccionada = motivation[row]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "datosUser2") {
            let controller = segue.destination as? DatosPerfilViewController
            controller?.motivacion = motivSeleccionada
            controller?.fecha = date
        }
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
