//
//  SleepView.swift
//  Lifespan
//
//  Created by Haotian Huang on 6/3/22.
//

import SwiftUI

struct SleepView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var sleepHours = 7

    var body: some View {
        VStack{
            Text("Sleep: ") + Text(String(sleepHours))
            Picker("", selection: $sleepHours) {
                ForEach(0...12, id: \.self){ i in
                    Text("\(i)").tag(i)
                }
            }
            
            Button{
                
                model.SetSleep(sleep: sleepHours)
                
            } label:{
                Text("Confirm")
            }
            
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}
