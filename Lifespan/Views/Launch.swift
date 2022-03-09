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
            BasicsView()
            
            BMIView()
            
            DrugsView()
            
            DietView()
            
            ExerciseView()
            
            SleepView()
            
            CalculateView()
            
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct Launch_Previews: PreviewProvider {
    static var previews: some View {
        Launch()
    }
}
