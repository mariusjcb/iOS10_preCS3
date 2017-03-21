class NrPrim {
    private var _value: Int?
    var value: Int? {
        get {
            return self._value
        }
        set(newValue) {
            self._value = newValue
        }
    }
    
    enum CheckErrors {
        case numberIsNil
        case negativeValue
        case zeroValue
        case outOfRange
    }
    
    func check(withClosure completionHandler: (Bool?, CheckErrors?) -> Void) {
        if self._value != nil {
            
            switch self._value! {
            case let x where x == 0: return completionHandler(nil, .zeroValue)
            case let x where x < 0: return completionHandler(nil, .negativeValue)
            case let x where x <= 1: return completionHandler(false, nil)
            case let x where x <= 3: return completionHandler(true, nil)
            case let x where x > 1000000: return completionHandler(nil, .outOfRange)
            default: break
            }
            
            for i in 2...(self._value!/2) {
                if self._value! % i == 0 {
                    return completionHandler(false, nil)
                }
            }
            
            return completionHandler(true, nil)
        }
        
        return completionHandler(nil, .numberIsNil)
    }
}

class VerificarePrim: NrPrim {
    var delegate: VerificarePrimDelegate?
    
    private var _status: Bool?
    var status: Bool? {
        return self._status
    }
    
    private var _statusMesssage: String?
    var statusMessage: String? {
        return self._statusMesssage
    }
    
    struct StatusMessages {
        static let negativeValue = "Numar NEGATIV"
        static let isNotNumber = "Nu este numar"
        static let isPrime = "Numar PRIM"
        static let isNotPrime = "Numar NEPRIM"
        static let isZero = "Ai introdus ZERO"
        static let isBigNumber = "Numar PREA MARE"
    }
    
    override var value: Int? {
        get {
            return super.value
        }
        set(newValue) {
            super.value = newValue
            
            self.check() { (status, error) in
                self._status = status
                
                if error != nil {
                    switch error! {
                    case .negativeValue:
                        self._statusMesssage = StatusMessages.negativeValue
                    case .numberIsNil:
                        self._statusMesssage = StatusMessages.isNotNumber
                    case .zeroValue:
                        self._statusMesssage = StatusMessages.isZero
                    case .outOfRange:
                        self._statusMesssage = StatusMessages.isBigNumber
                    }
                } else if status != nil {
                    switch status! {
                    case true:
                        self._statusMesssage = StatusMessages.isPrime
                    case false:
                        self._statusMesssage = StatusMessages.isNotPrime
                    }
                }
            }
            
            self.delegate?.statusDidChange(self)
        }
    }
}

protocol VerificarePrimDelegate {
    func statusDidChange(_ sender: VerificarePrim)
}
