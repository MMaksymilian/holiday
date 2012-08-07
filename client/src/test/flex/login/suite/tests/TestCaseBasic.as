package flex.login.suite.tests {
import flex.login.Main;

import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

import mx.rpc.http.HTTPService;

import org.flexunit.Assert;
import org.hamcrest.assertThat;
import org.hamcrest.date.dateAfter;

public class TestCaseBasic {

    public function TestCaseBasic() {

    }

    public static var main:Main;

    [BeforeClass]
    public static function beforeClass():void {
       main = new Main();
    }

    //fajnie by było gdyby to działało, ale trzeba by dodać properties'y
    [Test(description="sprawdzenie czy łączy się z serwisem")]
    public function testMethod():void {
        var params:Object = new Object();
        var service:HTTPService = new HTTPService();
        service.url = "http://user-komputer:8081/server-1.0-SNAPSHOT/j_spring_security_check";
        service.addEventListener( ResultEvent.RESULT, resultHandler );
        service.addEventListener( FaultEvent.FAULT, faultHandler );
        params.j_username = "dupa";
        params.j_password = "szef";
        assertThat(new Date(), dateAfter(new Date(1920, 1, 1)));
        service.send(params);
    }

    private function resultHandler(event:ResultEvent):void  {

    }

    private function faultHandler(event:FaultEvent):void {
        Assert.fail("Nie udało się połączyć z adresem.");
    }
}
}