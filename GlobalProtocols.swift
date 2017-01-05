//
//  GlobalProtocols.swift
//  CalcLite
//
//  Created by adminaccount on 1/4/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import Foundation
import UIKit

protocol InputInterface {
    var buttonDidPress: ((_ operation: String)->())? {get set}
}

protocol OutputInterface {
    func outputResult(info: String)
}

enum BinaryOperation: String {
    case Plus = "+"
    case Minus = "-"
    case Mul = "*"
    case Div = "/"
    case Pow = "^"
}

enum UtilityOperation: String {
    case Dot = "."
    case Equal = "="
}

enum UnaryOperation: String {
    case Sign = "±"
    case Cos = "cos"
    case Sqrt = "√"
    case Sin = "sin"
    case Tg = "tg"
    case Ctg = "ctg"
    case Pers = "%"
    case Log = "log"
}

enum ConstantValues: String {
    case Pi = "π"
    case Exp = "e"
}

protocol CalcBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?) -> ())? {get set}
}
