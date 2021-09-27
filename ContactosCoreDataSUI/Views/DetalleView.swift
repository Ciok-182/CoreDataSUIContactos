//
//  DetalleView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import SwiftUI

struct DetalleView: View {
    @Environment(\.presentationMode) var atras
    
    var contacto : Contactos
    
    var body: some View {
        VStack{
            Text(contacto.iniciales)
                .padding(20)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.custom("Arial", size: 100))
            VStack(alignment: .center){
                Text(contacto.nombre)
                    .font(.title)
                    .bold()
                Text(contacto.apellido)
                    .font(.headline)
                Text(contacto.telefono)
                    .font(.title)
                    .foregroundColor(.secondary)
                    //.padding([.top], 0.001)
                HStack{
                    Button(action: {
                        guard let numero = URL(string: "tel://\(contacto.telefono)") else {
                            return
                        }
                        
                        UIApplication.shared.open(numero)
                        
                    }){
                        Image(systemName: "phone.fill")
                            .modifier(botonCircular(color: .green))
                    }
                    
                    NavigationLink(destination: EditarView(contacto: contacto)){
                        Image(systemName: "pencil")
                            .modifier(botonCircular(color: .blue))
                    }
                    
                }
                Spacer()
            }
        }
    }
}


struct botonCircular: ViewModifier{
    var color : Color
    
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
        
    }
}

struct DetalleView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleView(contacto: Contactos())
    }
}
