
//Basic idea is: in hospital exists call handler, who handles incoming calls, assesses situation and sending message to someone, who can perform CPR, if it's needed.
protocol AdvancedLifeSupport {
func performCPR()
}

class EmergencyCallHandler {
    
    var delegate: AdvancedLifeSupport?
    
    // Added just for compleetness of descrption
    func assessSituation() {
        print("Can you tell me what happened?")
        }

    //Asks delegate to perform CPR
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {

    // Tells to handler that Paramedic are able to perform CPR allow to many objects be delegate
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    //Describing protocol function
    func performCPR() {
        print("Paramedic does chest compressions, 30 per minute.")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("Doctor does chest compressions, 30 per minute.")
    }
    
    func useStathescope() {
        print("Listening for heart sounds")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill(){
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
