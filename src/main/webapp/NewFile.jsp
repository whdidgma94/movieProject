<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>영화 목록</title>
</head>
<body>
    <h1>영화 목록</h1>
    <table>
        <thead>
            <tr>	
                <th>영화 제목</th>
                <th>개봉일</th>
                <th>상영 시간</th>
                <th>예매</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="movie : ${movies}">
                <td><a th:href="@{/movies/{id}(id=${movie.id})}" th:text="${movie.title}"></a></td>
                <td th:text="${movie.releaseDate}"></td>
                <td th:text="${movie.showtimes}"></td>
                <td><a th:href="@{/movies/{id}/schedule}(id=${movie.id})">예매</a></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
