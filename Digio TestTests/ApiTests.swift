import XCTest
import RxSwift
@testable import Digio_Test

class ApiTests: XCTestCase {

    var disposable: DisposeBag = DisposeBag()

    func test_Request_data_spotlight_not_nil() {
        let expectation = self.expectation(description: "Loading")
        APIService().load(resource: HomeUseCase.get).asObservable().subscribe(onNext: { result in
            XCTAssertNotNil(result.spotlight)
            expectation.fulfill()
        }, onError: { _ in
            return XCTAssert(false)
        }).disposed(by: disposable)
        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_Request_data_cash_not_nil() {
        let expectation = self.expectation(description: "Loading")
        APIService().load(resource: HomeUseCase.get).asObservable().subscribe(onNext: { result in
            XCTAssertNotNil(result.cash)
            expectation.fulfill()
        }, onError: { _ in
            return XCTAssert(false)
        }).disposed(by: disposable)
        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_Request_data_products_not_nil() {
        let expectation = self.expectation(description: "Loading")
        APIService().load(resource: HomeUseCase.get).asObservable().subscribe(onNext: { result in
            XCTAssertNotNil(result.products)
            expectation.fulfill()
        }, onError: { _ in
            return XCTAssert(false)
        }).disposed(by: disposable)
        waitForExpectations(timeout: 5, handler: nil)
    }

    override func tearDown() {
        super.tearDown()
    }
}
