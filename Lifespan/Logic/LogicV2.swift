//
//  LogicV2.swift
//  Lifespan
//
//  Created by Haotian Huang on 6/3/22.
//

import Foundation

// to find life expectancy left at age 32, do femaleUSbase[32], to find for newborn do femaleUSbase[0] range is 0<x<119
let femaleUSbase = [81.28,80.69,79.72,78.74,77.75,76.76,75.77,74.78,73.79,72.79,71.8,70.81,69.81,68.82,67.83,66.84,65.86,64.87,63.89,62.91,61.93,60.96,59.99,59.02,58.05,57.08,56.11,55.14,54.18,53.22,52.26,51.3,50.34,49.39,48.44,47.49,46.54,45.59,44.65,43.71,42.76,41.83,40.89,39.95,39.02,38.09,37.17,36.24,35.33,34.42,33.51,32.61,31.71,30.82,29.94,29.06,28.2,27.34,26.48,25.64,24.8,23.96,23.14,22.32,21.51,20.7,19.9,19.1,18.31,17.53,16.76,16,15.26,14.52,13.81,13.1,12.41,11.74,11.09,10.45,9.83,9.23,8.65,8.09,7.56,7.05,6.56,6.1,5.67,5.26,4.88,4.53,4.2,3.9,3.63,3.39,3.18,2.98,2.81,2.65,2.49,2.35,2.21,2.07,1.94,1.82,1.7,1.59,1.48,1.38,1.28,1.19,1.1,1.02,0.94,0.87,0.8,0.74,0.68,0.6]

let maleUSbase = [76.23,75.69,74.73,73.75,72.76,71.77,70.78,69.79,68.8,67.81,66.81,65.82,64.83,63.84,62.85,61.87,60.9,59.93,58.97,58.02,57.07,56.13,55.2,54.27,53.35,52.43,51.51,50.58,49.67,48.75,47.83,46.92,46,45.09,44.18,43.27,42.36,41.46,40.55,39.65,38.75,37.84,36.95,36.05,35.16,34.26,33.38,32.5,31.62,30.75,29.88,29.03,28.18,27.34,26.51,25.7,24.89,24.1,23.31,22.54,21.77,21.02,20.28,19.54,18.81,18.09,17.38,16.67,15.97,15.28,14.6,13.92,13.25,12.59,11.95,11.32,10.71,10.12,9.54,8.98,8.43,7.91,7.4,6.91,6.44,6,5.58,5.18,4.8,4.45,4.12,3.82,3.54,3.29,3.06,2.87,2.69,2.54,2.4,2.28,2.16,2.05,1.94,1.83,1.73,1.64,1.54,1.45,1.37,1.29,1.21,1.13,1.06,0.99,0.92,0.86,0.8,0.74,0.68,0.63]

// MARK: The following dictionaries are redundant because I endede hardcoding them into individual functions

// Exercise
// for y-value at x=0 (or a-value) for 0.5-1.9, access key==0.5. lower-value taken because range is infinite*
let exerciseFemaleUS: [Double: Double] = [0:0, 0.5:4.8, 2.0:6.1, 3.5:7.3, 5.5:7.8]
let exerciseMaleUS: [Double: Double] = [0:0, 0.5:2.9, 2.0:4.6, 3.5:5.5, 5.5:7.4]

// Smoking
// key[-1] returns past smoker status. for 1-14, access key[1]
// key[1] returns a-value for 1-14 cigarettes a day
// key[15] returns a-value for 15-25 cigarettes a day
// key[25] returns a-value for 25+ cigarettes a day
let smokingFemaleUS: [Int: Double] = [-1:-3.5, 0:0, 1:-6.1, 15:-7.8, 25:-9.2]
let smokingMaleUS: [Int: Double] = [-1:-2.9, 0:0, 1:-7, 15:-8.5, 25:-11.8]

// Diet
// key[20] returns bottom 20th percentile. key[40] returns bottom 20th-40th percentile key[100] returns top 20th percentile
let dietFemaleUS: [Int: Double] = [20:0, 40:1.5, 50:2, 60:2.5, 80:3.7, 100:4.9]
let dietMaleUS: [Int: Double] = [20:0, 40:1, 50:1.55, 60:2.1, 80:2.5, 100:3.8]


// Alcohol
// The values here are sourced from both figure 1c and figure 2 and are NOT equivalent to the spreadsheet
// key[0] returns the a-value (y-value at x=50 or x=0 depending on whether backextrapolation has been performed) with no alcohol.
// key[0.1] returns the a-value for 0.1-4.9 g/d
// I stitched together the life expectancy gain for 1 factor adopted from figure 1c for moderate intake, and used the values from figure 2 for 15+ g/d for females and 30+ g/d for males.
let alcoholFemaleUS: [Int: Double] = [0:0, 5:2.5, 15:-0.4, 30:-3]
let alcoholMaleUS: [Int: Double] = [0:0, 5:2.1, 15: 2.1, 30:-1.6]


