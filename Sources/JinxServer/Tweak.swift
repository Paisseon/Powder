import mryipc

final class JinxServer: NSObject {
    private var center: MRYIPCCenter = .init(named: "lilliana.jinx.ipc")
    static let shared: JinxServer = .init()
    
    private override init() {
        super.init()
        center.addTarget(self, action: #selector(preferences(for:)))
    }
    
    @objc func preferences(
        for _domain: String
    ) -> [String: Any] {
        let domain: CFString = _domain as CFString
        
        guard let keyList: CFArray = CFPreferencesCopyKeyList(domain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost) else {
            return [:]
        }
        
        return CFPreferencesCopyMultiple(
            keyList,
            domain,
            kCFPreferencesCurrentUser,
            kCFPreferencesAnyHost
        ) as NSDictionary as! [String: Any]
    }
}

var server: JinxServer?

@_cdecl("jinx_entry")
func jinx_entry() {
    server = JinxServer.shared
}
