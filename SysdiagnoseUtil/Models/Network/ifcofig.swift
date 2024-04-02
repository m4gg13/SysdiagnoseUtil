//
//  ifcofig.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/31/24.
//

import Foundation

/// `sysdiagnose_xxxx.xx.xx/network-info/ifconfig.txt`
class ifconfig: Describable {

    override var description: String { "not sure what to put here yet" }

    enum NetworkInterfaceType {
        case physical
        case virtualNetwork
        case virtualBridge
    }

    class NetworkInterface: Describable {

        override var description: String { "not sure what to put here either" }

        var type: NetworkInterfaceType = .physical
    }

    var en0: NetworkInterface?
    var lo: NetworkInterface?
}
