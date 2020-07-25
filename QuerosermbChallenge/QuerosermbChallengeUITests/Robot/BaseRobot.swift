//
//  BaseRobot.swift
//  QuerosermbChallengeUITests
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit
import KIF

@testable import QuerosermbChallenge

class BaseRobot {
    
    var controllerSpec: BaseTest!
    var tester: KIFUITestActor { return controllerSpec.tester }

    init(controllerSpec: BaseTest) {
        self.controllerSpec = controllerSpec
    }
    
}
