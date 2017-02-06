//
//  AnimationKeyFrameGenerator.swift
//  Pods
//
//  Created by HuangKun on 2017/2/6.
//
//

import Foundation

public protocol KFAnimatable {
    static var zero: Self { get }
    
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: CGFloat) -> Self
    static func *(lhs: Self, rhs: CGFloat) -> Self
}

extension KFAnimatable {
    static func *(lhs: CGFloat, rhs: Self) -> Self {
        return rhs * lhs
    }
    
    static func +=(lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }
}

extension CGFloat: KFAnimatable {
    public static var zero: CGFloat {
        return 0
    }
}

public class KFGenerator<T: KFAnimatable> {
    var generatee: KFGeneratorType<T> = KFGeneratorType<T>()
    public static var `default`: KFGeneratorType<T> {
        return KFGeneratorType<T>()
    }
    
    public func keyFrames() -> [T] {
        return generatee.keyFrames()
    }
}

public class KFGeneratorType<T: KFAnimatable> {
    
    var timingFunc: TimingFunction.Name = .liner
    var count: CGFloat = 60
    var dt: CGFloat {
        return 1 / (count - 1)
    }
    
    var initialValue: T = T.zero
    var threshold: T = T.zero
    
    var t: CGFloat = 0
    
    public func timingFunction(_ f: TimingFunction.Name) -> KFGeneratorType {
        self.timingFunc = f
        return self
    }
    
    public func frameCount(_ c: Int) -> KFGeneratorType {
        self.count = CGFloat(c)
        return self
    }
    
    public func from(_ initial: T, to destination: T) -> KFGenerator<T> {
        self.initialValue = initial
        self.threshold = destination
        self.t = 0
        let generator = KFGenerator<T>()
        generator.generatee = self
        return generator
    }
    
    public func from(_ initial: T, by delta: T) -> KFGenerator<T> {
        return from(initial, to: initial + delta)
    }
    
    func keyFrames() -> [T] {
        var keyFrames = [T]()
        for _ in (0..<Int(count)) {
            let value = initialValue + timingFunc.function(t) * (threshold - initialValue)
            keyFrames.append(value)
            t += dt
        }
        
        return keyFrames
    }
    
}
