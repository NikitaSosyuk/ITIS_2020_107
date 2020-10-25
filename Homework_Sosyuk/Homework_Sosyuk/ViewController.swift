//
//  ViewController.swift
//  Homework_Sosyuk
//
//  Created by Nikita Sosyuk on 20.10.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private var tableView: UITableView!
    
    private var sectionsData: [SectionData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Контакты"
        loadSectionsData()
        tableView.tableFooterView = UIView()
    }
    
    private func loadSectionsData() {
        sectionsData = [
            SectionData(cells: [
                .init(name: "Alba", surname: "Ahmadiev 🕺", numberPhone: "+7 (912) 123-74-45"),
                .init(name: "Artemiy", surname: "Golubev 🙋🏻‍♂️", numberPhone: "+7 (953) 233-74-23"),
                .init(name: "Artur", surname: "Tukmachev 🏎", numberPhone: "+7 (908) 234-94-56"),
                .init(name: "Antom", surname: "Sheverda ⚽️", numberPhone: "+7 (908) 733-74-45")
            ], header: "A"),
            SectionData(cells: [
                .init(name: "Mariya", surname: "Kudyakina 🧸", numberPhone: "+7 (912) 123-74-45"),
                .init(name: "Mother", surname: "♥️", numberPhone: "+7 (953) 233-74-23"),
                .init(name: "Maxim", surname: "Bichkov 🎸", numberPhone: "+7 (908) 234-94-56")
            ], header: "M"),
            SectionData(cells: [
                .init(name: "Nikita", surname: "Sosyuk 🦍", numberPhone: "+7 (908) 733-74-45"),
                .init(name: "Nikita", surname: "Lyapustin 👨🏼‍💻", numberPhone: "+7 (917) 722-72-55")
            ], header: "N"),
            SectionData(cells: [
                .init(name: "Sasha", surname: "Chernyadev 👊", numberPhone: "+7 (917) 722-72-51")
            ], header: "S")
        ]
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = sectionsData?[section] else { return 0 }
        return data.cells.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = sectionsData?[indexPath.section]
            else { fatalError("There aren't needed data") }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basic", for: indexPath)
        cell.textLabel?.text = "\(data.cells[indexPath.row].name) \(data.cells[indexPath.row].surname)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let data = sectionsData?[section]
            else { return nil }
        return data.header
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let profileViewController: ProfileViewController
            = storyboard?.instantiateViewController(identifier: "ProfileViewController")
            else { return }
        
        guard let header = sectionsData?[indexPath.section].header, let cellData = sectionsData?[indexPath.section].cells[indexPath.row]
            else { fatalError("There aren't needed data") }
        
        profileViewController.loadViewIfNeeded()
        profileViewController.setData(name: cellData.name, surname: cellData.surname, number: cellData.numberPhone, letter: header)
        show(profileViewController, sender: nil)
    }
    
    // MARK: - HelpStructs
    
    private struct SectionData {
        let cells: [CellData]
        let header: String
    }
    
    struct CellData {
        let name: String
        let surname: String
        let numberPhone: String
    }
    
}


