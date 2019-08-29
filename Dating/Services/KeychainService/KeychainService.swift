//
//  KeychainService.swift
//  loc
//
//  Created by oleygen ua on 1/25/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import KeychainSwift

extension ApplicationError {
    enum Keychain: Error {
        case setFailure(KeychainStatusCode)
        case getFailure(KeychainStatusCode)
        case deleteFailure(KeychainStatusCode)
        case clearFailure(KeychainStatusCode)
    }
}

extension ApplicationError.Keychain : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .setFailure(let statusCode):
            return "Keychain set value failure: \(statusCode)"
        case .getFailure(let statusCode):
            return "Keychain get value failure: \(statusCode)"
        case .deleteFailure(let statusCode):
            return "Keychain delete value failure: \(statusCode)"
        case .clearFailure(let statusCode):
            return "Keychain clear failure: \(statusCode)"
        }
    }
}
enum KeychainStatusCode {
    case noError //errSecSuccess
    case fullDisk // errSecDskFull, errSecDiskFull
    case ioFailure // errSecIO
    case permissionFailure // errSecWrPerm
    case resultNotAvailable// errSecNotAvailable
    case readOnlyError // errSecReadOnly
    case authenticationFailure // errSecAuthFailed
    case keychainNotExists // errSecNoSuchKeychain
    case keychainNotValid // errSecInvalidKeychain
    case keychainNameDuplication // errSecDuplicateKeychain
    case callbackNameDuplication // errSecDuplicateCallback
    case callbackNotValid // errSecInvalidCallback
    case itemDuplication // errSecDuplicateItem
    case itemCannotBeFound // errSecItemNotFound
    case bufferTooSmall // errSecBufferTooSmall
    case dataTooLarge // errSecDataTooLarge
    case attributeNotExists // errSecNoSuchAttr
    case itemReferenceNotValid // errSecInvalidItemRef
    case searchReferenceNotValid // errSecInvalidSearchRef
    case itemCalssNotExists // errSecNoSuchClass
    case defaultKeychainNotExists // errSecNoDefaultKeychain
    case interractionWithSecurityServerNotAllowed // errSecInteractionNotAllowed
    case attributeReadOnly // errSecReadOnlyAttr
    case versionIncorrect // errSecWrongSecVersion
    case keySizeNotAlloved // errSecKeySizeNotAllowed
    case storageModuleNotAvailable // errSecNoStorageModule
    case certificateModuleNotAvailable // errSecNoCertificateModule
    case policyModuleNotAvailable // errSecNoPolicyModule
    case userInteractionRequired // errSecInteractionRequired
    case dataNotAvailable // errSecDataNotAvailable
    case dataNotModifiable // errSecDataNotModifiable
    case certificateChainCreationFailure // errSecCreateChainFailed
    case preferenceDomainNotValid // errSecInvalidPrefsDomain
    case darkWakeStateUIFailure // errSecInDarkWake The user interface cannot be displayed because the system is in a dark wake state.
    case otherError(error: OSStatus)
    
    init(_ osStatus: OSStatus) {
        switch osStatus {
        case errSecSuccess:
            self = .noError
        case errSecDskFull, errSecDiskFull:
            self = .fullDisk
        case errSecIO:
            self = .ioFailure
        case errSecWrPerm:
            self = .permissionFailure
        case errSecNotAvailable:
            self = .resultNotAvailable
        case errSecReadOnly:
            self = .readOnlyError
        case errSecAuthFailed:
            self = .authenticationFailure
        case errSecNoSuchKeychain:
            self = .keychainNotExists
        case errSecInvalidKeychain:
            self = .keychainNotValid
        case errSecDuplicateKeychain:
            self = .keychainNameDuplication
        case errSecDuplicateCallback:
            self = .callbackNameDuplication
        case errSecInvalidCallback:
            self = .callbackNotValid
        case  errSecDuplicateItem:
            self = .itemDuplication
        case errSecItemNotFound:
            self = .itemCannotBeFound
        case  errSecBufferTooSmall:
            self = .bufferTooSmall
        case errSecDataTooLarge:
            self = .dataTooLarge
        case  errSecNoSuchAttr:
            self = .attributeNotExists
        case errSecInvalidItemRef:
            self = .itemReferenceNotValid
        case errSecInvalidSearchRef:
            self = .searchReferenceNotValid
        case errSecNoSuchClass:
            self = .itemCalssNotExists
        case errSecNoDefaultKeychain:
            self = .defaultKeychainNotExists
        case  errSecInteractionNotAllowed:
            self = .interractionWithSecurityServerNotAllowed
        case  errSecReadOnlyAttr:
            self = .attributeReadOnly
        case  errSecWrongSecVersion:
            self = .versionIncorrect
        case  errSecKeySizeNotAllowed:
            self = .keySizeNotAlloved
        case  errSecNoStorageModule:
            self = .storageModuleNotAvailable
        case  errSecNoCertificateModule:
            self = .certificateModuleNotAvailable
        case errSecNoPolicyModule:
            self = .policyModuleNotAvailable
        case  errSecInteractionRequired:
            self = .userInteractionRequired
        case  errSecDataNotAvailable:
            self = .dataNotAvailable
        case  errSecDataNotModifiable:
            self = .dataNotModifiable
        case errSecCreateChainFailed:
            self = .certificateChainCreationFailure
        case  errSecInvalidPrefsDomain:
            self = .preferenceDomainNotValid
        case  errSecInDarkWake:
            self = .darkWakeStateUIFailure
    
        default:
            self = .otherError(error: osStatus)
        }
    }
    
}

class KeychainService {
    private let keychain: KeychainSwift
    init() {
        self.keychain = KeychainSwift()
        keychain.synchronizable = true
    }
    
    func set(boolValue: Bool, forKey: String) throws {
        
        guard self.keychain.set(boolValue, forKey: forKey) else {
            throw ApplicationError.Keychain.setFailure(lastKeychainStatusCode)
        }
    }
    func set(stringValue: String, forKey: String) throws {
        guard self.keychain.set(stringValue, forKey: forKey) else {
            throw ApplicationError.Keychain.setFailure(lastKeychainStatusCode)
        }
    }
    func set(dataValue: Data, forKey: String) throws {
        guard self.keychain.set(dataValue, forKey: forKey) else {
            throw ApplicationError.Keychain.setFailure(lastKeychainStatusCode)
        }
    }
    
    func getString(forKey: String) throws -> String {
        if let result = self.keychain.get(forKey) {
            return result
        }
        throw ApplicationError.Keychain.getFailure(lastKeychainStatusCode)
    }
    
    func getBool(forKey: String) throws -> Bool {
        if let result = self.keychain.getBool(forKey) {
            return result
        }
        throw ApplicationError.Keychain.getFailure(lastKeychainStatusCode)
    }
    
    func getData(forKey: String) throws -> Data {
        if let result = self.keychain.getData(forKey) {
            return result
        }
        throw ApplicationError.Keychain.getFailure(lastKeychainStatusCode)
    }
    
    func delete(forKey: String) throws {
        guard self.keychain.delete(forKey) else {
            throw ApplicationError.Keychain.deleteFailure(lastKeychainStatusCode)
        }
    }
    
    func clear() throws {
        guard self.keychain.clear() else {
            throw ApplicationError.Keychain.clearFailure(lastKeychainStatusCode)
        }
    }
    
    private var lastKeychainStatusCode: KeychainStatusCode {
        return KeychainStatusCode(self.keychain.lastResultCode)
    }
}
