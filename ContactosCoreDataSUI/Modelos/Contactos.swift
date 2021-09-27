//
//  Contactos.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import Foundation
import CoreData

class Contactos: NSManagedObject, Identifiable{
    @NSManaged public var nombre: String
    @NSManaged public var apellido: String
    @NSManaged public var telefono: String
    @NSManaged public var iniciales: String
    
}

extension Contactos{
    static func mostrarContactos() -> NSFetchRequest<Contactos> {
        // SQL select * from CONTACTOS
        let request: NSFetchRequest<Contactos> = Contactos.fetchRequest() as! NSFetchRequest<Contactos>
        //SQL orderby NOMBRE ASC
        request.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        
        return request
        
    }
}
