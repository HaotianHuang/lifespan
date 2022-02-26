import Foundation

// to find life expectancy left at age 32, do maleUSbase[32], to find for newborn do maleUSbase[0] range is 0<x<119
let maleUSbase = [76.23,75.69,74.73,73.75,72.76,71.77,70.78,69.79,68.8,67.81,66.81,65.82,64.83,63.84,62.85,61.87,60.9,59.93,58.97,58.02,57.07,56.13,55.2,54.27,53.35,52.43,51.51,50.58,49.67,48.75,47.83,46.92,46,45.09,44.18,43.27,42.36,41.46,40.55,39.65,38.75,37.84,36.95,36.05,35.16,34.26,33.38,32.5,31.62,30.75,29.88,29.03,28.18,27.34,26.51,25.7,24.89,24.1,23.31,22.54,21.77,21.02,20.28,19.54,18.81,18.09,17.38,16.67,15.97,15.28,14.6,13.92,13.25,12.59,11.95,11.32,10.71,10.12,9.54,8.98,8.43,7.91,7.4,6.91,6.44,6,5.58,5.18,4.8,4.45,4.12,3.82,3.54,3.29,3.06,2.87,2.69,2.54,2.4,2.28,2.16,2.05,1.94,1.83,1.73,1.64,1.54,1.45,1.37,1.29,1.21,1.13,1.06,0.99,0.92,0.86,0.8,0.74,0.68,0.63]

let femaleUSbase = [81.28,80.69,79.72,78.74,77.75,76.76,75.77,74.78,73.79,72.79,71.8,70.81,69.81,68.82,67.83,66.84,65.86,64.87,63.89,62.91,61.93,60.96,59.99,59.02,58.05,57.08,56.11,55.14,54.18,53.22,52.26,51.3,50.34,49.39,48.44,47.49,46.54,45.59,44.65,43.71,42.76,41.83,40.89,39.95,39.02,38.09,37.17,36.24,35.33,34.42,33.51,32.61,31.71,30.82,29.94,29.06,28.2,27.34,26.48,25.64,24.8,23.96,23.14,22.32,21.51,20.7,19.9,19.1,18.31,17.53,16.76,16,15.26,14.52,13.81,13.1,12.41,11.74,11.09,10.45,9.83,9.23,8.65,8.09,7.56,7.05,6.56,6.1,5.67,5.26,4.88,4.53,4.2,3.9,3.63,3.39,3.18,2.98,2.81,2.65,2.49,2.35,2.21,2.07,1.94,1.82,1.7,1.59,1.48,1.38,1.28,1.19,1.1,1.02,0.94,0.87,0.8,0.74,0.68,0.6]


// will have to change once we change to scaled LRHF
let femaleLRHFUnderFifty: [Int: Double] = [0:0, 1:2.5, 2:5, 3:7.5, 4:10, 5:14]
let maleLRHFUnderFifty: [Int: Double] = [0:0 , 1:2.1, 2:4.9, 3:6.8, 4:10, 5:12]

// returning -1 is an error. note age has to be 0 < x < 105
func femaleLRHFOverFifty(age: Int, lrhf: Int) -> Double{
    
    if lrhf < 0 || lrhf > 5{
        return -1
    }
    
    let a = femaleLRHFUnderFifty[lrhf]!
    
    let answer = -a/55 * (Double(age) - 105)
    
    return Double(round(1000*answer)/1000)
    
}

//femaleLRHFOverFifty(age: 80, lrhf: 5)

func maleLRHFOverFifty(age: Int, lrhf: Int) -> Double{
    
    if lrhf < 0 || lrhf > 5{
        return -1
    }
    
    let a = maleLRHFUnderFifty[lrhf]!
    
    let answer = -a/55 * (Double(age) - 105)
    
    return Double(round(1000*answer)/1000)
    
}

//maleLRHFOverFifty(age: 80, lrhf: 5)


// A 13 yo girl who sleeps 4 hours a day, has all 5 LRHF living in America.
var sleepHours: Int = 4
var lrhf: Int = 5
// 1 = female. 0 = male
var sex: Int = 1
var age: Int = 13
var baseLifeExpectancy: Double
var lifeExpectancy: Double
var lifeExpectancyLeft: Double

if age < 50 && sex == 1 && lrhf == 5{
    baseLifeExpectancy = femaleUSbase[age]
    lifeExpectancy = baseLifeExpectancy + 14
    lifeExpectancy = lifeExpectancy * (1 - 0.16)
    lifeExpectancyLeft = lifeExpectancy - Double(age)
}

func CalculateLifeExpectancyBeforeSleep(sex: Int, age: Int, lrhf: Int) -> Double{
    
    var lifeExpectancyLeft: Double
    var lifeExpectancy: Double = 0.0

    // first decision is less than or more than 50. if its less or equal to 50, then the gained life expectancy from adopting lrhf is static.
    
    // lrhf has to be 0-5.
    if lrhf < 0 || lrhf > 5{
        return -1
    }
    
    if age <= 50 {
        // if female
        if sex == 1{
            lifeExpectancyLeft = femaleUSbase[age]
            lifeExpectancy = lifeExpectancyLeft + femaleLRHFUnderFifty[lrhf]!
        }
        // if male
        if sex == 0{
            lifeExpectancyLeft = maleUSbase[age]
            lifeExpectancy = lifeExpectancyLeft + maleLRHFUnderFifty[lrhf]!
            
        }
    } else if age > 50 {
        // if female
        if sex == 1{
            lifeExpectancyLeft = femaleUSbase[age]
            lifeExpectancy = lifeExpectancyLeft + femaleLRHFOverFifty(age: age, lrhf: lrhf)
        }
        // if male
        if sex == 0{
            lifeExpectancyLeft = maleUSbase[age]
            lifeExpectancy = lifeExpectancyLeft + maleLRHFOverFifty(age: age, lrhf: lrhf)
        }
        
        
    }
    
    return lifeExpectancy
}

let sleepTax: [Int: Double] = [0:0.16, 1:0.16, 2:0.16, 3:0.16, 4:0.16, 5:0.04, 6:0.04, 7:0, 8:0, 9:0.11, 10:0.11, 11:0.11, 12:0.11]
// accept only 0 <= x, else returns -1. alternatively just use the sleepTax dictionary if value is between 0-12.

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

func ApplySleepTax(sleepHours: Int, lifeExpectancyLeft: Double) -> Double{
    
    var lifeExpectancy: Double = 0
    
    lifeExpectancy = lifeExpectancyLeft * (1 - CalculateSleepTax(sleepHours: sleepHours))
    
    
    return Double(round(1000*lifeExpectancy)/1000)
}

//for i in 1..<100 {
//    print(ApplySleepTax(sleepHours: 7, lifeExpectancyLeft: CalculateLifeExpectancyBeforeSleep(sex: 1, age: i, lrhf: 5)))
//}
