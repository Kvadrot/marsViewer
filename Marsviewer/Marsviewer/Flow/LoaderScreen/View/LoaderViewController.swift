//
//  LoaderViewController.swift
//  Marsviewer
//
//  Created by Plate on 29.08.2024.
//

import Lottie
import UIKit

class LoaderViewController: UIViewController {

    // MARK: - Properties
    private let viewModel: Launchable
    
    lazy var lottieView = {
        let animationView = LottieAnimationView(name: "loaderAnimation_dots")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.play()

        return animationView
    }()
    
    // MARK: - Outlets
    @IBOutlet weak var roundedView: UIView!
    
    //MARK: - Init
    init(viewModel: Launchable)
    {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        prepareViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Prepare Views
    
    func prepareViews() {
        prepareRoundedView()
        prepareTempNavigation()
    }
    
    func prepareRoundedView() {
        roundedView.layer.cornerRadius = 30
        roundedView.layer.masksToBounds = false
        roundedView.layer.shadowColor = UIColor.black.cgColor
        roundedView.layer.shadowOpacity = 0.1
        roundedView.layer.shadowRadius = 8
        roundedView.layer.shadowOffset = CGSize(width: 2, height: 4)
        roundedView.layer.shadowPath = UIBezierPath(roundedRect: roundedView.bounds, cornerRadius: 30).cgPath
    }

    //MARK: Navigations
    func prepareTempNavigation() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        roundedView.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {

        
//        navigationController?.pushViewController(nextVC, animated: true)
        print("Tap gesture recognized!")
    }

}

//MARK: SetUP Constraints

extension LoaderViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            lottieView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),
            lottieView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lottieView.widthAnchor.constraint(equalToConstant: 111),
            lottieView.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
}
