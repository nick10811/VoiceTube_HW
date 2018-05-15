//
//  DBManager.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/15.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation

class DBManager{
    private static var instance: DBManager?
    static func sharedInstance() -> DBManager {
        if instance == nil {
            instance = DBManager()
            instance?.crateDBTable()
        }
        return instance!
    }
    
    func dbConnection() -> FMDatabase? {
        let fileURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("test.sqlite")
        
        let database = FMDatabase(url: fileURL)
        
        guard database.open() else {
            print("Unable to open database")
            return nil
        }
        return database
    }
    
    func crateDBTable() {
        let db = self.dbConnection()
        do {
            let sql = "CREATE TABLE IF NOT EXISTS Video (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, imgURL TEXT)"
            try db?.executeUpdate(sql, values: nil)
            
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        db?.close()
    }
    
    func batchInsertVideo(modelArray: [VideoModel]) {
        let db = self.dbConnection()
        do {
            for model in modelArray {
                try db?.executeUpdate("INSERT INTO Video (title, imgURL) values (?, ?)", values: [model.title, model.img])
            }
            
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        db?.close()
    }
    
    func getVideo() -> [VideoModel] {
        var videoArray = [VideoModel]()
        let db = self.dbConnection()
        guard db != nil else {
            return videoArray
        }
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM Video", values: nil)
            while rs.next() {
                if let title = rs.string(forColumn: "title"), let imgURL = rs.string(forColumn: "imgURL") {
                    let newModel = VideoModel()
                    newModel.title = title
                    newModel.img = imgURL
                    videoArray.append(newModel)
                }
            }
            
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        db?.close()
        return videoArray
    }
    
    func resetVideo() {
        let db = self.dbConnection()
        do {
            try db?.executeUpdate("DELETE * FROM Video", values: nil)
            
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        db?.close()
    }
}
