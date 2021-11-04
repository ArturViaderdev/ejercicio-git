//
//  Event.swift
//  DAM_M09
//
//  Created by dam on 30/01/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Event: Object{
    
    @objc dynamic private var nombre: String = ""
    @objc dynamic private var popularidad: Int = 0
    @objc dynamic private var pais: String = ""
    @objc dynamic private var numEtapas: Int = 0
    @objc dynamic private var km: Int = 0


    //Hola Artur soy Oscar tu compañero

    //Hola Oscar soy tu compañero Artur

    
    convenience init(nombre:String, popularidad:Int, pais: String, numEtapas: Int, km: Int) {
        self.init()
        self.nombre = nombre
        self.popularidad = popularidad
        self.pais = pais
        self.numEtapas = numEtapas
        self.km = km
    }

    func getNombre() -> String{
        return nombre
    }
    
    func setNombre(nombre:String){
        self.nombre = nombre
    }
    
    func getPopularidad() -> Int {
        return popularidad
    }
    
    func setPopularidad(popularidad:Int){
        self.popularidad = popularidad
    }
    
    func getPais() -> String{
        return self.pais
    }
    
    func setPais(pais: String){
        self.pais = pais
    }
    
    func getNumEtapas() -> Int{
        return self.numEtapas
    }
    
    func setNumEtapas(numEtapas: Int){
        self.numEtapas = numEtapas
    }
    
    func getKm() -> Int{
        return self.km
    }
    
    func setKm(km: Int){
        self.km = km
    }
    
    func setAllValues(event:Event){
        setNombre(nombre: event.getNombre())
        setPopularidad(popularidad: event.getPopularidad())
        setPais(pais: event.getPais())
        setNumEtapas(numEtapas: event.getNumEtapas())
        setKm(km: event.getKm())
    }

}
