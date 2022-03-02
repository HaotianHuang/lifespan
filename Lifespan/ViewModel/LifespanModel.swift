//
//  LifespanModel.swift
//  Lifespan
//
//  Created by Haotian Huang on 26/2/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    // weight is in kg. (consider changing inputs to imperial)
    @Published var weight: Int = 70
    // height is in cm.
    @Published var height: Int = 170
    // alcohol is standards per week. consider changing to grams. 1 standard = 10grams
    @Published var alcohol: Int = 0
    // smoke is in cigarettes per day
    @Published var smoke: Int = 0
    // diet in percentile
    @Published var diet: Int = 0
    // exercise in minutes per day
    @Published var exerciseTime: Int = 0
    // sex. 0==male, 1==female
    @Published var sex: Int = 1
    
    init(){
        print("Content model initiated")
    }
    
    func SetWeight(weight: Int){
        self.weight = weight
        print("Weight (kg): " + String(self.weight))

    }
    
    func SetHeight(height: Int){
        self.height = height
        print("Height (cm): " + String(self.height))
    }
    
    func SetAlcohol(alcohol: Int){
        self.alcohol = alcohol
        print("Alcohol: " + String(self.alcohol))
    }
    
    func SetSmoke(smoke: Int){
        self.smoke = smoke
        print("Smoke: " + String(self.smoke))
    }
    
    func SetDiet(diet: Int){
        self.diet = diet
        print("Diet (percentile): " + String(self.diet))
    }
    
    func SetExercise(exercise: Int){
        self.exerciseTime = exercise
        print("Exercise (time per day): " + String(self.exerciseTime))
        
    }
    
    func CalculateLRHF() -> Int{
        var lrhf:Int = 0
        
        // BMI
        var BMI: Double = 0
        var heightMeters: Double?
        
        // Calculate BMI
        heightMeters = Double(self.height)/100
        BMI = Double(self.weight)/(heightMeters! * heightMeters!)
        
        print(BMI)
        
        if BMI>18.5 && BMI<24.9{
            lrhf += 1
        }
        
        // Smoking
        if self.smoke == 0{
            lrhf += 1
        }
        
        print(lrhf)
        
        // Alcohol
        var alcoholGrams: Double = 0
        alcoholGrams = Double(alcohol) * 10
        
        if sex == 0{
            if alcoholGrams < 15{
                lrhf += 1
            }
        } else if sex == 1{
            if alcoholGrams < 30{
                lrhf += 1
            }
        }
        
        // Diet
        if diet >= 60 {
            lrhf += 1
        }
        
        // Exercise
        if exerciseTime >= 30 {
            lrhf += 1
        }
        
        print("LRHF: " + String(lrhf))
        return lrhf
        
    }
    
}
