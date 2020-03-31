//
//  MainViewController.swift
//  Habitual
//
//  Created by Karla Aldana on 2/27/20.
//  Copyright © 2020 Karla Aldana. All rights reserved.
//

import UIKit


class HabitsTableViewController: UITableViewController {
    var habits: [Habit] = [
        Habit(title: "Go to bed after 10pm", image: Habit.Images.book),
        Habit(title: "Drink 8 glasses of water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every hour", image: Habit.Images.book),
    ]
    
    private var persistence = PersistenceLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.register(
            HabitTableViewCell.nib,
            forCellReuseIdentifier: HabitTableViewCell.identifier
        )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(
               withIdentifier: HabitTableViewCell.identifier,
               for: indexPath
           ) as! HabitTableViewCell
           
        let habit = persistence.habits[indexPath.row]
        cell.configure(habit)
        
        return cell
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistence.setNeedsToReloadHabits()
        tableView.reloadData()
    }

}


extension HabitsTableViewController {
    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        let addHabitVC = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
