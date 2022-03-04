//
//  BMIView.swift
//  Lifespan
//
//  Created by Haotian Huang on 26/2/22.
//

import SwiftUI

struct BMIView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var localWeight:Int = 60
    @State private var localHeight:Int = 169

    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Weight (kg)") // change to pounds lol
                    Picker("Select weight in kg", selection: $localWeight){
                        ForEach(1...200, id: \.self){i in
                            Text(String(i)).tag(i)
                        }
                    }
                }
                
                VStack{
                    Text("Height (cm)") // change to pounds lol
                    Picker("Select height in cm", selection: $localHeight){
                        ForEach(1...250, id: \.self){i in
                            Text(String(i)).tag(i)
                        }
                    }
                }
            
            }
        
            Button{
                model.SetWeight(weight: localWeight)
                model.SetHeight(height: localHeight)

            } label: {
                Text("Confirm")
            }
        }
    }
}

struct BMIView_Previews: PreviewProvider {
    static var previews: some View {
        BMIView()
    }
}
