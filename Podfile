# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'GW2Achievements.xcworkspace'

target 'GW2Achievements' do
  project 'GW2Achievements'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GW2 Achievements

  pod 'SwiftLint'
  pod 'SwiftGen'
  pod 'Sourcery'
  pod 'Kingfisher'
end

abstract_target 'Tests' do
  platform :ios, '11.0'

  pod 'Nimble'

  target 'GW2AchievementsTests' do
    project 'GW2Achievements.xcodeproj'
  end

  target 'GW2AchievementsBusinessLogicTests' do
    project 'GW2AchievementsBusinessLogic.xcodeproj'
  end
end
