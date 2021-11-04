//
//  Cyclist.swift
//  DAM_M09
//
//  Created by dam on 30/01/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Cyclist:Object
{
    @objc dynamic var nombre:String = ""
    @objc dynamic var edad:Int = 0
    @objc dynamic var pais:String = ""
    @objc dynamic var equipo:String = ""
    @objc dynamic var altura:Double = 0.0
    @objc dynamic var peso:Double = 0.0
    @objc dynamic var lider:Bool = false
    @objc dynamic var especialidad:String = ""
    @objc dynamic var montana:Int = 0
    @objc dynamic var llano:Int = 0
    @objc dynamic var bajada:Int = 0
    @objc dynamic var sprint:Int = 0
    @objc dynamic var resistencia:Int = 0
    @objc dynamic var recuperacion:Int = 0
    @objc dynamic var crono:Int = 0
    @objc dynamic var popularidad = 0

    convenience init(nombre: String, edad: Int, pais: String, equipo: String, altura: Double, peso: Double, lider: Bool, especialidad: String, montana: Int, llano: Int, bajada: Int, sprint: Int, resistencia: Int, recuperacion: Int, crono: Int, popularidad: Int)
    {
        self.init()
        self.nombre = nombre
        self.edad = edad
        self.pais = pais
        self.equipo = equipo
        self.altura = altura
        self.peso = peso
        self.lider = lider
        self.especialidad = especialidad
        self.montana = montana
        self.llano = llano
        self.bajada = bajada
        self.sprint = sprint
        self.resistencia = resistencia
        self.recuperacion = recuperacion
        self.crono = crono
        self.popularidad = popularidad
    }
    
    func getNombre() -> String
    {
        return nombre
    }
    
    func setNombre(nombre:String)
    {
        self.nombre = nombre
    }
    
    func getPopularidad() -> Int
    {
        return popularidad
    }
    
    func setPopularidad(popularidad:Int)
    {
        self.popularidad = popularidad
    }

    func getEdad() -> Int
    {
        return edad
    }

    func setEdad(edad:Int)
    {
        self.edad = edad
    }
    
    func getPais() -> String
    {
        return pais
    }
    
    func setPais(pais:String)
    {
        self.pais = pais
    }
    
    func getEquipo() -> String
    {
        return equipo
    }
    
    func setEquipo(equipo:String)
    {
        self.equipo = equipo
    }

    func getAltura() -> Double
    {
        return altura
    }

    func setAltura(altura:Double)
    {
        self.altura = altura
    }
    
    func getPeso() -> Double
    {
        return peso
    }
    
    func setPeso(peso:Double)
    {
        self.peso = peso
    }
    
    func getLider() -> Bool
    {
        return lider
    }
    
    func setLider(lider:Bool)
    {
        self.lider = lider
    }
    
    func getEspecialidad() -> String
    {
        return especialidad
    }
    
    func setEspecialidad(especialidad:String)
    {
        self.especialidad = especialidad
    }
    
    func getMontana() -> Int
    {
        return montana
    }
    
    func setMontana(montana:Int)
    {
        self.montana = montana
    }
    
    func getLlano() -> Int
    {
        return llano
    }
    
    func setLlano(llano:Int)
    {
        self.llano = llano
    }
    
    func getBajada() -> Int
    {
        return bajada
    }
    
    func setBajada(bajada:Int)
    {
        self.bajada = bajada
    }
    
    func getSprint() -> Int
    {
        return sprint
    }
    
    func setSprint(sprint:Int)
    {
        self.sprint = sprint
    }
    
    func getResistencia() -> Int
    {
        return resistencia
    }
    
    func setResistencia(resistencia:Int)
    {
        self.resistencia = resistencia
    }
    
    func getRecuperacion() -> Int
    {
        return recuperacion
    }
    
    func setRecuperacion(recuperacion:Int)
    {
        self.recuperacion = recuperacion
    }
    
    func getCrono() -> Int
    {
        return crono
    }
    
    func setCrono(crono:Int)
    {
        self.crono = crono
    }
}
