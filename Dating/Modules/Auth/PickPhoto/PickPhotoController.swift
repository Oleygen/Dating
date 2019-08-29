//
//  PickPhotoController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit
import Photos
class PickPhotoController: BaseController<PickPhotoView, PickPhotoModel>, PickPhotoInputHandler, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     var onContinueTap: (() -> Void)?
    
    var imagePicker : UIImagePickerController?
    
    override func viewDidLoad() {
        self.shouldShowBackButton = true
        super.viewDidLoad()
        
        self.baseView.addPhotoButton.addTarget(self, action: #selector(didClickAddPhotoButton), for: .touchUpInside)
        self.baseView.continueButton.addTarget(self, action: #selector(didClickContinueButton), for: .touchUpInside)
    }
    
    @objc func didClickAddPhotoButton() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.showPhotoPicAlert(cameraHandler: {
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)

        }) {
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)

        }
        
        
    }
    
    @objc func didClickContinueButton() {
        self.onContinueTap?()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage //1
        self.baseView.setImage(image: chosenImage)
        self.baseView.hideAddButton()
        dismiss(animated:true, completion: nil)
    }
}
