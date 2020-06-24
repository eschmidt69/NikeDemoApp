//
//  AppUtility.swift
//  NikeDemo
//
//  Created by Eric Schmidt on 6/22/20.
//  Copyright © 2020 FourFourTime, LLC. All rights reserved.
//

import UIKit

open class AppUtility: NSObject {
    
    // Some Constraint helpers
    func processVCConstraint(_ controller: UIViewController, _ uiView: UIView, top: CGFloat, bottom: CGFloat, right: CGFloat, left: CGFloat ) {
        let safeArea = controller.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: top),
            uiView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: bottom),
            uiView.rightAnchor.constraint(equalTo: controller.view.rightAnchor, constant: right),
            uiView.leftAnchor.constraint(equalTo: controller.view.leftAnchor, constant: left)
        ])
    }

    func processViewConstraint(_ uiView: UIView, top: CGFloat, bottom: CGFloat, right: CGFloat, left: CGFloat ) {
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: uiView.topAnchor, constant: top),
            uiView.rightAnchor.constraint(equalTo: uiView.rightAnchor, constant: bottom),
            uiView.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: right),
            uiView.bottomAnchor.constraint(equalTo: uiView.bottomAnchor, constant: left)
        ])
    }

    func processImageContraint(_ uiView: UIView, top: CGFloat, bottom: CGFloat, right: CGFloat) {
        let safeArea = uiView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: top),
            uiView.rightAnchor.constraint(equalTo: uiView.rightAnchor, constant: bottom),
            uiView.leftAnchor.constraint(equalTo: uiView.leftAnchor, constant: right),
            uiView.heightAnchor.constraint(equalTo: uiView.widthAnchor, multiplier: 1.0)
        ])
    }
    
    // Model Loader. This will send back a message with the problem based on these Decoding Errors
    func loadAlbumData(_ data: Data, completion: (AlbumFeed?, String?) -> ()) {
        let decoder = JSONDecoder()
        do {
            let dataModel = try decoder.decode(AlbumFeed.self, from: data)
            completion(dataModel, nil)
        } catch let DecodingError.dataCorrupted(context) {
            completion(nil, "Data Corrupted \(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            completion(nil,"Key \(key) not found: \(context.debugDescription)")
        } catch let DecodingError.valueNotFound(value, context) {
            completion(nil,"Value \(value) not found: \(context.debugDescription)")
        } catch let DecodingError.typeMismatch(type, context)  {
            completion(nil, "Type \(type) mismatch: \(context.debugDescription)")
        } catch {
            completion(nil, "error: \(error)")
        }
    }
    
    // Just a small orientation manager to help with the DetailView not being on a TableView.
    // MARK: I could have put the detail on a ScrollView, but stayed clear as a TableView is just a ScrollView so I just locked the rotation.
    func setOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    func setOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        self.setOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
    
}
