<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <link href="/static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
    <title>Tic-Tac-Toe</title>
</head>
<body>
<h1>Tic-Tac-Toe</h1>

<table>
    <tr>
        <td onclick="window.location='/logic?click=0'" class="click">${data.get(0).getSign()}</td>
        <td onclick="window.location='/logic?click=1'" class="click">${data.get(1).getSign()}</td>
        <td onclick="window.location='/logic?click=2'" class="click">${data.get(2).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'" class="click">${data.get(3).getSign()}</td>
        <td onclick="window.location='/logic?click=4'" class="click">${data.get(4).getSign()}</td>
        <td onclick="window.location='/logic?click=5'" class="click">${data.get(5).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'" class="click">${data.get(6).getSign()}</td>
        <td onclick="window.location='/logic?click=7'" class="click">${data.get(7).getSign()}</td>
        <td onclick="window.location='/logic?click=8'" class="click">${data.get(8).getSign()}</td>
    </tr>
</table>

<hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:if test="${winner == CROSSES}">
    <h1>CROSSES WIN!</h1>
</c:if>
<c:if test="${winner == NOUGHTS}">
    <h1>NOUGHTS WIN!</h1>
</c:if>
<c:if test="${draw}">
    <h1>IT'S A DRAW</h1>
</c:if>

<c:if test="${draw or winner == NOUGHTS or winner == CROSSES}">
    <script>
        function removeEventsWhenGameWasEnded($jElement) {
            $jElement.unbind();
            $jElement.removeAttr('onclick');
            $jElement.children().each(function () {
                removeEventsWhenGameWasEnded($(this));
            });
        }

        function restart() {
            $.ajax({
                url: '/restart',
                type: 'POST',
                contentType: 'application/json;charset=UTF-8',
                async: false,
                success: function () {
                    location.reload();
                }
            });
        }

        removeEventsWhenGameWasEnded($('.click'))
    </script>
<div class="container">
    <div class="center">
    <button onclick="restart()">Start again</button>
    </div>
</div>
</c:if>
</body>
</html>