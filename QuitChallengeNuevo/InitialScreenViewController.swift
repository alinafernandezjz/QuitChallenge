//
//  InitialScreenViewController.swift
//  QuitChallengeNuevo
//
//  Created by Alina Daniela Fernández on 28/04/18.
//  Copyright © 2018 Alina Daniela Fernández. All rights reserved.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    let currentDateTime = Date()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Model.selectUsers()
        Model.selectTestimonios()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func daysBetween() -> DateComponents{ //función que calcula cuántos días han pasado
        let calendar = NSCalendar.current
        
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: Date())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components
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
