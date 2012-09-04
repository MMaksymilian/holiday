package flex.common.service {
import flex.common.data.ServiceUser;

public interface SecurityService  {
         function getCurrentUser( handler:Function, errHandler:Function = null):void;
    }
}