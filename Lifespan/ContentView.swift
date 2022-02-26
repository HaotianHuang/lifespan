//
//  ContentView.swift
//  Lifespan
//
//  Created by Haotian Huang on 21/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var age = 25
    
    @State var lrhf = 0
    
    @State var sleepHours = 7
    
    @State var sex = 1
    
    @State var lifeLeft:Double = 78
    
    var body: some View {
        VStack{
            
            if sex == 1{
                Text("Sex: ") + Text("Female")
            }
            if sex == 0{
                Text("Sex: ") + Text("Male")
            }
            Picker("", selection: $sex){
                Text("Male")
                    .tag(0)
                Text("Female")
                    .tag(1)
            }
            
            HStack{
                
                VStack{
                    Text("Age: ") + Text(String(age))
                    Picker("", selection: $age) {
                        ForEach(1...100, id: \.self){ i in
                            Text("\(i)").tag(i)
                        }
                    }
                }
  
                VStack{
                    Text("LRHF: ") + Text(String(lrhf))
                    Picker("", selection: $lrhf) {
                        ForEach(0...5, id: \.self){ i in
                            Text("\(i)").tag(i)
                        }
                    }
                }
                
                VStack{
                    Text("Sleep: ") + Text(String(sleepHours))
                    Picker("", selection: $sleepHours) {
                        ForEach(0...12, id: \.self){ i in
                            Text("\(i)").tag(i)
                        }
                    }
                }
              
            }
            
            
            
            Button{
                lifeLeft = ApplySleepTax(sleepHours: sleepHours, lifeExpectancyLeft: CalculateLifeExpectancyBeforeSleep(sex: sex, age: age, lrhf: lrhf))
            } label: {
                Text("Calculate")
            }
            
            Text("Life Expectancy Left")
            Text(String(lifeLeft))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
