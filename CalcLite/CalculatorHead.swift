//
//  CalculatorHead.swift
//  CalcLite
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//


import Foundation

enum binaryOperation: String {
    case Plus = "+"
    case Minus = "-"
    case Mul = "*"
    case Div = "/"
    case Pow = "^"
}

enum utilityOperation: String {
    case Dot = "."
    case Equal = "="
}

enum unaryOperation: String {
    case Sign = "±"
    case Cos = "cos"
    case Sqrt = "√"
    case Sin = "sin"
    case Tg = "tg"
    case Ctg = "ctg"
    case Pers = "%"
    case Log = "log"
}

enum constantValues: String {
    case Pi = "π"
    case Exp = "e"
}

protocol CalcBrainInterface {
    func digit(value: Double)
    func binary(operation: binaryOperation)
    func unary(operation: unaryOperation)
    func utility(operation: utilityOperation)
    var result: ((Double?, Error?) -> ())? {get set}
}

class CalculatorHead: CalcBrainInterface
{
    
    var accumulatorValue: Double?
    var temp: String? = nil
    
    func digit(value: Double) {
        accumulatorValue = value
    }
    
    var result: ((Double?, Error?)->())? = nil
    
    func utility(operation: utilityOperation) {
        
        if let operationSymbol = operations[operation.rawValue] {
            switch operationSymbol {
            case .Equals:
                executePendingBinaryOperation()
                result?(accumulatorValue, nil)
            default:
                break
            }
        }
    }
    
    func unary(operation: unaryOperation) {
        if let operationSymbol = operations[operation.rawValue] {
            switch operationSymbol {
            case .UnaryOperation(let function):
                accumulatorValue = function(accumulatorValue!)
                result?(accumulatorValue, nil)
            default:
                break
            }
        }
    }
    
    func binary(operation: binaryOperation) {
        if let operationSymbol = operations[operation.rawValue] {
            switch operationSymbol {
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, fistOperand: accumulatorValue!)
            default:
                break
            }
        }
    }
    
    func constants(operation: constantValues) {
        if let operationSymbol = operations[operation.rawValue] {
            switch operationSymbol {
            case .Constant(let value):
                accumulatorValue = value
                result?(accumulatorValue, nil)
            default:
                break
            }
        }
    }
    
    
    func perform0peration(symbol: String) {
        if binaryOperation(rawValue: symbol) != nil {
            let possibleBinary = binaryOperation(rawValue: symbol)
            self.binary(operation: possibleBinary!)
            
        } else if unaryOperation(rawValue: symbol) != nil {
            let possibleUnary = unaryOperation(rawValue: symbol)
            self.unary(operation: possibleUnary!)
            
        } else if utilityOperation(rawValue: symbol) != nil {
            let possibleUtility = utilityOperation(rawValue: symbol)
            self.utility(operation: possibleUtility!)
        } else if constantValues(rawValue: symbol) != nil {
            let possibleConstant = constantValues(rawValue: symbol)
            self.constants(operation: possibleConstant!)
        }
        
    }
    
    func clear() {
        accumulatorValue = 0.0
    }
    
    
    
    
    
    //////////////////////////////////////////////
    
    
    private var operations: Dictionary <String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        
        "±" : Operation.UnaryOperation({ -$0}),
        "%" : Operation.UnaryOperation({$0 / 100}),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "sin": Operation.UnaryOperation(sin),
        "tg" : Operation.UnaryOperation(tan),
        "ctg": Operation.UnaryOperation({1 / tan($0)}),
        "log": Operation.UnaryOperation(log2),
        
        "*": Operation.BinaryOperation({ $0 * $1 }),
        "/": Operation.BinaryOperation({ $0 / $1 }),
        "+": Operation.BinaryOperation({ $0 + $1 }),
        "-": Operation.BinaryOperation({ $0 - $1 }),
        "^": Operation.BinaryOperation({pow($0, $1)}),
        "=": Operation.Equals
    ]
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    private func executePendingBinaryOperation()
    {
        if pending != nil {
            accumulatorValue = pending!.binaryFunction(pending!.fistOperand, accumulatorValue!)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo{
        var binaryFunction: (Double, Double) -> Double
        var fistOperand: Double
    }
}