// BMI
let BMIFemaleUS: [Double: Double] = [18.5:0, 23:0, 25:-0.5, 30:-1.5, 35:-4.5]
let BMIMaleUS: [Double: Double] = [18.5:0, 23:0, 25:-0.6, 30:-3.6, 35:-5.7]


// Net above factors for life expectancy before sleep
// This will break if age is not 0 < x < 105 and if sex is not 0 or 1
func CalculateNetBeforeSleep(sex: Int, age: Int, exercise: Double, smoking: Int, diet: Int, alcohol: Double, BMI: Double) -> Double{
    
    var lifeExpectancy: Double = 0
    
    // Set baseline
    //male
    if sex == 0{
        lifeExpectancy = maleUSbase[age]
        print("Base LE: " + String(lifeExpectancy))
        // Exercise
        lifeExpectancy += MaleExerciseNet(age: age, exercise: exercise)
        print("post-exercise: " + String(lifeExpectancy))
        
        // Smoking
        lifeExpectancy += MaleSmokeNet(age: age, cigarettes: smoking)
        print("post-smoke: " + String(lifeExpectancy))

        // Diet
        lifeExpectancy += MaleDietNet(age: age, diet: diet)
        print("post-diet: " + String(lifeExpectancy))

        // Alcohol
        lifeExpectancy += MaleAlcoholNet(age: age, alcohol: Double(diet))
        print("post-alcohol: " + String(lifeExpectancy))

        // BMI
        lifeExpectancy += MaleBMINet(age: age, BMI: BMI)
        print("post-BMI: " + String(lifeExpectancy))

        
        return lifeExpectancy
        
    }
    // female
    if sex == 1{
        lifeExpectancy = femaleUSbase[age]
        print("Base LE: " + String(lifeExpectancy))

        // Exercise
        lifeExpectancy += FemaleExerciseNet(age: age, exercise: exercise)
        print("post-exercise: " + String(lifeExpectancy))

        // Smoking
        lifeExpectancy += FemaleSmokeNet(age: age, cigarettes: smoking)
        print("post-smoke: " + String(lifeExpectancy))

        // Diet
        lifeExpectancy += FemaleDietNet(age: age, diet: diet)
        print("post-diet: " + String(lifeExpectancy))

        // Alcohol
        lifeExpectancy += FemaleAlcoholNet(age: age, alcohol: alcohol)
        print("post-alcohol: " + String(lifeExpectancy))

        // BMI
        lifeExpectancy += FemaleBMINet(age: age, BMI: BMI)
        print("post-BMI: " + String(lifeExpectancy))

        return lifeExpectancy
    }

    return -1
    
}

// MARK: Individual functions

func CoreEquation(_ a: Double, _ age: Int) -> Double{
    return (a/55)*(105-Double(age))
}

// returns -1 if exercise out of range or negative
func FemaleExerciseNet(age: Int, exercise: Double) -> Double{
    
    if 0..<0.5 ~= exercise{
        return CoreEquation(0, age) - CoreEquation(4.8, age)
    }
    if 0.5..<1.9 ~= exercise{
        return CoreEquation(4.8, age) - CoreEquation(4.8, age)
    }
    if 1.9..<3.4 ~= exercise{
        return CoreEquation(6.1, age) - CoreEquation(4.8, age)
    }
    if 3.4..<5.4 ~= exercise{
        return CoreEquation(7.3, age) - CoreEquation(4.8, age)
    }
    if exercise >= 5.4{
        return CoreEquation(7.8, age) - CoreEquation(4.8, age)
    }
    return -1
    
}

// returns -1 if exercise out of range or negative
func MaleExerciseNet(age: Int, exercise: Double) -> Double{
    
    if 0..<0.5 ~= exercise{
        return CoreEquation(0, age) - CoreEquation(4.6, age)
    }
    if 0.5..<1.9 ~= exercise{
        return CoreEquation(2.9, age) - CoreEquation(4.6, age)
    }
    if 1.9..<3.4 ~= exercise{
        return CoreEquation(4.6, age) - CoreEquation(4.6, age)
    }
    if 3.4..<5.4 ~= exercise{
        return CoreEquation(5.5, age) - CoreEquation(4.6, age)
    }
    if exercise >= 5.4{
        return CoreEquation(7.4, age) - CoreEquation(4.6, age)
    }
    return -1
    
}

// former smoker indicated by cigarettes == -1
func FemaleSmokeNet(age: Int, cigarettes: Int) -> Double{
    
    if cigarettes == -1{
        return CoreEquation(-3.5, age)
    }
    if cigarettes == 0{
        return CoreEquation(0, age)
    }
    if 1...14 ~= cigarettes{
        return CoreEquation(-6.1, age)
    }
    if 15...24 ~= cigarettes{
        return CoreEquation(-7.8, age)
    }
    if cigarettes > 25{
        return CoreEquation(-9.2, age)
    }
    return -1
    
}

