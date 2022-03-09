//
//  CalculateView.swift
//  Lifespan
//
//  Created by Haotian Huang on 6/3/22.
//

import SwiftUI

struct CalculateView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var lifeExpectancy: Double = 50
    
    var body: some View {
        VStack{
            Text("Life Expectancy: ") + Text(String(lifeExpectancy))
            
            // calculate button here
            Button{
                
                lifeExpectancy = model.CalculateNet()
                
            } label: {
                Text("Calculate")
            }
        }
       
    }
}

struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateView()
    }
}
