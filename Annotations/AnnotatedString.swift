//
//  AnnotatedString.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

public typealias AnnotatedString<Annotation> = [AnnotationElement<Annotation>]

extension Array {

    public func map<Annotation, T>(
        _ transform: (Annotation) throws -> T
    ) rethrows -> AnnotatedString<T> where Element == AnnotationElement<Annotation> {

        return try map { try $0.map(transform) }
    }

    public func compactMap<Annotation, T>(
        _ transform: (Annotation) throws -> T?
    ) rethrows -> AnnotatedString<T> where Element == AnnotationElement<Annotation> {

        return try map { try $0.compactMap(transform) }
            .clean()
    }

    func clean<Annotation>() -> [Element] where Element == AnnotationElement<Annotation> {
        return merge { previous, current in
            guard case .text(let lhs) = previous, case .text(let rhs) = current else { return nil }
            return .text(lhs + rhs)
        }
    }

}