// former smoker indicated by cigarettes == -1
func MaleSmokeNet(age: Int, cigarettes: Int) -> Double{
    
    if cigarettes == -1{
        return CoreEquation(-2.9, age)
    }
    if cigarettes == 0{
        return CoreEquation(0, age)
    }
    if 1...14 ~= cigarettes{
        return CoreEquation(-7, age)
    }
    if 15...24 ~= cigarettes{
        return CoreEquation(-8.5, age)
    }
    if cigarettes > 25{
        return CoreEquation(-11.8, age)
    }
    return -1
    
}

func FemaleDietNet(age: Int, diet: Int) -> Double{
    
    if 0...20 ~= diet{
        return CoreEquation(0, age) - CoreEquation(2, age)
    }
    if 21...40 ~= diet{
        return CoreEquation(1.5, age) - CoreEquation(2, age)
    }
    if 41...60 ~= diet{
        return CoreEquation(2.5, age) - CoreEquation(2, age)
    }
    if 60...80 ~= diet{
        return CoreEquation(3.7, age) - CoreEquation(2, age)
    }
    if 81...100 ~= diet{
        return CoreEquation(4.9, age) - CoreEquation(2, age)
    }
    return -1
}

func MaleDietNet(age: Int, diet: Int) -> Double{
    
    if 0...20 ~= diet{
        return CoreEquation(0, age) - CoreEquation(1.55, age)
    }
    if 21...40 ~= diet{
        return CoreEquation(1, age) - CoreEquation(1.55, age)
    }
    if 41...60 ~= diet{
        return CoreEquation(2.1, age) - CoreEquation(1.55, age)
    }
    if 60...80 ~= diet{
        return CoreEquation(2.5, age) - CoreEquation(1.55, age)
    }
    if 81...100 ~= diet{
        return CoreEquation(3.8, age) - CoreEquation(1.55, age)
    }
    return -1
}

// alcohol measured in grams per day
// note again alcohol is the special factor which differs slightly in calculation between male and female AND uses data from both figure 1 and figure 2
func FemaleAlcoholNet(age: Int, alcohol: Double) -> Double{
    
    if 0..<5 ~= alcohol{
        
        return CoreEquation(0, age)
    }
    if 5..<15 ~= alcohol{
        
        return CoreEquation(2.5, age)
    }
    if 15..<30 ~= alcohol{

        return CoreEquation(-0.4, age)
    }
    if alcohol > 30{

        return CoreEquation(-3, age)
    }
    
    return -1
}

// alcohol measured in grams per day
// note again alcohol is the special factor which differs slightly in calculation between male and female AND uses data from both figure 1 and figure 2
func MaleAlcoholNet(age: Int, alcohol: Double) -> Double{
    
    if 0..<5 ~= alcohol{
        return CoreEquation(0, age)
    }
    if 5..<15 ~= alcohol{
        return CoreEquation(2.1, age)
    }
    if 15..<30 ~= alcohol{
        return CoreEquation(2.1, age)
    }
    if alcohol > 30{
        return CoreEquation(-1.6, age)
    }
    
    return -1
}

// note this model does not account for if someone is too thin (<18.5 kg/m^2)
func FemaleBMINet(age: Int, BMI: Double) -> Double{
    
    if 0..<25 ~= BMI{
        return CoreEquation(0, age) - CoreEquation(-0.5, age)
    }
    if 25..<30 ~= BMI{
        return CoreEquation(-0.5, age) - CoreEquation(-0.5, age)
    }
    if 30..<35 ~= BMI{
        return CoreEquation(-1.5, age) - CoreEquation(-0.5, age)
    }
    if BMI > 35 {
        return CoreEquation(-4.5, age) - CoreEquation(-0.5, age)
    }
    return -1
}

// note this model does not account for if someone is too thin (<18.5 kg/m^2)
func MaleBMINet(age: Int, BMI: Double) -> Double{
    
    if 0..<25 ~= BMI{
        return CoreEquation(0, age) - CoreEquation(-0.6, age)
    }
    if 25..<30 ~= BMI{
        return CoreEquation(-0.6, age) - CoreEquation(-0.6, age)
    }
    if 30..<35 ~= BMI{
        return CoreEquation(-3.6, age) - CoreEquation(-0.6, age)
    }
    if BMI > 35 {
        return CoreEquation(-5.7, age) - CoreEquation(-0.6, age)
    }
    return -1
}


// Accept only 0 <= x, else returns -1. Function calculates percentage.
func CalculateSleepTax(sleepHours: Int) -> Double{
    
    if sleepHours < 0{
        return -1
    }
    
    if sleepHours < 5 {
        return 0.16
    }

    if sleepHours == 5 || sleepHours == 6 {
        return 0.04
    }
    
    if sleepHours == 7 || sleepHours == 8 {
        return 0
    }
    
    if sleepHours >= 9 {
        return 0.11
    }
    
    // this shouldn't run
    return -1
}

// lifeExpectancyLeft does not include sleeptax yet.
func ApplySleepTax(sleepHours: Int, lifeExpectancyLeft: Double) -> Double{
    
    var lifeExpectancy: Double = 0
    
    lifeExpectancy = lifeExpectancyLeft * (1 - CalculateSleepTax(sleepHours: sleepHours))
    
    
    return Double(round(1000*lifeExpectancy)/1000)
}

