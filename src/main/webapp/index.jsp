<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
    <title>Tic-Tac-Toe</title>
</head>
<body>
<h1>Tic-Tac-Toe</h1>

<c:if test="${empty sessionScope}">
    <div class="container">
        <div class="center">
            <button onclick="window.location='${pageContext.request.contextPath}/start'" id="start-button">
                Start playing
            </button>
        </div>
    </div>
</c:if>


<c:if test="${not empty sessionScope}">
    <table>
        <tr>
            <td onclick="window.location='/logic?click=0'" class="click">${sessionScope.data.get(0).sign}</td>
            <td onclick="window.location='/logic?click=1'" class="click">${sessionScope.data.get(1).sign}</td>
            <td onclick="window.location='/logic?click=2'" class="click">${sessionScope.data.get(2).sign}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=3'" class="click">${sessionScope.data.get(3).sign}</td>
            <td onclick="window.location='/logic?click=4'" class="click">${sessionScope.data.get(4).sign}</td>
            <td onclick="window.location='/logic?click=5'" class="click">${sessionScope.data.get(5).sign}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=6'" class="click">${sessionScope.data.get(6).sign}</td>
            <td onclick="window.location='/logic?click=7'" class="click">${sessionScope.data.get(7).sign}</td>
            <td onclick="window.location='/logic?click=8'" class="click">${sessionScope.data.get(8).sign}</td>
        </tr>
    </table>

    <hr>
</c:if>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:if test="${sessionScope.winner == CROSSES}">
    <h1>CROSSES WIN!</h1>
</c:if>
<c:if test="${sessionScope.winner == NOUGHTS}">
    <h1>NOUGHTS WIN!</h1>
</c:if>
<c:if test="${not empty sessionScope.draw}">
    <h1>IT'S A DRAW</h1>
</c:if>

<c:if test="${sessionScope.draw or sessionScope.winner == NOUGHTS or sessionScope.winner == CROSSES}">
    <script>
        function removeEventsWhenGameWasEnded($el) {
            $el.unbind();
            $el.removeAttr('onclick');
            $el.children().each(function () {
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