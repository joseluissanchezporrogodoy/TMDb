//: Playground - noun: a place where people can play
import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
//
//
//let single = Observable.just("Hello")
//
//single.subscribe{ event in
//    switch event {
//    case .next(let value):
//        print(value)
//    case .error(let error):
//        print(error)
//    case .completed:
//        print("completed")
//    }
//}
//
//let hello = Observable<String>.create{ observer in
//    observer.onNext("Holita")
//    observer.onCompleted()
//
//    return Disposables.create()
//}
//
//hello.subscribe(onNext: { estring in
//    print(estring)
//} ,onCompleted: {
//    print("completado")
//}) {
//    print("dispose")
//}
//
struct Shops: Decodable {
    struct Shop: Decodable {
        let name: String
        //let description_es: String
        //let description_en: String
    }
    let result: [Shop]
}
let session = URLSession(configuration: .default)
let apiURL = URL(string:"http://madrid-shops.com/json_new/getShops.php")!

let shopsList = Observable<Data>.create { observer in
    
    let task = session.dataTask(with: apiURL) { data , _ , error in

        if let error = error {
            observer.onError(error)
        } else {
            observer.onNext(data ?? Data())
            observer.onCompleted()
        }
    }
    
    task.resume()
    
    return Disposables.create {
        print("cancell")
        task.cancel()
    }
}


let decoder = JSONDecoder()

let disposable = shopsList
    //Mapeo al modelo de datos con el pojo de arriba
    .map{ data in
        try decoder.decode(Shops.self, from: data)
    }
    .subscribe(onNext: { shops in
    //Todo ha salido bien y vienen datos
    print(shops)
    
}, onError: { (error) in
    // Cuando hay un error
    print(error)
}, onCompleted: {
    // Una vez completada la secuencia (siempre despues de que vaya bien)
    print("completed")
}) {
    
    print("disposed")
}


// parar la petición
//disposable.dispose()


// Para modelar una API mejor con una funcion
func getShops() -> Observable<Shops> {
    return Observable<Data>.create { observer in
        
        let task = session.dataTask(with: apiURL) { data , _ , error in
            
            if let error = error {
                observer.onError(error)
            } else {
                observer.onNext(data ?? Data())
                observer.onCompleted()
            }
        }
        
        task.resume()
        
        return Disposables.create {
            print("cancell")
            task.cancel()
        }
        } .map{ data in
            try decoder.decode(Shops.self, from: data)
    }
}


let disposableFunc = getShops()
    .subscribe(onNext: { shops in
        print("-------------------------LLAMADA POR FUNCION------------------------------------")
        print(shops)
    }, onError: { error in
        print(error)
        
    })




















