//
//  EditarView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 26/09/21.
//

import SwiftUI

struct EditarView: View {
    
    var contacto : Contactos
    
    @Environment(\.managedObjectContext) var contexto
    @Environment(\.presentationMode) var atras
    
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var telefono = ""
    
    
    
    var body: some View {
        VStack{
            TextField("Nombre", text: self.$nombre)
                .padding(10)
                .onAppear{
                    self.nombre = contacto.nombre
                }
            TextField("Apellido", text: self.$apellido)
                .padding(10)
                .onAppear{
                    self.apellido = contacto.apellido
                }
            TextField("Telefono", text: self.$telefono)
                .padding(10)
                .keyboardType(.phonePad)
                .onAppear{
                    self.telefono = contacto.telefono
                }
            Button(action: {
                
                let iniciales = String(self.nombre.first ?? "A") + String(self.apellido.first ?? "A")

                self.contacto.nombre = nombre
                self.contacto.apellido = apellido
                self.contacto.telefono = telefono
                self.contacto.iniciales = iniciales
                
                do{
                    try self.contexto.save()
                    print("Editado!")
                    atras.wrappedValue.dismiss()
                    
                } catch let error as NSError {
                    print("Error al Editar: \(error.localizedDescription) ")
                }
                
                
            }, label: {
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .font(.title)
                Text("Editar contacto")
                    .foregroundColor(.white)
                    .font(.title)
            }).padding(10)
                .background(Color.blue)
            Spacer()
                .navigationTitle("Editar contacto")
            
            
        }
    }
}

struct EditarView_Previews: PreviewProvider {
    static var previews: some View {
        EditarView(contacto: Contactos())
    }
}
