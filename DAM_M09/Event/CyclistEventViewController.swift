//
//  CyclistEventViewController.swift
//  DAM_M09
//
//  Created by dam on 04/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//


import UIKit

class CyclistEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var eventos:[Event] = []
    
    override func viewDidLoad() {
          super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "EventViewCell", bundle: nil),forCellReuseIdentifier: "eventViewCell")
        
        createEvents()
        
        eventos = Array(DBManager.sharedInstance.getEvents()!)
        
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "eventViewCell", for: indexPath) as! EventViewCell
        
        myCell.nombre.text = eventos[indexPath.row].getNombre()
        myCell.popularidad.text = String(eventos[indexPath.row].getPopularidad())
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110.0
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailCyclistEvent = DetailCyclistEventViewController(nibName:String(describing: DetailCyclistEventViewController.self), bundle: nil)
            detailCyclistEvent.event = eventos[indexPath.row]
            detailCyclistEvent.delegate = self
            navigationController?.pushViewController(detailCyclistEvent, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
    }

    func createEvents(){
        let event = Event(nombre: "Tour de France", popularidad: 5, pais: "France", numEtapas: 21, km: 50)
        let evento = DBManager.sharedInstance.getEvent(event: event)
        if(evento == nil){
            DBManager.sharedInstance.addData(object: event)
        }
        
        let event1 = Event(nombre: "UCI World Championships", popularidad: 10, pais: "Spain", numEtapas: 1, km: 10)
        let evento1 = DBManager.sharedInstance.getEvent(event: event1)
        if(evento1 == nil){
            DBManager.sharedInstance.addData(object: event1)
        }
        
        let event2 = Event(nombre: "Giro de Italia", popularidad: 91, pais: "Italia", numEtapas: 21, km: 30)
        let evento2 = DBManager.sharedInstance.getEvent(event: event2)
        if (evento2 == nil){
            DBManager.sharedInstance.addData(object: event2)
        }
        
    }
    
    func reloadData() {
        reloadTable()
    }
    
    func reloadTable(){
        eventos = Array(DBManager.sharedInstance.getEvents()!)
        tableView.reloadData()
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

