//
//  HomePagerSlideViewController.swift
//  ott
//
//  Created by dpsmac1 on 02-05-18.
//  Copyright © 2018 Digitalproserver. All rights reserved.
//

import UIKit
import AlamofireImage
import BmoViewPager

protocol HomePagerSlideDelegate {
    func didSelectHighlight(_ highlight: Media)
}

class HomePagerSlideViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: HomePagerSlideDelegate?
    
    // MARK: - Media
    var media: Media? {
        didSet {
            guard let media = media else {
                slideTitle = nil
                slideImageUrl = nil
                return
            }
            
            slideImageUrl = media.landscapeImage.smallestNonNull
            slideTitle = media.name
        }
    }
    
    // MARK: - ¡¡Title
    private var slideTitle: String? = "" {
        didSet {
            DispatchQueue.main.async {
                self.titleLabel.text = self.slideTitle
            }
        }
    }
    
    // MARK: Image
    private var slideImageUrl: String? = "" {
        didSet {
            guard let slideImageUrl = slideImageUrl, let url = URL(string: slideImageUrl) else {
                DispatchQueue.main.async {
                    self.imageView.af_cancelImageRequest()
                    self.imageView.image = nil
                }
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.af_cancelImageRequest()
                self.imageView.af_setImage(withURL: url)
            }
        }
    }
    
    // MARK: - Gesture recognizer
    private var gestureRecognizer: UITapGestureRecognizer? {
        didSet {
            if let old = oldValue {
                view.removeGestureRecognizer(old)
            }
            
            if let recognizer = gestureRecognizer {
                recognizer.numberOfTapsRequired = 1
                recognizer.numberOfTouchesRequired = 1
                recognizer.addTarget(self, action: #selector(didSelectSlide(_:)))
                
                view.addGestureRecognizer(recognizer)
            }
        }
    }
    
    @objc func didSelectSlide(_ sender: UITapGestureRecognizer? = nil) {
        guard let media = media else {
            print("Selected a slide without media info.")
            return
        }
        
        delegate?.didSelectHighlight(media)
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gestureRecognizer = UITapGestureRecognizer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        gestureRecognizer = nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
