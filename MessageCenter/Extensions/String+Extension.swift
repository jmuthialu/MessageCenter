//
//  String+Extension.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import Foundation

extension String {
    
    /**  Source: Stack Overflow https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
     */
    func isValidEmailId() -> Bool {
        let prefix = "^[A-Z0-9a-z._%+-]+" // "john"
        let domain = "@[A-Za-z0-9.-]+" // @gmail
        let org = "\\.[A-Za-z]{2,64}$" //.com
        let regEx = prefix + domain + org
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
}
