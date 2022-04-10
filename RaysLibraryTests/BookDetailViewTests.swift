/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
import SwiftUI
import SnapshotTesting
@testable import RaysLibrary

let subpixelThreshold: UInt8 = 0

class BookDetailViewTests: XCTestCase {
  let sampleBook = DataProvider.bookList[0]

  // swiftlint:disable:next implicitly_unwrapped_optional
  var viewController: UIViewController!

  override func setUpWithError() throws {
    try super.setUpWithError()
    let bookDetailView = BookDetailView(book: sampleBook)
    viewController = UIHostingController(rootView: bookDetailView)
  }

  override func tearDownWithError() throws {
    try super.tearDownWithError()
    viewController = nil
  }

  func testBookDetailViewOniPhone() throws {
    assertSnapshot(matching: viewController, as: .image(on: .iPhoneX, subpixelThreshold: subpixelThreshold))
  }

  func testBookDetailViewOniPhoneLandscape() throws {
    assertSnapshot(
      matching: viewController,
      as: .image(on: .iPhoneX(.landscape), subpixelThreshold: subpixelThreshold))
  }

  func testBookDetailViewOniPadPortrait() throws {
    assertSnapshot(
      matching: viewController,
      as: .image(on: .iPadPro11(.portrait), subpixelThreshold: subpixelThreshold))
  }

  func testBookDetailViewOniPhoneDarkMode() throws {
    let traitDarkMode = UITraitCollection(
      userInterfaceStyle: UIUserInterfaceStyle.dark)
    assertSnapshot(
      matching: viewController,
      as: .image(on: .iPhoneX, subpixelThreshold: subpixelThreshold, traits: traitDarkMode))
  }
}
