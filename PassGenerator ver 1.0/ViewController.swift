//
//  ViewController.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/7/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TestCode().populateReceivedData(inputValue)
    }

    override func viewDidAppear(animated: Bool) {
        TestCode().pressGeneratePassButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generatePassButtonPressed(type: EntrantType) {
        visitor = Visitor(type: type, title: entrantType.rawValue)
        
        TestCode().printInputValues()
        TestCode().printVisitor(visitor)
        TestCode().printButtonType()
      let requiredInfo = InformationManagement().requiredInfo(visitor)
        do {
            if try InformationManagement().dataValidation(visitor, requiredInfo: requiredInfo) {
                PassGenerator().generatePass(visitor, requiredInfo: requiredInfo, passInfo: passInformation)
                
                TestCode().pressAccessButton(buttonType)
            }
        } catch InformationManagement.InfoError.firstName {
            print(InformationManagement.InfoError.firstName.rawValue)
        } catch InformationManagement.InfoError.lastName {
            print(InformationManagement.InfoError.lastName.rawValue)
        } catch InformationManagement.InfoError.streetAddress {
            print(InformationManagement.InfoError.streetAddress.rawValue)
        } catch InformationManagement.InfoError.city {
            print(InformationManagement.InfoError.city.rawValue)
        } catch InformationManagement.InfoError.state {
            print(InformationManagement.InfoError.state.rawValue)
        } catch InformationManagement.InfoError.zipCode {
            print(InformationManagement.InfoError.zipCode.rawValue)
        } catch InformationManagement.InfoError.socialSecurityNumber {
            print(InformationManagement.InfoError.socialSecurityNumber.rawValue)
        } catch InformationManagement.InfoError.dateOfBirth {
            print(InformationManagement.InfoError.dateOfBirth.rawValue)
        } catch InformationManagement.InfoError.managementTier {
            print(InformationManagement.InfoError.managementTier.rawValue)
        } catch InformationManagement.InfoError.childNotUnder5YearsOld {
            print(InformationManagement.InfoError.childNotUnder5YearsOld.rawValue)
        } catch {
            print(InformationManagement.InfoError.unkown.rawValue)
        }

        
        
        
    }
    
    func accessButtonPressed(buttonType: AccessType) {
        SwipeManagement.sharedInstance.swipeToAccess(buttonType, visitor: visitor)
    
    
    }


}

