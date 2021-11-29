//
//  ViewController.swift
//  LearnReactorKit
//
//  Created by Manh Pham on 11/29/21.
//

import UIKit
import ReactorKit
import RxCocoa

class ViewController: UIViewController, View {

    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reactor = ViewControllerReactor()
    }
    
    func bind(reactor: ViewControllerReactor) {
        minus.rx.tap.map { Reactor.Action.minus }.bind(to: reactor.action).disposed(by: disposeBag)
        plus.rx.tap.map { Reactor.Action.plus }.bind(to: reactor.action).disposed(by: disposeBag)
        
        reactor.state.map { String($0.value) }.bind(to: label.rx.text).disposed(by: disposeBag)
    }

}

