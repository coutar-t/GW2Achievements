// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum AchievementDetailViewController: StoryboardType {
    internal static let storyboardName = "AchievementDetailViewController"

    internal static let achievementDetailViewController = SceneType<GW2Achievements.AchievementDetailViewController>(storyboard: AchievementDetailViewController.self, identifier: "AchievementDetailViewController")
  }
  internal enum AchievementsListViewController: StoryboardType {
    internal static let storyboardName = "AchievementsListViewController"

    internal static let achievementsListViewController = SceneType<GW2Achievements.AchievementsListViewController>(storyboard: AchievementsListViewController.self, identifier: "AchievementsListViewController")
  }
  internal enum CategoriesGroupsListViewController: StoryboardType {
    internal static let storyboardName = "CategoriesGroupsListViewController"

    internal static let categoriesGroupsListViewController = SceneType<GW2Achievements.CategoriesGroupsListViewController>(storyboard: CategoriesGroupsListViewController.self, identifier: "CategoriesGroupsListViewController")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

private final class BundleToken {}
