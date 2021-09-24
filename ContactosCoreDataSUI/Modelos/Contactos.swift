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

