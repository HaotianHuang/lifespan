//
//  LifespanModel.swift
//  Lifespan
//
//  Created by Haotian Huang on 26/2/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    // weight is in kg. (consider changing inputs to imperial)
    @Published var weight: Int?
    // height is in cm.
    @Published var height: Int?
    // alcohol is standards per week. consider changing to grams.
    @Published var alcohol: Int?
    // smoke is in cigarettes per day
    @Published var smoke: Int?
    
    init(){
        print("Content model initiated")
    }
    
    func SetWeight(weight: Int){
        self.weight = weight
        print("Weight (kg): " + String(self.weight!))

    }
    
    func SetHeight(height: Int){
        self.height = height
        print("Height (cm): " + String(self.height!))
    }
    
    func SetAlcohol(alcohol: Int){
        self.alcohol = alcohol
    }
    
    func SetSmoke(smoke: Int){
        self.smoke = smoke
    }
    
}
