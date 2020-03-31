//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Karla Aldana on 3/29/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    
    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitNameInputField: UITextField!
    @IBAction func createHabitButtonPressed(_ sender: Any){
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    var habitImage: Habit.Images!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
