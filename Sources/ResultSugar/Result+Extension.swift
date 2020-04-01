import Foundation
/**
 * - Note: You can now do: .success instead of .success(()) When using Result<Void, MicAndVideoAccessError>
 * - Note: ref this discussion: https://stackoverflow.com/questions/45837915/generic-swift-4-enum-with-void-associated-type
 */
extension Result where Success == Void {
   public static var success: Result {
      .success(())
   }
}
/**
 * Error
 */
extension Result {
   /**
    * - Note: Sometimes you just want to do print($0.errorStr)
    */
   public var errorStr: String {
      guard let error: Error = self.error() else { return "success" }
      return error.localizedDescription
   }
   /**
    * - Note: Sometimes you just want to do print($0.error)
    */
   public func error<T>() -> T? where T: Error {
      guard case .failure(let error) = self else { return nil }
      return error as? T
   }
   /**
    * - Note: When you need non-optional return
    */
   public func getError() -> Error {
       guard case .failure(let error) = self else { return NSError(domain: "Generic error", code: 0) }
       return error
   }
}
/**
 * Value
 */
extension Result {
   /**
    * - Note: Skip the optional try call and go directly for the value
    * ## Examples
    * guard let imageAndURL: (UIImage, URL) = $0.value else { return }
    * imageAndURL.image // UIImage
    * imageAndURL.url // URL
    */
   public func value<Success>() -> Success? {
      try? self.get() as? Success
   }
}
/**
 * Error Extension
 */
extension NSError {
   /**
    * Convenient error method
    * ## Examples:
    * onComplete(.failure(NSError("UhOh")))
    */
   public convenience init(_ message: String) {
      self.init(domain: message, code: 0)
   }
}
//extension Error {
//   /**
//    * Convenient error method
//    * ## Examples:
//    * onComplete(.failure(.error("UhOh")))
//    */
//   public static func error(_ message: String) -> NSError {
//      return NSError(domain: message, code: 0)
//   }
//}
extension Result {
   /**
    * Simple way to assert if the call was a success or not:
    * ## Examples:
    * onComplete { print("\(0$.isSuccess ? "✅" : "🚫")") } // ✅ or 🚫
    */
   public var isSuccess: Bool {
      if case .success(_) = self { return true }
      else { return false }
   }
}
