import Foundation

extension String {
    func distance2(from: String.Index, to: String.Index) -> Int {
        abs(from.utf16Offset(in: self) - to.utf16Offset(in: self))
    }
}
