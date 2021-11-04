//
//  TeamsViewController.swift
//  DAM_M09
//
//  Created by dam on 11/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TeamDelegate {
        
    @IBOutlet weak var tableView: UITableView!
    //eo
    var equipos:[Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "TeamViewCell", bundle: nil), forCellReuseIdentifier: "teamViewCell")
        
        createTeam()
        
        equipos = Array(DBManager.sharedInstance.getTeams()!)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           equipos.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "teamViewCell", for: indexPath) as! TeamViewCell
           
        myCell.nombre.text = equipos[indexPath.row].getNombre()
        myCell.manager.text = String(equipos[indexPath.row].getManager())
        myCell.pais.text = String(equipos[indexPath.row].getPais())
        
        return myCell
    }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailTeam = DetailTeamViewController(nibName:String(describing: DetailTeamViewController.self), bundle: nil)
            detailTeam.team = equipos[indexPath.row]
                detailTeam.delegateTeam = self
            navigationController?.pushViewController(detailTeam, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func createTeam(){
        let equipo = Team(nombre: "Lakers", manager: "NBA", pais: "USA")
        
        let equipo2 = DBManager.sharedInstance.getTeam(team: equipo)
        if(equipo2 == nil){
            DBManager.sharedInstance.addData(object: equipo)
        }
    }
    
    func reloadData() {
        reloadTable()
    }
    
    func reloadTable(){
        equipos = Array(DBManager.sharedInstance.getTeams()!)
        
        tableView.reloadData()
    }
}
