//
//  DetailCyclistEventViewController.swift
//  DAM_M09
//
//  Created by dam on 11/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit

protocol DataDelegate {
    func reloadData()
}

class DetailCyclistEventViewController: UIViewController {

    var event: Event! = nil
    
    var delegate: DataDelegate?

    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var popularidadTextField: UITextField!
    
    @IBOutlet weak var numEtapasTextField: UITextField!
    
    @IBOutlet weak var paisTextField: UITextField!
    
    @IBOutlet weak var kmsTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if(event != nil){
             let barButtonItems = [UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(updateEvent)), UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteEvent))]
             navigationItem.rightBarButtonItems = barButtonItems
             nombreTextField.isHidden = true
             nombreLabel.text = String (event.getNombre())
             popularidadTextField.text = String (event.getPopularidad())
             paisTextField.text = String(event.getPais())
             numEtapasTextField.text = String(event.getNumEtapas())
             kmsTextField.text = String(event.getKm())
         }else{
             navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEvent))
             nombreLabel.isHidden = false
         }
    }
    
    @objc func deleteEvent(){
        DBManager.sharedInstance.deleteEvent(event: event)
        delegate?.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addEvent(){
        let event = Event(nombre: String(nombreTextField.text!), popularidad: Int(popularidadTextField.text!)!, pais: String(paisTextField.text!), numEtapas: Int(numEtapasTextField.text!)!, km: Int(kmsTextField.text!)!)
        DBManager.sharedInstance.addData(object: event)
        delegate?.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func updateEvent(){
        let event2 = Event(nombre: nombreLabel.text!, popularidad: Int(popularidadTextField.text!)!, pais: paisTextField.text!, numEtapas: Int(numEtapasTextField.text!)!, km: Int(kmsTextField.text!)!)
        DBManager.sharedInstance.updateEvent(event: event2)
        delegate?.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
