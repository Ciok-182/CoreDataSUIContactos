//
//  DetalleView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import SwiftUI

struct DetalleView: View {
    var body: some View {
        VStack{
            Text("JE")
                .padding(20)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.custom("Arial", size: 100))
            VStack(alignment: .center){
                Text("Nombre")
                    .font(.title)
                    .bold()
                Text("Apellido")
                    .font(.headline)
                Text("5544332211")
                    .font(.title)
                    .foregroundColor(.secondary)
                    //.padding([.top], 0.001)
                HStack{
                    Button(action: {
                        print("c")
                    }){
                        Image(systemName: "phone.fill")
                            .modifier(botonCircular(color: .green))
                    }
                    Button(action: {
                        print("c")
                    }){
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
        DetalleView()
    }
}
