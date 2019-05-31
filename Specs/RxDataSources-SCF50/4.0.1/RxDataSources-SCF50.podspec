Pod::Spec.new do |s|
  s.name             = "RxDataSources"
  s.version          = "4.0.1"
  s.summary          = "This is a collection of reactive data sources for UITableView and UICollectionView."
  s.description      = <<-DESC
This is a collection of reactive data sources for UITableView and UICollectionView.

It enables creation of animated data sources for table an collection views in just a couple of lines of code.

```swift
let data: Observable<Section> = ...

let dataSource = RxTableViewSectionedAnimatedDataSource<Section>()
dataSource.cellFactory = { (tv, ip, i) in
    let cell = tv.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style:.Default, reuseIdentifier: "Cell")
    cell.textLabel!.text = "\(i)"
    return cell
}

// animated
data
    .bind(to: animatedTableView.rx.items(dataSource: dataSource))
    .disposed(by: disposeBag)

// normal reload
data
    .bind(to: tableView.rx.items(dataSource: dataSource))
    .disposed(by: disposeBag)
```
                        DESC
  s.homepage         = "https://github.com/RxSwiftCommunity/RxDataSources"                      
  s.license          = 'MIT'
  s.author           = { "Krunoslav Zaher" => "krunoslav.zaher@gmail.com" }
  s.source           = { :git => "https://github.com/RxSwiftCommunity/RxDataSources.git", :tag => s.version.to_s }

  s.requires_arc          = true
  s.swift_version    = '5.0'

  s.source_files = 'Sources/RxDataSources/**/*.swift'

=begin
  s.dependency 'Differentiator', '~> 4.0'
  s.dependency 'RxSwift', '~> 5.0'
  s.dependency 'RxCocoa', '~> 5.0'
=end

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

# MARK: - iOS Static Framework

  s.module_name = s.name
  s.name = "#{s.name}-SCF50"

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.default_subspec = 'StaticCocoaFramework'
  s.source = {
    http: "https://dl.bintray.com/roxiemobile/generic/RxDataSources-#{s.version}-SCF50.zip",
    sha256: '0b182d320401d990093e983f89fdf1affb152664cfeb0512f1f31a3d8b44ca73'
  }

  s.source_files = nil

  s.subspec 'StaticCocoaFramework' do |sc|
    sc.preserve_paths = 'RxDataSources.framework/*'
    sc.source_files = 'RxDataSources.framework/Headers/*.h'
    sc.public_header_files = 'RxDataSources.framework/Headers/*.h'
    sc.vendored_frameworks = 'RxDataSources.framework'

    # Dependencies
    sc.dependency 'Differentiator-SCF50', '~> 4.0'
    sc.dependency 'RxSwift', '~> 5.0'
    sc.dependency 'RxCocoa-SCF50', '~> 5.0'
  end
end
