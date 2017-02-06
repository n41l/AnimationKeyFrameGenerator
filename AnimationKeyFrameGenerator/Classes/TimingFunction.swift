//
//  TimingFunction.swift
//  Pods
//
//  Created by HuangKun on 2017/2/6.
//
//

import Foundation

public typealias TimingFunc = (_ t: CGFloat) -> CGFloat

public struct TimingFunction {
    public struct Name {
        let function: TimingFunc
        init(_ f: @escaping TimingFunc) {
            self.function = f
        }
    }
}

public extension TimingFunction.Name {
    static let liner = TimingFunction.Name { t in t }
    
    static let quadraticEaseIn = TimingFunction.Name { t in t * t }
    
    static let quadraticEaseOut = TimingFunction.Name { t in -(t * (t - 2)) }

    static let quadraticEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            return 2 * t * t
        }else {
            return -2 * t * t + 4 * t - 1
        }
    }

    static let cubicEaseIn = TimingFunction.Name { t in t * t * t }

    static let cubicEaseOut = TimingFunction.Name { t in
        let delta = t - 1
        return delta * delta * delta + 1
    }

    static let cubicEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            return 4 * t * t * t
        }else {
            let delta = ((2 * t) - 2)
            return 0.5 * t * t * t + 1
        }
    }
    
    static let quarticEaseIn = TimingFunction.Name { t in t * t * t * t }
    
    static let quarticEaseOut = TimingFunction.Name { t in
        let delta = t - 1
        return delta * delta * delta * (1 - t) + 1
    }
    
    static let quarticEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            return 8 * t * t * t * t
        }else {
            let delta = t - 1
            return -8 * delta * delta * delta * delta + 1
        }
    }
    static let quinticEaseIn = TimingFunction.Name { t in t * t * t * t * t }
    
    static let quinticEaseOut = TimingFunction.Name { t in
        let delta = t - 1
        return delta * delta * delta * delta * delta + 1
    }
    
    static let quinticEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            return 16 * t * t * t * t * t
        }else {
            let delta = ((2 * t) - 2)
            return 0.5 * t * t * t * t * t + 1
        }
    }
    
    static let sineEaseIn = TimingFunction.Name { t in sin((t - 1) * CGFloat(M_PI_2)) + 1 }

    static let sineEaseOut = TimingFunction.Name { t in sin(t * CGFloat(M_PI_2)) }

    static let sineEaseInOut = TimingFunction.Name { t in 0.5 * (1 - cos(t * CGFloat(M_PI_2))) }

    static let circularEaseIn = TimingFunction.Name { t in 1 - sqrt(1 - (t * t)) }

    static let circularEaseOut = TimingFunction.Name { t in sqrt((2 - t) * t) }

    static let circularEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            return 0.5 * (1 - sqrt(1 - 4 * (t * t)))
        }else {
            return 0.5 * (sqrt(-((2 * t) - 3) * ((2 * t) - 1)) + 1)
        }
    }

    static let exponentialEaseIn = TimingFunction.Name { t in t == 0.0 ? t : pow(2, 10 * (t - 1)) }

    static let exponentialEaseOut = TimingFunction.Name { t in t == 1.0 ? t : pow(2, -10 * t) }

    static let exponentialEaseInOut = TimingFunction.Name { t in
        if t == 0.0 || t == 1.0 {
            return t
        }
        
        if t < 0.5 {
            return 0.5 * pow(2, 20 * t - 10)
        }else {
            return -0.5 * pow(2, (-20 * t) + 10)  + 1
        }
    }

    static let elasticEaseIn = TimingFunction.Name { t in sin(13 * CGFloat(M_PI_2) * t) * pow(2, 10 * (t - 1)) }
    
    static let elasticEaseOut = TimingFunction.Name { t in sin(-13 * CGFloat(M_PI_2) * (t + 1)) * pow(2, -10 * t) + 1 }

    static let elasticEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            return 0.5 * sin(13 * CGFloat(M_PI_2) * 2 * t) * pow(2, 10 * ((2 * t) - 1))
        }else {
            return 0.5 * (sin(-13 * CGFloat(M_PI_2) * ((2 * t - 1) + 1)) * pow(2, -10 * (2 * t - 1)) + 2)
        }
    }

    static let backEaseIn = TimingFunction.Name { t in
        let foo = t * t * t
        return foo - t * sin(t * CGFloat(M_PI))
    }

    static let backEaseOut = TimingFunction.Name { t in
        let delta = 1 - t
        return 1 - (delta * delta * delta - delta * sin(delta * CGFloat(M_PI)))
    }

    static let backEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            let delta = 2 * t
            return 0.5 * (delta * delta * delta - delta * sin(delta * CGFloat(M_PI)))
        }else {
            let delta = 1 - (2 * t - 1)
            let temp1 = delta * delta * delta
            let temp2 = sin(delta * CGFloat(M_PI))
            return 0.5 * (1 - (temp1 - delta * temp2)) + 0.5
        }
    }

    static let bounceEaseOut = TimingFunction.Name { t in
        if t < 4/11.0 {
            return (121 * t * t)/16.0
        }else if t < 8/11.0 {
            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0
        }else if t < 9/10.0 {
            return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0
        }else {
            return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0
        }
    }

    static let bounceEaseIn = TimingFunction.Name { t in 1 - TimingFunction.Name.bounceEaseOut.function(t) }

    static let bounceEaseInOut = TimingFunction.Name { t in
        if t < 0.5 {
            return 0.5 * TimingFunction.Name.bounceEaseIn.function(t * 2)
        }else {
            return 0.5 * TimingFunction.Name.bounceEaseOut.function(t * 2 - 1) + 0.5
        }
    }

    
    
}
