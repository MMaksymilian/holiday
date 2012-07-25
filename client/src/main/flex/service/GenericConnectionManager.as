package flex.service {
//import mx.controls.Alert;
//import mx.messaging.Channel;
//import mx.messaging.ChannelSet;
//import mx.messaging.channels.AMFChannel;
//import mx.messaging.channels.SecureAMFChannel;
//import mx.messaging.messages.ErrorMessage;
//import mx.resources.ResourceManager;
//import mx.rpc.events.FaultEvent;
//import mx.rpc.remoting.mxml.RemoteObject;

public class GenericConnectionManager {

//    public var remoteService:RemoteObject = new RemoteObject;
//
//    private const secureConnection:Boolean = false;
//
//    private static const AMFCONFIG_XML_LOCATION:String = "config/AMFConfig.xml";
//
//    public function GenericConnectionManager() {
//    }
//
//    public function initFromXML(initData:XML):void {
//
//        var cs:ChannelSet = new ChannelSet();
//
//        var myAMF:Channel = null;
//
//        var initData:XML;
//
////        try {
////            var xmlService:XmlService = XmlService.absoluteGET(AMFCONFIG_XML_LOCATION);     //, onMockFormData
//////            xmlService.addEventListener("fault", onEmptyMockData);
////            xmlService.send();
////        } catch (e:*) {
//////            Alert.show(e.toString(), ResourceManager.getInstance().getString("common","BLAD"));
////        }
//
//        //TODO zobacz XmlService w dbPozycji
//
//        var config:* = initData.remoteConfig;
//        if (config == undefined) {
//            throw new Error("no remote config in xml");
//        }
//        var _uri:String = initData.remoteConfig.uri;
//
//        if (secureConnection) {
//            myAMF = new SecureAMFChannel("secure-my-amf", _uri);
//        } else {
//
//            myAMF = new AMFChannel("my-amf", _uri);
//        }
//
//        cs.addChannel(myAMF);
//        remoteService.channelSet = cs;
//
//        remoteService.showBusyCursor = true;
//    }
//
//    protected function handler_generalFault(fault:FaultEvent):void {
//        trace(fault);
//        var er:ErrorMessage = (fault.message as ErrorMessage);
//
//        try {
//            if (er.hasOwnProperty("rootCause")) {
//                Alert.show(er.faultString, ResourceManager.getInstance().getString("common", "BLAD_Serwer") + " " + er.rootCause.header);
//            } else {
//                Alert.show(er.faultString, ResourceManager.getInstance().getString("common", "BLAD"));
//            }
//        } catch (e:Error) {
//            Alert.show(er.faultString, ResourceManager.getInstance().getString("common", "BLAD_Klient"));
//        }
//    }


}
}