package test.primaris.service {

    import mx.rpc.events.ResultEvent;
    import mx.rpc.remoting.mxml.RemoteObject;

    public class ServiceUserFlexService {

        public function ServiceUserFlexService() {
            var ro:RemoteObject = new RemoteObject("serviceUserServiceImpl");
            ro.testMethod();
            ro.addEventListener(ResultEvent.RESULT, updateSearch);
        }

        /**
         * Updates search.
         */
        private function updateSearch(event:ResultEvent):void {
//            var psml:PersonSearchModelLocator = PersonSearchModelLocator.getInstance();

//            psml.personData.source = (event.result as ArrayCollection).source;
        }
    }
}