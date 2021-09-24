//
//  ContentView.swift
//  ContactosCoreDataSUI
//
//  Created by Jorge Encinas on 24/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        
        NavigationView{
            
            VStack{
                List{
                        Text("Contenido")
                }
                
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
            }
            
           
            
            
            
        }//NavigationView
    }

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
