import XCTest
import ResultSugar

class ResultSugarTests: XCTestCase {
   func testExample() {
//      XCTAssertEqual("Hello, World!", "Hello, World!")
      ResultSugarTests.assert(flag: true) { result in
         guard let msg: String = result.value() else { Swift.print("\(result.errorStr)"); XCTFail("\(result.errorStr)"); return }
         Swift.print("✅")
         XCTAssertEqual(msg, "Works 👌")
      }
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
extension ResultSugarTests {
   typealias OnComplete = (Result<String, Error>) -> Void
   /**
    * Test
    */
   static func assert(flag: Bool, complete: OnComplete) {
      if flag {
         complete(.success("Works 👌"))
      } else {
         complete(.failure(NSError("Doen't work 🚫")))
      }
   }
}
