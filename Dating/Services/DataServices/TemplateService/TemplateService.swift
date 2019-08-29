//
//  TemplateService.swift
//  loc
//
//  Created by Oleynik Gennady on 20/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift


class TemplateService {
    static func saveOrUpdateTemplates(templates: Array<Template>) throws {
        try templates.forEach { template in
            try TemplateService.saveOrUpdateTemplate(template: template)
        }
    }
    
    static func saveOrUpdateTemplate(template: Template) throws {
        let realm = try Realm()
        
        guard let templateId = template.templateId.value else {
//            throw ApplicationError.noTemplateId
//            if no templateId - considering that there is no template
            return
        }
        
        if let localTemplate = realm.objects(Template.self).filter("templateId == %@", templateId).first {
            try TemplateService.updateTemplate(local: localTemplate, incoming: template)
        } else {
            try TemplateService.saveTemplate(template: template)
        }
    }
    
    static func saveTemplate(template: Template) throws {
        let realm = try Realm()
        try realm.write {
            realm.add(template)
        }
    }
    
    static func updateTemplate(local: Template, incoming: Template) throws {
        let realm = try Realm()
        try realm.write {
            local.parentId.value = incoming.parentId.value
            local.baseText = incoming.baseText
            local.templateTitle = incoming.templateTitle
            local.creationDate = incoming.creationDate
            local.isActive = incoming.isActive
            local.validityConditionList.removeAll()
            local.validityConditionList.append(objectsIn: incoming.validityConditionList)
        }
    }
    
    
}
