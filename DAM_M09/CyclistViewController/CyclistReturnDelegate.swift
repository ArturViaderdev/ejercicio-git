//
//  CyclistReturnDelegate.swift
//  DAM_M09
//
//  Created by Artur Viader Mataix on 11/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import Foundation
class CyclistReturnDelegate{
    var ciclista:Cyclist
    var operacion:Bool
    
    init(ciclista:Cyclist,operacion:Bool)
    {
        self.ciclista = ciclista
        self.operacion = operacion
    }
    
    func getCiclista() -> Cyclist{
        return ciclista
    }
    
    func getOperacion() -> Bool{
        return operacion
    }
}
