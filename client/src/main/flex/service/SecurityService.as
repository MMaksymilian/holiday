package flex.service {
import flex.data.ServiceUser;

public interface SecurityService  {
         function getCurrentUser( handler:Function, errHandler:Function = null):void;
    }
}