//
//  ContentView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var contexto
    
    //@FetchRequest(fetchRequest: Contactos.mostrarContactos()) var contactos: FetchedResults<Contactos>

    @FetchRequest(entity: Contactos.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Contactos.nombre, ascending: true)], animation: Animation.easeIn) var contactos : FetchedResults<Contactos>
    
    /*@FetchRequest(entity: Contactos.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Contactos.nombre, ascending: true)],
                  predicate: NSPredicate(format: "apellido = %@", "Encinas")) var contactos : FetchedResults<Contactos>*/
    
    //SELECT * FROM CONTACTOS WHERE APELLIDO = 'Encinas' order bay nombre asc

    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading){
                List {
                    ForEach(contactos) { contacto in
                        
                        NavigationLink(destination: DetalleView(), label: {
                            CeldaView(nombre: contacto.nombre, apellido: contacto.apellido, telefono: contacto.telefono, iniciales: contacto.iniciales)
                        })
                        
                    }.onDelete { (IndexSet) in
                        
                        let borrarContacto = self.contactos[IndexSet.first!]
                        contexto.delete(borrarContacto)
                        
                        
                        do{
                            try self.contexto.save()
                            print("Borrado!")
                            
                        } catch let error as NSError {
                            print("Error al Borrar: \(error.localizedDescription) ")
                        }
                    }
                }
                
                Spacer()
                NavigationLink(destination: AgregarContactoView()){
                    Spacer()
                    Image(systemName: "plus.app.fill")
                        .foregroundColor(.white)
                        .font(.title)
                    Text("Guardar contacto")
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                }.padding()
                    .background(Color.green)
                    .navigationBarTitle("Contactos", displayMode: .inline)
                    .navigationBarItems(leading: EditButton())
                
            } //Vstack
        }//NavigationView
    } //body

}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
