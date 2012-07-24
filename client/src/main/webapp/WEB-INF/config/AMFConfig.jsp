<%@ page contentType="text/xml; charset=UTF-8" language="java"  %>
<%
   String serverName = request.getServerName();
   String serverPort = ""+request.getServerPort();
//   String protocol = request.getScheme();
%>
<root>
    <remoteConfig>
        <uri>http://{server.name}:{server.port}/server-1.0-SNAPSHOT/flex/messagebroker/amf</uri>
    </remoteConfig>
    <%--<queueConfig>--%>
        <%--<uri><%=protocol%>://<%=serverName%>:<%=serverPort%>/fxposition-services/messagebroker/amfpolling</uri>--%>
    <%--</queueConfig>--%>
</root>