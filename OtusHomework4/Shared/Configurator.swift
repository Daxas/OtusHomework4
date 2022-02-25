//
//  Configurator.swift
//  OtusHomework4
//
//  Created by allme on 25.02.2022.
//

class Configurator {
    static let shared = Configurator()
    let serviceLocator = ServiceLocator()
    
    func setup() {
        registerServices()
    }
    
   private func registerServices() {
       serviceLocator.addService(service: NetworkService())
    }
}

