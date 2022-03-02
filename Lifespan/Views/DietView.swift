//
//  DietView.swift
//  Lifespan
//
//  Created by Haotian Huang on 2/3/22.
//

import SwiftUI

struct DietView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var dietPercentile: Int = 0
    
    var body: some View {
        
        VStack{
            
            Text("How would you describe your diet percentile?")
            
            HStack{
                
                Button{
                    
                    model.SetDiet(diet: 30)
                    
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 80, height: 30)
                        Text("Poor")
                            .foregroundColor(.white)
                    }
                }
                
                Button{
                    
                    model.SetDiet(diet: 40)
                    
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 80, height: 30)
                        Text("Average-")
                            .foregroundColor(.white)
                    }
                }
                
                Button{
                    
                    model.SetDiet(diet: 60)
                    
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 80, height: 30)
                        Text("Average+")
                            .foregroundColor(.white)
                    }
                }
                
                Button{
                    
                    model.SetDiet(diet: 70)
                    
                } label: {
                    ZStack{
                        Capsule()
                            .frame(width: 80, height: 30)
                        Text("Good")
                            .foregroundColor(.white)
                    }
                }

                
              
                
            }
            
            
        }
        
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
