//
//  GlobalProtocols.swift
//  CalcLite
//
//  Created by adminaccount on 1/4/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import Foundation
import UIKit

enum BinaryOperation : String{
    case Plus = "+"
    case Minus = "-"
    case Mul = "*"
    case Div = "/"
    case Power = " ̂"
}

enum UtilityOperation : String{
    case RightBracket = ")"
    case LeftBracket = "("
    case Dot = "."
    case Equal = "="
    case Clean = "C"
    case AClean = "AC"
    case MPlus = "M+"
    case MMinus = "M-"
    case MClear = "MC"
    case MRead = "MR"
}

enum UnaryOperation : String{
    case Percent = "%"
    case Sin = "sin"
    case Cos = "cos"
    case Tg = "tg"
    case Sinh = "sinh"
    case Cosh = "cosh"
    case Tgh = "tgh"
    case Ln = "ln"
    case Sqrt = "√"
    case PlusMinus = "+/-"
    case Ctg = "ctg"
    case Log = "log"
    case Ctgh = "ctgh"
    case Fact = "!"
}

protocol CalcBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?) -> ())? {get set}
}

protocol OutputInterface {
    func outputInfo(info: String)
}

protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}

