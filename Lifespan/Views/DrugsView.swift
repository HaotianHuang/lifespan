//
//  DrugsView.swift
//  Lifespan
//
//  Created by Haotian Huang on 28/2/22.
//

import SwiftUI

struct DrugsView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var localAlcohol: Int = 0
    @State private var localSmoke: Int = 0
    
    var body: some View {
        VStack{
            
            HStack{
                VStack{
                    Text("Smoking (cigarettes/day)")
                    Picker("How many cigarettes do you smoke (if any)", selection: $localSmoke){

                        ForEach(0...100, id: \.self){ i in
                            Text(String(i)).tag(i)
                        }
                        
                    }
                }
                VStack{
                    
                    Text("Alcohol intake (standards/day)")
                    Picker("How many standard alcoholic drinks do you have a week (if any)", selection: $localAlcohol){
                        ForEach(0...100, id: \.self){ i in
                            Text(String(i)).tag(i)
                        }
                    }
                    
                    
                }
            }
            
            Button{
                
                model.SetAlcohol(alcohol: localAlcohol)
                model.SetSmoke(smoke: localSmoke)
                
            } label:{
                Text("Confirm")
            }
            
        }
    }
}
