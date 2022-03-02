//
//  Launch.swift
//  Lifespan
//
//  Created by Haotian Huang on 26/2/22.
//

import SwiftUI

struct Launch: View {
    
    @EnvironmentObject var model: ContentModel

    
    var body: some View {
        
        
        TabView{
            BMIView()
            
            DrugsView()
            
            DietView()
            
            ExerciseView()
            
            ContentView()
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct Launch_Previews: PreviewProvider {
    static var previews: some View {
        Launch()
    }
}
