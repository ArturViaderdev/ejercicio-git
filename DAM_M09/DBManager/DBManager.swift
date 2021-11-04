import RealmSwift

class DBManager {
  
    private var database: Realm?
    static let sharedInstance = DBManager()
  
    private init() {
        do {
            database = try Realm(configuration: Realm.Configuration())
        } catch let error as NSError {
            fatalError("Error opening realm: \(error)")
        }
    }
  
//MARK: - ADD
    
    func addData(object: Object) {
        do {
            try database?.write {
            database?.add(object)
            }
        } catch {
            #if DEBUG
            print("Could not write to database: ", error)
            #endif
        }
    }
    
    
//MARK: - UPDATE
    
    func updateCyclist(ciclista: Cyclist)
    {
        let elciclista = database?.objects(Cyclist.self).filter("nombre == '\(ciclista.getNombre())'").first
        try! database?.write {
            elciclista!.altura = ciclista.getAltura()
            elciclista!.especialidad = ciclista.getEspecialidad()
            elciclista!.bajada = ciclista.getBajada()
            elciclista!.crono = ciclista.getCrono()
            elciclista!.edad = ciclista.getEdad()
            elciclista!.equipo = ciclista.getEquipo()
            elciclista!.lider = ciclista.getLider()
            elciclista!.llano = ciclista.getLlano()
            elciclista!.montana = ciclista.getMontana()
            elciclista!.pais = ciclista.getPais()
            elciclista!.peso = ciclista.getPeso()
            elciclista!.popularidad = ciclista.getPopularidad()
            elciclista!.recuperacion = ciclista.getRecuperacion()
            elciclista!.resistencia = ciclista.getResistencia()
            elciclista!.sprint = ciclista.getSprint()
        }
    }
    
    func updateEvent(event: Event)
    {
        let event2 = getEvent(event: event)
        if (event2 != nil){
            try! database?.write {
                event2?.setAllValues(event: event)
            }
        }
    }
    
    func updateTeam(team: Team)
    {
        let team2 = getTeam(team: team)
        if (team2 != nil){
            try! database?.write {
                team2?.setAllValues(team: team)
            }
        }
    }
    
    
    
    
    //MARK: - GET
    
    func getData() -> Results<Cyclist>? {
        return database?.objects(Cyclist.self).sorted(byKeyPath: "popularidad", ascending: false)
    }
    
    func getEvents() -> Results<Event>? {
        return database?.objects(Event.self).sorted(byKeyPath: "popularidad", ascending: false)
    }
    
    func getEvent(event: Event) -> Event? {
        return database?.objects(Event.self).filter("nombre == '\(event.getNombre())'").first
    }
    
    func getTeams() -> Results<Team>? {
        return database?.objects(Team.self)
    }
    
    func getTeam(team: Team) -> Team?{
        return database?.objects(Team.self).filter("nombre == '\(team.getNombre())'").first
    }
        
        

  
  //MARK: - DELETE
  
    func deleteCyclist(ciclista: Cyclist)
    {
        let elciclista = database?.objects(Cyclist.self).filter("nombre == '\(ciclista.getNombre())'").first
        try! database?.write {
                //self.database?.beginWrite()
                self.database?.delete(elciclista!)
        }
    }
    
    func deleteEvent(event: Event){
        let event = getEvent(event: event)
        if (event != nil){
            deleteFromDb(object: event!)
        }
    }
    
    func deleteTeam(team: Team){
           let team2 = getTeam(team: team)
           if (team2 != nil){
               deleteFromDb(object: team2!)
           }
       }
    
    func deleteAllDatabase()  {
        try! database?.write {
          database?.deleteAll()
        }
    }

    func deleteFromDb(object: Object) {
        try! database?.write {
          database?.delete(object)
        }
    }

  //MARK: - TRANSACTIONS
  
    func beginWriteTransaction() {
        database?.beginWrite()
    }

    func commitWriteTransaction() {
        try? database?.commitWrite()
    }
}
