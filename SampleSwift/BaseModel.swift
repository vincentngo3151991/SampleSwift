//
//  BaseModel.swift
//  SampleSwift
//
//  Created by Thunderiven on 8/28/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import ObjectMapper
class BaseModel: NSObject, Mappable {
    required init?(map: Map) {}
    
    func mapping(map : Map) {}
    
    func save() {
        type(of: self).saveModel(model: self)
    }
    
    class func loadModel() -> Self? {
        return loadWithType(mappableType: self)
    }
    
    class func delete() {
        let fileName = self.getStoragePath()
        let fileManager = FileManager.default
        if (fileManager.fileExists(atPath: fileName)) {
            do {
                try fileManager.removeItem(atPath: fileName)
            } catch let error as NSError {
                debugPrint(error)
            }
        }
    }
    
    //MARK: private
    private class func getStoragePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0].appending(self.classForCoder().description())
    }
    
    private class func loadWithType<T:BaseModel>(mappableType: T.Type) -> T? {
        let fileName = self.getStoragePath()
        let fileManager = FileManager.default
        if (fileManager.fileExists(atPath: fileName)) {
            do {
                let readFile = try String(contentsOfFile: fileName, encoding: String.Encoding.utf8)
                return Mapper<T>().map(JSONString: readFile)
            } catch let error as NSError {
                debugPrint(error)
            }
        }
        return nil
    }
    
    private class func saveModel(model : Mappable) {
        let jsonString = model.toJSONString()
        let fileName = self.getStoragePath()
        do {
            try jsonString?.write(toFile: fileName, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            debugPrint("Could not save model")
        }
    }
}
