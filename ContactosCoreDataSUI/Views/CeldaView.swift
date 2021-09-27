//
//  CeldaView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import SwiftUI

struct CeldaView: View {
    
    var nombre: String
    var apellido: String
    var telefono: String
    var iniciales: String
    
    
    var body: some View {
        HStack{
            Text(iniciales)
                .padding(20)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.title)
            VStack(alignment: .leading){
                Text(nombre)
                    .font(.title)
                    .bold()
                Text(apellido)
                    .font(.headline)
                Text(telefono)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    //.padding([.top], 0.001)
            }
            
        }
    }
}

struct CeldaView_Previews: PreviewProvider {
    static var previews: some View {
        CeldaView(nombre: "", apellido: "", telefono: "", iniciales: "")
    }
}
