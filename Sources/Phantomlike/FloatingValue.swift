//
//  FloatingValue.swift
//  Phantomlike
//
//  Created by Adam Nemecek on 11/29/17.
//  Copyright © 2017 Adam Nemecek. All rights reserved.
//

public struct FloatingValue<Storage: BinaryFloatingPoint, Unit> : BinaryFloatingPoint, CustomStringConvertible {
    public typealias IntegerLiteralType = Storage.IntegerLiteralType
    public typealias Exponent = Storage.Exponent
    public typealias FloatLiteralType = Storage.FloatLiteralType

    public typealias Magnitude = Storage.Magnitude
    public typealias Stride = Storage.Stride
    public typealias RawSignificand = Storage.RawSignificand
    public typealias RawExponent = Storage.RawExponent

    private var content: Storage

    public init(_ value: UInt8) {
        content = .init(value)
    }

    public init(_ value: Int8) {
        content = .init(value)
    }

    public init(_ value: UInt16) {
        content = .init(value)
    }

    public init(_ value: Int16) {
        content = .init(value)
    }

    public init(_ value: UInt32) {
        content = .init(value)
    }

    public init(_ value: Int32) {
        content = .init(value)
    }

    public init(_ value: UInt64) {
        content = .init(value)
    }

    public init(_ value: Int64) {
        content = .init(value)
    }

    public init(_ value: UInt) {
        content = .init(value)
    }

    public init(_ value: Int) {
        content = .init(value)
    }

    public init(_ value: Float) {
        content = .init(value)
    }

    public init(_ value: Double) {
        content = .init(value)
    }

    public init(_ value: Float80) {
        content = .init(value)
    }

    public init(floatLiteral value: FloatLiteralType) {
        content = .init(floatLiteral: value)
    }

    public init?<T: BinaryInteger>(exactly source: T) {
        guard let content = Storage(exactly: source) else { return nil }
        self.content = content
    }

    public init(sign: FloatingPointSign,
                exponentBitPattern: RawExponent,
                significandBitPattern: RawSignificand) {
        content = Storage(sign: sign,
                          exponentBitPattern: exponentBitPattern,
                          significandBitPattern: significandBitPattern)
    }

    public init(integerLiteral value: IntegerLiteralType) {
        content = .init(integerLiteral: value)
    }

    public init(sign: FloatingPointSign, exponent: Exponent, significand: FloatingValue) {
        content = Storage(sign: sign,
                          exponent: exponent,
                          significand: significand.content)
    }

    public static func +(lhs: FloatingValue, rhs: FloatingValue) -> FloatingValue {
        return .init(content: lhs.content + rhs.content)
    }

    public static func +=(lhs: inout FloatingValue, rhs: FloatingValue) {
        lhs = lhs + rhs
    }

    public static func -(lhs: FloatingValue, rhs: FloatingValue) -> FloatingValue {
        return .init(content: lhs.content - rhs.content)
    }

    public static func -=(lhs: inout FloatingValue, rhs: FloatingValue) {
        lhs = lhs - rhs
    }

    public static func *(lhs: FloatingValue, rhs: FloatingValue) -> FloatingValue {
        return .init(content: lhs.content * rhs.content)
    }

    public static func *=(lhs: inout FloatingValue, rhs: FloatingValue) {
        lhs = lhs * rhs
    }

    public static func /(lhs: FloatingValue, rhs: FloatingValue) -> FloatingValue {
        return .init(content: lhs.content / rhs.content)
    }

    public static func /=(lhs: inout FloatingValue, rhs: FloatingValue) {
        lhs = lhs / rhs
    }

    public mutating func round(_ rule: FloatingPointRoundingRule) {
        content.round(rule)
    }

    public static var nan: FloatingValue {
        return .init(content: .nan)
    }

    public static var signalingNaN: FloatingValue {
        return .init(content: .signalingNaN)
    }

    public static var infinity: FloatingValue {
        return .init(content: .infinity)
    }

    public static var greatestFiniteMagnitude: FloatingValue {
        return .init(content: .greatestFiniteMagnitude)
    }

    public static var pi: FloatingValue {
        return .init(content: .pi)
    }

    public var ulp: FloatingValue {
        return .init(content: content.ulp)
    }

    public static var leastNormalMagnitude: FloatingValue {
        return .init(content: .leastNormalMagnitude)
    }

    public static var leastNonzeroMagnitude: FloatingValue {
        return .init(content: .leastNonzeroMagnitude)
    }

    public var sign: FloatingPointSign {
        return content.sign
    }

    public var description: String {
        return "FloatingValue(\(content), unit: \(Unit.self))"
    }

    public var exponent: Exponent {
        return content.exponent
    }

    public var significand: FloatingValue {
        return .init(content: content.significand)
    }

    public mutating func formRemainder(dividingBy other: FloatingValue) {
        content.formRemainder(dividingBy: other.content)
    }

    public mutating func formTruncatingRemainder(dividingBy other: FloatingValue) {
        content.formTruncatingRemainder(dividingBy: other.content)
    }

    public mutating func formSquareRoot() {
        content.formSquareRoot()
    }

    public mutating func addProduct(_ lhs: FloatingValue, _ rhs: FloatingValue) {
        content.addProduct(lhs.content, rhs.content)
    }

    public var nextUp: FloatingValue {
        return .init(content: content.nextUp)
    }

    public func isEqual(to other: FloatingValue) -> Bool {
        return content.isEqual(to: other.content)
    }

    public func isLess(than other: FloatingValue) -> Bool {
        return content.isLess(than: other.content)
    }

    public func isLessThanOrEqualTo(_ other: FloatingValue) -> Bool {
        return content.isLessThanOrEqualTo(other.content)
    }

    public var isNormal: Bool {
        return content.isNormal
    }

    public var isFinite: Bool {
        return content.isFinite
    }

    public var isZero: Bool {
        return content.isZero
    }

    public var isSubnormal: Bool {
        return content.isSubnormal
    }

    public var isInfinite: Bool {
        return content.isInfinite
    }

    public var isNaN: Bool {
        return content.isNaN
    }

    public var isSignalingNaN: Bool {
        return content.isSignalingNaN
    }

    public var isCanonical: Bool {
        return content.isCanonical
    }

    public var magnitude: Magnitude {
        return content.magnitude
    }

    public static var exponentBitCount: Int {
        return Storage.exponentBitCount
    }

    public static var significandBitCount: Int {
        return Storage.significandBitCount
    }

    public var exponentBitPattern: RawExponent {
        return content.exponentBitPattern
    }

    public var significandBitPattern: RawSignificand {
        return content.significandBitPattern
    }

    public var binade: FloatingValue {
        return .init(content: content.binade)
    }

    public var significandWidth: Int {
        return content.significandWidth
    }

    public func distance(to other: FloatingValue) -> Stride {
        return content.distance(to: other.content)
    }

    public func advanced(by n: Stride) -> FloatingValue {
        return .init(content: content.advanced(by: n))
    }

    public var hashValue: Int {
        return content.hashValue
    }

    private init(content: Storage) {
        self.content = content
    }
}
