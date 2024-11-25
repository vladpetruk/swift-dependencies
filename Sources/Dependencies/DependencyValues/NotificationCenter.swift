import Foundation

private enum NotificationCenterKey: DependencyKey {
  static let liveValue = NotificationCenter.default
  static var testValue: NotificationCenter {
    NotificationCenter()
    // NotificationCenter.default
  }
}

extension DependencyValues {
  public var notificationCenter: NotificationCenter {
    get { self[NotificationCenterKey.self] }
    set { self[NotificationCenterKey.self] = newValue }
  }
}
