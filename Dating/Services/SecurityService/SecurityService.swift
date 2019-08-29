//
//  RSAGenerator.swift
//  loc
//
//  Created by oleygen ua on 2/1/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import SwiftyRSA

/// SecurityService is a class that responsible for creating RSA keys, encyption/decryption, siging, verification, etc.

class SecurityService {
    
    public func encrypt(message: ClearMessage, with key: PublicKey) throws -> EncryptedMessage {
        return try message.encrypted(with: key, padding: .PKCS1)
    }
    
    public func decrypt(message: EncryptedMessage, with key: PrivateKey) throws -> ClearMessage {
        return try message.decrypted(with: key, padding: .PKCS1)
    }
    
    public func createKeyPair(sizeInBits: Int) throws -> (privateKey: PrivateKey, publicKey: PublicKey) {
        return try SwiftyRSA.generateRSAKeyPair(sizeInBits: sizeInBits)
    }

    public func sign(message: ClearMessage, with key: PrivateKey) throws -> Signature {
        return try message.signed(with: key, digestType: .sha256)
    }
    
    public func verify(message: ClearMessage, signature: Signature, with key: PublicKey) throws -> Bool {
        return try message.verify(with: key, signature: signature, digestType: .sha256)
    }
}
