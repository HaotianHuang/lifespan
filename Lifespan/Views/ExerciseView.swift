//
//  ExerciseView.swift
//  Lifespan
//
//  Created by Haotian Huang on 2/3/22.
//

import SwiftUI

struct ExerciseView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var exerciseTime: Int = 0

    
    var body: some View {
        VStack{
            Text("How much exercise per day on average? (any form of moderate to vigorous sweating counts!)")
            
                
            Button{
                
                model.SetExercise(exercise: 0)
                
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 80, height: 30)
                    Text("None")
                        .foregroundColor(.white)
                }
            }
            
            Button{
                
                model.SetExercise(exercise: 10)
                
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 200, height: 30)
                    Text("A little (~10 min)")
                        .foregroundColor(.white)
                }
            }
            
            Button{
                
                model.SetExercise(exercise: 20)
                
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 200, height: 30)
                    Text("A bit (~20 min)")
                        .foregroundColor(.white)
                }
            }
            
            Button{
                
                model.SetExercise(exercise: 30)
                
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 200, height: 30)
                    Text("Decent (~30 min)")
                        .foregroundColor(.white)
                }
            }
            
            Button{
                
                model.SetExercise(exercise: 40)
                
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 200, height: 30)
                    Text("Not bad (~40 min)")
                        .foregroundColor(.white)
                }
            }
            
            Button{
                
                model.SetExercise(exercise: 50)
                
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 200, height: 30)
                    Text("Woah (~50 min)")
                        .foregroundColor(.white)
                }
            }
            
            Button{
                
                model.SetExercise(exercise: 60)
                
            } label: {
                ZStack{
                    Capsule()
                        .frame(width: 200, height: 30)
                    Text("Nice (~60 min)")
                        .foregroundColor(.white)
                }
            }



            
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
