import XCTest
import LuckyCombine
import Combine


class Tests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
    var subject1: PassthroughSubject<String, Never> = PassthroughSubject()
    
    var subject3: PassthroughSubject<String, Never> = PassthroughSubject()
    
    
    var nane: String = "aaa"
    
    
    override func setUp() {
        super.setUp()
        
        subject1.linkTo(subject: subject3).store(in: &cancellables)
    }
    
    override func tearDown() {
        cancellables.forEach{ $0.cancel() }
        super.tearDown()
    }
    
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    
    func testLink() {
        
        
        
        let ex = expectation(description: "Async")
        let new = "Tom"
        var result = ""
        
        subject3.receive(on: DispatchQueue.main).sink { value in
            result = value
            ex.fulfill()
        }.store(in: &cancellables)
        subject1.send(new)
        
        wait(for: [ex], timeout: 1)
        XCTAssertEqual(result, new, "Value should be \(new)")
    }
    
    
    func testBind() {
        let new = "HanMeiMei"
        subject1.receive(on: DispatchQueue.main).bindTo(object: self, keyPath: \.nane).store(in: &cancellables)
        subject1.send(new)
        let expectation = self.expectation(description: "Wait for 1 seconds")
        // 使用 asyncAfter 在指定时间后 fulfill 这个期望
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        
        // 等待期望被 fulfill，最多等待 5 秒
        wait(for: [expectation], timeout: 3.0)
        
        XCTAssertEqual(new, nane, "nane should be \(new)")
    }
}
