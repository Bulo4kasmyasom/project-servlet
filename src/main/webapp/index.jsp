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
            <div id="game-rules">
                <p>
                    <b>Крестики-нолики</b> — логическая игра между двумя противниками на квадратном поле 3 на 3 клетки
                    или
                    большего размера (вплоть до «бесконечного поля»). Один из игроков играет «крестиками»,
                    второй — «ноликами».
                </p>
                <p>
                <h4> Исторические корни</h4>
                Крестики-нолики – знакомая каждому с детства игра, имеет древнюю историю. Никто точно не знает,
                где зародилось такое увлечение. Например, в римских поселениях II-III века н.э. были найдены
                доски, которые, возможно, предназначались для игры в крестики-нолики. Аналоги крестиков-ноликов
                есть в культурных традициях разных народов – известно, что подобной забавой развлекались древние
                викинги и даже отважные флибустьеры. В каждой стране игра имеет своё непереводное название, к
                примеру, в США её называют Tic-tac-toe. Кстати, в дореволюционной России, до орфографической
                реформы 1918 года эта игра называлась херики-оники, по названию букв алфавита: х – «херъ», о – «оно».
                </p>
                <p>
                <h4>Правила игры</h4>
                Игроки по очереди ставят на свободные клетки поля 3×3 знаки (один всегда крестики, другой
                всегда нолики). Первый, выстроивший в ряд 3 своих фигуры по вертикали, горизонтали или диагонали,
                выигрывает.
                </p>
            </div>
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