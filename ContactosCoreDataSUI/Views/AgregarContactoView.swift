//
//  AgregarContactoView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import SwiftUI

struct AgregarContactoView: View {
    
    @Environment(\.managedObjectContext) var contexto
    @Environment(\.presentationMode) var atras
    
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var telefono = ""
    
    
    var body: some View {
        VStack{
            TextField("Nombre", text: self.$nombre)
                .padding(10)
            TextField("Apellido", text: self.$apellido)
                .padding(10)
            TextField("Telefono", text: self.$telefono)
                .padding(10)
                .keyboardType(.phonePad)
            Button(action: {
                let iniciales = String(self.nombre.first ?? "A") + String(self.apellido.first ?? "A")
                let nuevoContacto = Contactos(context: contexto)
                nuevoContacto.nombre = nombre
                nuevoContacto.apellido = apellido
                nuevoContacto.telefono = telefono
                nuevoContacto.iniciales = iniciales
                
                do{
                    try self.contexto.save()
                    print("Guardado!")
                    atras.wrappedValue.dismiss()
                    
                } catch let error as NSError {
                    print("Error al guardar: \(error.localizedDescription) ")
                }
                
                
            }, label: {
                Image(systemName: "person.fill")
                    .foregroundColor(.white)
                    .font(.title)
                Text("Guardar contacto")
                    .foregroundColor(.white)
                    .font(.title)
            }).padding(10)
                .background(Color.blue)
            Spacer()
                .navigationTitle("Agregar contacto")
            
            
        }
    }
}

struct AgregarContactoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarContactoView()
    }
}
