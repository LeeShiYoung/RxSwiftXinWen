//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `Titles.plist`.
    static let titlesPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "Titles", pathExtension: "plist")
    
    /// `bundle.url(forResource: "Titles", withExtension: "plist")`
    static func titlesPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.titlesPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `example`.
    static let example = Rswift.ImageResource(bundle: R.hostingBundle, name: "example")
    
    /// `UIImage(named: "example", bundle: ..., traitCollection: ...)`
    static func example(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.example, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    /// Nib `AuthorView`.
    static let authorView = _R.nib._AuthorView()
    /// Nib `ContentTitleView`.
    static let contentTitleView = _R.nib._ContentTitleView()
    /// Nib `PageTitleCollectionViewCell`.
    static let pageTitleCollectionViewCell = _R.nib._PageTitleCollectionViewCell()
    
    /// `UINib(name: "AuthorView", in: bundle)`
    static func authorView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.authorView)
    }
    
    /// `UINib(name: "ContentTitleView", in: bundle)`
    static func contentTitleView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.contentTitleView)
    }
    
    /// `UINib(name: "PageTitleCollectionViewCell", in: bundle)`
    static func pageTitleCollectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.pageTitleCollectionViewCell)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 5 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `ContentImgTableViewCell`.
    static let contentImgTableViewCell: Rswift.ReuseIdentifier<ContentImgTableViewCell> = Rswift.ReuseIdentifier(identifier: "ContentImgTableViewCell")
    /// Reuse identifier `ContentTextTableViewCell`.
    static let contentTextTableViewCell: Rswift.ReuseIdentifier<ContentTextTableViewCell> = Rswift.ReuseIdentifier(identifier: "ContentTextTableViewCell")
    /// Reuse identifier `MorePicTableViewCell`.
    static let morePicTableViewCell: Rswift.ReuseIdentifier<MorePicTableViewCell> = Rswift.ReuseIdentifier(identifier: "MorePicTableViewCell")
    /// Reuse identifier `PageTitleCollectionViewCell`.
    static let pageTitleCollectionViewCell: Rswift.ReuseIdentifier<PageTitleCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "PageTitleCollectionViewCell")
    /// Reuse identifier `SinglePicTableViewCell`.
    static let singlePicTableViewCell: Rswift.ReuseIdentifier<SinglePicTableViewCell> = Rswift.ReuseIdentifier(identifier: "SinglePicTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `NewsViewController`, and contains static references to 1 segues.
    struct newsViewController {
      /// Segue identifier `newsToContent`.
      static let newsToContent: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, NewsViewController, ContentViewController> = Rswift.StoryboardSegueIdentifier(identifier: "newsToContent")
      
      /// Optionally returns a typed version of segue `newsToContent`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func newsToContent(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, NewsViewController, ContentViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.newsViewController.newsToContent, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `Guide`.
    static let guide = _R.storyboard.guide()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "Guide", bundle: ...)`
    static func guide(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.guide)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    struct _AuthorView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "AuthorView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _ContentTitleView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "ContentTitleView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> ContentTitleView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ContentTitleView
      }
      
      fileprivate init() {}
    }
    
    struct _PageTitleCollectionViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = PageTitleCollectionViewCell
      
      let bundle = R.hostingBundle
      let identifier = "PageTitleCollectionViewCell"
      let name = "PageTitleCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> PageTitleCollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PageTitleCollectionViewCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct guide: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "Guide"
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = BaseNavigationController
      
      let bundle = R.hostingBundle
      let name = "Main"
      let newsViewController = StoryboardViewControllerResource<NewsViewController>(identifier: "NewsViewController")
      
      func newsViewController(_: Void = ()) -> NewsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: newsViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.main().newsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'newsViewController' could not be loaded from storyboard 'Main' as 'NewsViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
