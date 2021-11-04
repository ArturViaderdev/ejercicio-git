//
//  CustomViewCyclistTableDetail.swift
//  DAM_M09
//
//  Created by Artur Viader Mataix on 11/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import UIKit

protocol DetailDelegate {
    func delegateMethod(devuelto:CyclistReturnDelegate)
}

class CustomViewCyclistTableDetail: UIViewController {
    @IBOutlet weak var sLider: UISwitch!
    var delegate: DetailDelegate?
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var tNombre: UITextField!
    @IBOutlet weak var tPopularidad: UITextField!
    @IBOutlet weak var tEdad: UITextField!
    @IBOutlet weak var tPais: UITextField!
    @IBOutlet weak var tEquipo: UITextField!
    @IBOutlet weak var tAltura: UITextField!
    @IBOutlet weak var tPeso: UITextField!
    @IBOutlet weak var tEspecialidad: UITextField!
    @IBOutlet weak var tMontana: UITextField!
    @IBOutlet weak var tLlano: UITextField!
    @IBOutlet weak var boeliminar: UIButton!
    @IBOutlet weak var tBajada: UITextField!
    @IBOutlet weak var tSprint: UITextField!
    @IBOutlet weak var tResis: UITextField!
    @IBOutlet weak var tRecup: UITextField!
    @IBOutlet weak var tCron: UITextField!
    @IBOutlet weak var tLider: UILabel!
    var operacion:Bool = false
    @IBAction func bDelete(_ sender: UIButton) {
        var ciclista:Cyclist = Cyclist(nombre: self.ciclista.getNombre(), edad: 0, pais: "", equipo: "", altura: 0, peso: 0, lider: false, especialidad: "", montana: 0, llano: 0, bajada: 0, sprint: 0, resistencia: 0, recuperacion: 0, crono: 0, popularidad: 0)
        delegate?.delegateMethod(devuelto:CyclistReturnDelegate(ciclista: ciclista, operacion: true))
        
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func bGuardar(_ sender: UIButton) {
        var ciclista:Cyclist
         if(!operacion)
         {
             ciclista = Cyclist(nombre: self.ciclista.getNombre(), edad: 0, pais: "", equipo: "", altura: 0, peso: 0, lider: false, especialidad: "", montana: 0, llano: 0, bajada: 0, sprint: 0, resistencia: 0, recuperacion: 0, crono: 0, popularidad: 0)
             ciclista.setLider(lider: self.ciclista.getLider())
         }
         else
         {
             ciclista = Cyclist(nombre: tNombre.text ?? "sin nombre", edad: 0, pais: "", equipo: "", altura: 0, peso: 0, lider: false, especialidad: "", montana: 0, llano: 0, bajada: 0, sprint: 0, resistencia: 0, recuperacion: 0, crono: 0, popularidad: 0)
             ciclista.setLider(lider: false)
         }
         
        
             ciclista.setEdad(edad: Int(tEdad.text!) ?? 0)
             ciclista.setPais(pais: tPais.text!)
             ciclista.setPeso(peso: Double(tPeso.text!) ?? 0)
             ciclista.setCrono(crono: Int(tCron.text!) ?? 0)
             ciclista.setAltura(altura: Double(tAltura.text!) ?? 0)
             ciclista.setEquipo(equipo: tEquipo.text!)
             ciclista.setEspecialidad(especialidad: tEspecialidad.text!)
             ciclista.setMontana(montana: Int(tMontana.text!) ?? 0)
             ciclista.setLlano(llano: Int(tLlano.text!) ?? 0)
             ciclista.setBajada(bajada: Int(tBajada.text!) ?? 0)
             ciclista.setSprint(sprint: Int(tSprint.text!) ?? 0)
             ciclista.setResistencia(resistencia: Int(tResis.text!) ?? 0)
             ciclista.setRecuperacion(recuperacion: Int(tRecup.text!) ?? 0)
             
             ciclista.setPopularidad(popularidad: Int(tPopularidad.text!) ?? 0)
             ciclista.setLider(lider: sLider.isOn)
             delegate?.delegateMethod(devuelto:CyclistReturnDelegate(ciclista: ciclista, operacion: false))
        navigationController?.popViewController(animated: true)
        
    }
    var ciclista:Cyclist!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func viewDidLoad() {
            super.viewDidLoad()
     
            if !operacion
            {
                labelNombre.isHidden = false
                tNombre.isHidden = true
                labelNombre.text = ciclista.getNombre()
                     tEdad.text = String(ciclista.getEdad())
                     tPais.text = ciclista.getPais()
                     tPeso.text = String(ciclista.getPeso())
                     tCron.text = String(ciclista.getCrono())
                             
                    /* if(ciclista.getLider())
                     {
                             tLider.text = "Si"
                     }
                     else
                     {
                             tLider.text = "No"
                     }*/
                             
                             //viewControllerNew.labelPopularidad.text = String(ciclistas[indexPath.row].getPopularidad())
                tAltura.text = String(ciclista.getAltura())
                tEquipo.text = ciclista.getEquipo()
                tEspecialidad.text = ciclista.getEspecialidad()
                tMontana.text = String(ciclista.getMontana())
                tLlano.text = String(ciclista.getLlano())
         
                tBajada.text = String(ciclista.getBajada())
                tSprint.text = String(ciclista.getSprint())
                tResis.text = String(ciclista.getResistencia())
                tRecup.text = String(ciclista.getRecuperacion())
                tPopularidad.text = String(ciclista.getPopularidad())
                sLider.isOn = ciclista.getLider()
                
                boeliminar.isHidden = false
            }
            else
            {
                labelNombre.isHidden = true
                tNombre.isHidden = false
                boeliminar.isHidden = true
            }
         
    }
    override func viewDidDisappear(_ animated: Bool) {
        
       
        
    }
}
