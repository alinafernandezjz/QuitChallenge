//
//  PickerViewViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 20/04/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit
import Foundation

class PickerViewViewController: UIViewController {
    
    @IBOutlet weak var fecha: UIDatePicker!
    
    let dateFormatter = DateFormatter()
    
    var selectedDate = ""
        
    
    @IBAction func datePickerChanged(_ sender: Any) {
        setDate()
    }
    
    func setDate() {
        dateFormatter.dateStyle = .short
        selectedDate = dateFormatter.string(from: fecha.date)
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
        if(segue.identifier == "datosUser") {
            let controller = segue.destination as? SelectMotivationViewController
            controller?.date = selectedDate
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
