//
//  DetailTeamViewController.swift
//  DAM_M09
//
//  Created by dam on 18/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit

protocol TeamDelegate{
    func reloadData()
}

class DetailTeamViewController: UIViewController {
    
    var team: Team! = nil
    //eo
    var delegateTeam: TeamDelegate?
    
    @IBOutlet weak var lNombre: UILabel!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var pais: UITextField!
    @IBOutlet weak var manager: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        if (team != nil){
            let barButtonItems = [UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(updateTeam)), UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTeam))]
            navigationItem.rightBarButtonItems = barButtonItems
            
            lNombre.isHidden = false
            nombre.isHidden = true
            lNombre.text = team.getNombre()
            manager.text = team.getManager()
            pais.text = team.getPais()
        }else{
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTeam))
            lNombre.isHidden = true
            nombre.isHidden = false
        }
        
    }
    @objc func deleteTeam(){
        DBManager.sharedInstance.deleteTeam(team: team)
        delegateTeam?.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addTeam(){
        let team = Team(nombre: nombre.text!, manager: manager.text!, pais: pais.text!)
        DBManager.sharedInstance.addData(object: team)
        delegateTeam?.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func updateTeam(){
        let team = Team(nombre: lNombre.text!, manager: manager.text!, pais: pais.text!)
        DBManager.sharedInstance.updateTeam(team: team)
        delegateTeam?.reloadData()
        navigationController?.popViewController(animated: true)
    }

}
    
