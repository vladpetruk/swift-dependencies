#if canImport(Testing)
import Combine
import Dependencies
import Foundation
import Testing

@Suite
struct NotificationCenterTests {
  @Dependency(\.notificationCenter) var notificationCenter
  var cancellables: Set<AnyCancellable> = []
  let notificationName = Notification.Name("Hello")

  @Test
  mutating func concurrent1() async throws {
    nonisolated(unsafe) var count = 0
    notificationCenter
      .publisher(for: notificationName)
      .sink { _ in count += 1 }
      .store(in: &cancellables)

    for _ in 1...100 {
      notificationCenter.post(name: notificationName, object: nil)
      try await Task.sleep(for: .milliseconds(1))
    }
    #expect(count == 100)
  }

  @Test
  mutating func concurrent2() async throws {
    nonisolated(unsafe) var count = 0
    notificationCenter
      .publisher(for: notificationName)
      .sink { _ in count += 1 }
      .store(in: &cancellables)

    for _ in 1...100 {
      notificationCenter.post(name: notificationName, object: nil)
      try await Task.sleep(for: .milliseconds(1))
    }
    #expect(count == 100)
  }

  @Test
  mutating func concurrent3() async throws {
    nonisolated(unsafe) var count = 0
    notificationCenter
      .publisher(for: notificationName)
      .sink { _ in count += 1 }
      .store(in: &cancellables)

    for _ in 1...100 {
      notificationCenter.post(name: notificationName, object: nil)
      try await Task.sleep(for: .milliseconds(1))
    }
    #expect(count == 100)
  }
}

#endif
