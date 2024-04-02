//
//  dig.swift
//  SysdiagnoseUtil
//
//  Created by Maggie Zirnhelt on 3/16/24.
//

import Foundation

/// `sysdiagnose_xxxx.xx.xx/network-info/dig-info.txt`
class dig: Describable {
    var command: String = ""
    var question: Question = .init()
    var answer: Answer = .init()
    var stats: Stats = .init()

    override var description: String { "not sure yet" }

    class Question: Describable {
        override var description: String { "not sure yet" }
    }

    /// https://www.zytrax.com/books/dns/ch15/#answer
    class Answer: Describable {

        override var description: String { "not sure yet" }

        class Header: Describable {

            override var description: String { "not sure yet" }

            var opCode: OpCode = .QUERY
            var status: UInt32 = 0
            var id: UInt32 = 0
            var flags: [Flags] = [.QR, .AA]

            enum OpCode: UInt8, DescribableProtocol {
                
                var description: String { "not sure yet" }

                case QUERY = 0
                case IQUERY = 1
                case STATUS = 2

                static func describe(_ attr: String) -> String {
                    var description: String
                    switch attr.lowercased() {
                    case "query":
                        description = "Standard query"
                    case "iquery":
                        description = "Inverse query. Optional support by DNS"
                    case "status":
                        description = "DNS status request"
                    default:
                        description = "That attribute doesn't have a defined description in the context of Dig."
                    }
                    return description
                }
            }

            enum Flags: DescribableProtocol {

                var description: String { "not sure yet" }

                case QR
                case AA
                case TC
                case RD
                case RA

                static func describe(_ attr: String) -> String {
                    var description: String
                    switch attr.lowercased() {
                    case "qr":
                        description = "Query - Response bit. Set to 0 by the questioner (query) and to 1 in the response (answer)."
                    case "aa":
                        description = "Authoritative Answer. Valid in responses only. Because of aliases multiple owners may exists so the AA bit corresponds to the name which matches the query name, OR the first owner name in the answer section."
                    case "tc":
                        description = "TrunCation - specifies that this message was truncated due to length greater than that permitted on the transmission channel. Set on all truncated messages except the last one."
                    case "rd":
                        description = "Recursion Desired - this bit may be set in a query and is copied into the response if recursion supported by this Name Server. If Recursion is rejected by this Name Server, for example it has been configured as Authoritative Only, the response (answer) does not have this bit set. Recursive query support is optional."
                    case "ra":
                        description = "Recursion Available - this bit is valid in a response (answer) and denotes whether recursive query support is available (1) or not (0) in the name server."
                    default:
                        description = "That attribute doesn't have a defined description in the context of Dig."
                    }
                    return description
                }
            }

            static func describe(_ attr: String) -> String {
                var description: String
                let components = attr.components(separatedBy: ".")
                switch components.first?.lowercased() {
                case "opcode":
                    return OpCode.describe(components.dropFirst().joined(separator: "."))
                case "status":
                    // TODO: what is status?
                    description = "didn't see this one in the doc i looked at..."
                case "flags":
                    return Flags.describe(components.dropFirst().joined(separator: "."))
                case "id":
                    description = "16 bit message ID supplied by the requestion (the questioner) and reflected back unchanged by the responder (answerer). Identifies the transaction."
                default:
                    description = "That attribute doesn't have a defined description in the context of Dig."
                }
                return description
            }
        }
    }

    struct Stats {

    }

    static func describe(_ attr: String) -> String {
        var description: String
        
        let components = attr.components(separatedBy: ".")
        switch components.first?.lowercased() {
        case "command":
            description = ""
        default:
            description = "That attribute doesn't have a defined description in the context of Dig."
        }
        return description
    }
}
