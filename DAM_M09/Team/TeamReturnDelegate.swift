//
//  TeamReturnDelegate.swift
//  DAM_M09
//
//  Created by dam on 18/02/2020.
//  Copyright © 2020 DAM2T. All rights reserved.
//

import Foundation
class TeamReturnDelegate{
    var team:Team
    var operacion:Bool
    
    init(team:Team,operacion:Bool)
    {
        self.team = team
        self.operacion = operacion
    }
    
    func getTeam() -> Team{
        return team
    }
    
    func getOperacion() -> Bool{
        return operacion
    }
}
