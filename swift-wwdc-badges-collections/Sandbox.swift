//  Sandbox.swift

import Foundation

/**

* Write your code here!

*/

let roomAssignmentsDict = ["Anita Borg" :	 201,
                        "Alan Kay":	 202,
                        "Ada Lovelace":	 203,
                        "Aaron Swartz":	215,
                        "Alan Turing":	204,
                        "Michael Faraday":	205,
                        "Grace Hopper":	 230]
let roomCapacityDict = [201:40,
                        202:50,
                        203:70,
                        204:20,
                        215:30,
                        230:80,
                        240:35,
                        260:60]


func badgeForSpeaker(name:String)->String {
    return "Hello, my name is \(name)."
}

func badgesForSpeakers(speakers:[String])->[String] {
    var greetingsArray:[String] = Array()
    for speaker in speakers {
        greetingsArray += [badgeForSpeaker(speaker)]
    }
    return greetingsArray
}



func roomAssignmentsForSpeakers(speakers:[String])->[String] {
    var roomAssignmentsArray:[String] = Array()
    for speaker in speakers {
        guard let assignedRoom = roomAssignmentsDict[speaker]
            else {roomAssignmentsArray += ["\(speaker) has not been assigned to a room."];
                continue}
        
        roomAssignmentsArray += ["\(speaker) will be speaking in Room \(assignedRoom)."]
    }
    return roomAssignmentsArray
}


///Takes no arguments and returns a [(String)speakers:(Int)capacity].
func getRoomCapacitiesForAllSpeakers()->[String:Int] {
    var roomCapacityBySpeakerDict = [String:Int]()
    
    for speaker in roomAssignmentsDict.keys {
        if let roomNum = roomAssignmentsDict[speaker] {
            roomCapacityBySpeakerDict[speaker] = roomCapacityDict[roomNum]
        }
    }
    
    return roomCapacityBySpeakerDict
}


///Takes one [String] argument and returns [String] an array of strings like so: 
///   <speaker> can speak to up to <capacity> people.
func audienceSizesForSpeakers(speakers:[String])->[String] {
    var resultsArray = [String]()
    
    let roomCapacityBySpeakerDict = getRoomCapacitiesForAllSpeakers()
    var capacity = 0
    for speaker in speakers {
        if let capacity = roomCapacityBySpeakerDict[speaker] {
            resultsArray += ["\(speaker) can speak to up to \(capacity) people."]
        }
        else {
            resultsArray += ["Room information not found for \(speaker)."]
        }
    }
    return resultsArray
}


//However, there are two speakers with problematic room assignments: one without a room assignment at all, and one with an invalid room assignment. Rely on optionals to detect these speakers and generate messages for them that you can give to your production manager that read:
//
//Room information not found for <speaker>.













