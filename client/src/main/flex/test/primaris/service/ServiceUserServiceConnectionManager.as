package test.primaris.service {

public class ServiceUserSErviceConnectionManager {

    public function ServiceUserSErviceConnectionManager() {
        super();
        remoteService.destination = "serviceUserServiceImpl";
    }

    public function getLatestBranchReport(handler:Function, faultHandler:Function = null):void {
        var rpcCall:AsyncToken;
        rpcCall = remoteService.getUserById(null);
        rpcCall.addResponder(new Responder(handler));
    }
}
}