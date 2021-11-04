//
//  CyclistViewController.swift
//  DAM_M09
//
//  Created by dam on 03/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit

class CyclistViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, DetailDelegate{
    var operacion:Bool=false
    @IBAction func bCrear(_ sender: UIButton) {
         let viewControllerNew = CustomViewCyclistTableDetail(nibName:String(describing:CustomViewCyclistTableDetail.self), bundle: nil)
              
        viewControllerNew.operacion = true
              viewControllerNew.delegate = self
             operacion = true
              navigationController?.pushViewController(viewControllerNew, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    //hola
    func delegateMethod(devuelto:CyclistReturnDelegate)
    {
        if(operacion)
        {
            DBManager.sharedInstance.addData(object: devuelto.ciclista)
        }
        else
        {
            if(devuelto.getOperacion())
            {
            
                DBManager.sharedInstance.deleteCyclist(ciclista: devuelto.ciclista)
            }
            else
            {
                DBManager.sharedInstance.updateCyclist(ciclista: devuelto.ciclista)
            }
        }
        reloadTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ciclistas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomViewCyclist
       
        myCell.lnombre.text = ciclistas[indexPath.row].getNombre()
        
       /*myCell.labelNombre.text = ciclistas[indexPath.row].getNombre()
        myCell.labelEdad.text = String(ciclistas[indexPath.row].getEdad())
        myCell.labelPais.text = ciclistas[indexPath.row].getPais()
        myCell.labelPeso.text = String(ciclistas[indexPath.row].getPeso())
        myCell.labelCrono.text = String(ciclistas[indexPath.row].getCrono())
        */
        if(ciclistas[indexPath.row].getLider())
        {
            myCell.llider.text = "Si"
        }
        else
        {
            myCell.llider.text = "No"
        }
        
        myCell.lpopularidad.text = String(ciclistas[indexPath.row].getPopularidad())

        /*myCell.labelAltura.text = String(ciclistas[indexPath.row].getAltura())
        myCell.labelEquipo.text = ciclistas[indexPath.row].getEquipo()
        myCell.labelEspecialidad.text = ciclistas[indexPath.row].getEspecialidad()
        myCell.labelMontana.text = String(ciclistas[indexPath.row].getMontana())
        myCell.labelLlano.text = String(ciclistas[indexPath.row].getLlano())
        myCell.labelBajada.text = String(ciclistas[indexPath.row].getBajada())
        myCell.labelSprint.text = String(ciclistas[indexPath.row].getSprint())
        myCell.labelResisten.text = String(ciclistas[indexPath.row].getResistencia())
        myCell.labelRecup.text = String(ciclistas[indexPath.row].getRecuperacion())*/
        
        
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             operacion = false
           
            let viewControllerNew = CustomViewCyclistTableDetail(nibName:String(describing:CustomViewCyclistTableDetail.self), bundle: nil)
        
        viewControllerNew.ciclista = ciclistas[indexPath.row]
        viewControllerNew.operacion = false
        viewControllerNew.delegate = self
         //viewControllerNew.delegate = self
            
             
             //1- Definir la instancia de la vista que voy a enviar la informacion
             
        
      
        //viewControllerNew.labelNombre.text = "Hola"
       /* viewControllerNew.labelNombre.text = ciclistas[indexPath.row].getNombre()
         
       
         
         */
  
        navigationController?.pushViewController(viewControllerNew, animated: true)
        
            
             
         }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
    
    var ciclistas:[Cyclist] = []
    
    func reloadTable()
    {
        ciclistas = Array(DBManager.sharedInstance.getData()!)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ciclista = Cyclist(nombre: "Artur", edad: 37, pais: "Espanya", equipo: "Yo", altura: 1.7, peso: 80, lider: false, especialidad: "Especialidad", montana: 100, llano: 100, bajada: 100, sprint: 100, resistencia: 100, recuperacion: 100, crono: 100, popularidad: 100)
        
        DBManager.sharedInstance.addData(object: ciclista);
        
        ciclista = Cyclist(nombre: "Pedro", edad: 37, pais: "Francia", equipo: "Yo", altura: 1.7, peso: 80, lider: false, especialidad: "Especialidad", montana: 100, llano: 100, bajada: 100, sprint: 100, resistencia: 100, recuperacion: 100, crono: 100, popularidad: 100)
        
        DBManager.sharedInstance.addData(object: ciclista);
        
       ciclista = Cyclist(nombre: "Juan", edad: 37, pais: "Alemania", equipo: "Yo", altura: 1.7, peso: 80, lider: false, especialidad: "Especialidad", montana: 100, llano: 100, bajada: 100, sprint: 100, resistencia: 100, recuperacion: 100, crono: 100, popularidad: 100)
        
        
        
        DBManager.sharedInstance.addData(object: ciclista);
        ciclistas = Array(DBManager.sharedInstance.getData()!)
        //ciclistas.append(ciclista)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomViewCyclist", bundle: nil), forCellReuseIdentifier: "myCell")
        tableView.tableFooterView = UIView()
     
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
