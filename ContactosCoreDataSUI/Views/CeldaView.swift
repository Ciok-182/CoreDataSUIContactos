//
//  CeldaView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import SwiftUI

struct CeldaView: View {
    var body: some View {
        HStack{
            Text("JE")
                .padding(20)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.title)
            VStack(alignment: .leading){
                Text("Nombre")
                    .font(.title)
                    .bold()
                Text("Apellido")
                    .font(.headline)
                Text("5544332211")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    //.padding([.top], 0.001)
            }
            
        }
    }
}

struct CeldaView_Previews: PreviewProvider {
    static var previews: some View {
        CeldaView()
    }
}
