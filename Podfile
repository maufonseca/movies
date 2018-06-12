# Uncomment the next line to define a global platform for your project
platform :ios, '11.4'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'Movies' do
  # Using Swift and want to use dynamic frameworks
  use_frameworks!

  # Pods for Movies
  pod 'Alamofire', '~> 4.7'
  pod 'AlamofireImage'
  pod 'RealmSwift'
  target 'MoviesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MoviesUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
