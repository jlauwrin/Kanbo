//
//  OnboardingViewController.swift
//  Kanbo
//
//  Created by Jason Lauwrin on 26/04/22.
//

import UIKit

class OnboardingViewController: UIViewController{
    
    
    
    @IBOutlet weak var collectionOnboarding: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    var slides: [OnboardingSlide]=[]
    
    var currPage=0{
        didSet{
            pageController.currentPage = currPage
//            if currPage == slides.count-1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Work Together\nCollab with your friend", image: #imageLiteral(resourceName: "Slide 4.png")),
            OnboardingSlide(title: "Start to manage your work in here", image: #imageLiteral(resourceName: "Slide 4.png")),
            OnboardingSlide(title: "Test", image: #imageLiteral(resourceName: "Slide 4.png"))
        ]
        
//        pageController.numberOfPages = slides.count
        
    }
    
    @IBAction func startBtnClicked(_ sender: Any) {
        
    }
}

extension OnboardingViewController:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionCell.identifier, for: indexPath) as! OnboardingCollectionCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currPage = Int(scrollView.contentOffset.x/width)
    }
    
}

