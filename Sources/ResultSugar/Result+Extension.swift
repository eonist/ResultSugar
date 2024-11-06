import Foundation
/**
 * - Note: You can now do: `.success` instead of `.success(())` When using `Result<Void, MicAndVideoAccessError>`
 * - Note: Ref this discussion: https://stackoverflow.com/questions/45837915/generic-swift-4-enum-with-void-associated-type
 * - Fixme: ⚠️️ add example
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
    * - Fixme: ⚠️️ add example
    */
   public var errorStr: String {
      guard let error: Error = self.error() else { return "success" }
      return error.localizedDescription
   }
   /**
    * - Note: Sometimes you just want to do print($0.error)
    * - Fixme: ⚠️️ add example
    */
   public func error<T>() -> T? where T: Error {
      guard case .failure(let error) = self else { return nil }
      return error as? T
   }
   /**
    * - Note: When you need non-optional return
    * - Fixme: ⚠️️ add example
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
    * - Fixme: ⚠️️ add a more complete example
    * ## Examples
    * guard let imageAndURL: (UIImage, URL) = $0.value else { return }
    * imageAndURL.image // UIImage
    * imageAndURL.url // URL
    */
   public func value<T>() -> T? {
      try? self.get() as? T
   }
}
/**
 * Error Extension
 */
extension NSError {
   /**
    * Convenient error method
    * - Fixme: ⚠️️ Add more complete example
    * ## Examples:
    * onComplete(.failure(NSError("UhOh")))
    */
   public convenience init(_ message: String) {
      self.init(domain: message, code: 0)
   }
}
// extension Error {
//   /**
//    * Convenient error method
//    * ## Examples:
//    * onComplete(.failure(.error("UhOh")))
//    */
//   public static func error(_ message: String) -> NSError {
//      return NSError(domain: message, code: 0)
//   }
// }
extension Result {
   /**
    * Simple way to assert if the call was a success or not:
    * - Fixme: ⚠️️ add mroe complete example
    * ## Examples:
    * onComplete { print("\(0$.isSuccess ? "✅" : "🚫")") } // ✅ or 🚫
    */
   public var isSuccess: Bool {
      if case .success = self { return true } else { return false }
   }
}
// ⚠️️ Generic parameter 'Success' shadows generic parameter from outer scope with the same name; this is an error in Swift 6
//   public func value<Success>() -> Success? {
//      try? self.get() as? Success
//   }
// The warning you're encountering is due to the fact that within your value function, you're using the generic type name Success, which conflicts with the Success type parameter of the Result type itself. This conflict arises because Swift does not allow a generic parameter declared inside a function to shadow a generic parameter declared outside of it (in this case, in the Result type) starting from Swift 5.5 onwards, including Swift 6.
// To resolve this issue, you should rename the generic parameter inside your value function to something else, avoiding the use of Success to prevent the shadowing. Here's how you can modify your code:
// In this revised version, I've changed the generic parameter inside the value function from Success to T. This change ensures that there's no conflict between the generic parameters, thus resolving the warning about shadowing. The as? T cast remains valid since it dynamically casts the result of self.get() to the expected type T, which is now correctly referenced within the function's scope.
