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
            else {roomAssignmentsArray += ["\(speaker) has not been assigned to a room."]; continue}
        
        roomAssignmentsArray += ["\(speaker) will be speaking in Room \(roomAssignmentsDict[speaker])."]
    }
    return roomAssignmentsArray
}

