//
//  ViewControllerReactor.swift
//  LearnReactorKit
//
//  Created by Manh Pham on 11/30/21.
//

import ReactorKit

final class ViewControllerReactor: Reactor {
    
    // represent user action
    enum Action {
        case minus
        case plus
    }
    
    // control event
    enum Mutation {
        case didMinus
        case didPlus
    }
    
    // represent state
    struct State {
        var value: Int
    }
    
    let initialState: State = State(value: 0)
    
    // doing side effect here like call api
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .minus:
            return .just(Mutation.didMinus)
        case .plus:
            return .just(Mutation.didPlus)
        }
    }
    
    // only set state do not perform any side effect
    func reduce(state: State, mutation: Mutation) -> State {
        switch mutation {
        case .didMinus:
            var old = state.value
            old -= 1
            return State(value: old)
        case .didPlus:
            var old = state.value
            old += 1
            return State(value: old)
        }
    }
}
