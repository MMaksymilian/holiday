<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <script type="text/javascript" src="../js/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="../js/jquery-swfobject-1-1-1.js"></script>
    <title>Hello chief!</title>
</head>
<body>
    <script type="text/javascript">
        $(function () {
            $('#myFlash').flash( {
                swf: '../admin.swf',
                width: $(window).width() - 50,
                height:'600',
                wmode: 'window',
                allowFullScreen: 'true'
            });
        })
//        screen.width - 50
    </script>

        <div id="myFlash">
            Można dorobić że ładuje się + że się nie załadował
        </div>
<a href="<c:url value="j_spring_security_logout" />" > Logout</a>
</body>
</html>
