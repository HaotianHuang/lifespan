//
//  BasicsView.swift
//  Lifespan
//
//  Created by Haotian Huang on 6/3/22.
//

import SwiftUI

struct BasicsView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var sex = 1
    @State private var age = 25
    
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
               
            }
            
            
            
            Button{
            
                model.SetSex(sex: sex)
                model.SetAge(age: age)
                
            } label: {
                Text("Confirm")
            }
           
            
        }
    }
}

struct BasicsView_Previews: PreviewProvider {
    static var previews: some View {
        BasicsView()
    }
}
