//
//  Team.swift
//  DAM_M09
//
//  Created by dam on 10/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Team: Object {
    
    @objc dynamic private var nombre: String = ""
    @objc dynamic private var manager: String = ""
    @objc dynamic private var pais: String = ""

    //Este es un comentario nuevo
    
    convenience init(nombre:String, manager:String, pais:String) {
        self.init()
        self.nombre = nombre
        self.manager = manager
        self.pais = pais
    }
    
    func getNombre() -> String{
        return nombre
    }
    
    func setNombre(nombre:String){
        self.nombre = nombre
    }
    
    func getManager() -> String {
        return manager
    }
    
    func setManager(manager:String){
        self.manager = manager
    }

    func getPais() -> String {
        return pais
    }
    
    func setPais(pais:String){
        self.pais = pais
    }
    
    func setAllValues(team:Team){
        setManager(manager: team.getManager())
        setPais(pais: team.getPais())
    }
}
