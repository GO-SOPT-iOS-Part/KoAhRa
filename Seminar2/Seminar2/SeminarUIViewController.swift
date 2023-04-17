//
//  SeminarUIViewController.swift
//  Seminar2
//
//  Created by 고아라 on 2023/04/18.
//


import UIKit

class SeminarUIViewController: UIViewController {
    
    private var view1 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var view2 : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private var view3 : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var view4 : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        setLayout()
    }

}

extension SeminarUIViewController{
    func style(){
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [view1,view2,view3,view4].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        view1.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        view2.snp.makeConstraints {
            $0.top.equalTo(view1.snp.bottom)
            $0.leading.equalTo(view1.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        view3.snp.makeConstraints {
            $0.top.equalTo(view2.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }

        view4.snp.makeConstraints {
            $0.top.equalTo(view3.snp.bottom)
            $0.leading.equalTo(view3.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }


    }
}

