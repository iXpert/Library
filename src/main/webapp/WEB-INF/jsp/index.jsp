<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>LMS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">LMS</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">All Books</a></li>
            <li><a href="newBook">New Book</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <c:choose>
        <c:when test="${mode == 'BOOK_VIEW'}"> <!-- display the table only when mode is set to BOOK_VIEW-->
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Purchase Date</th>
                    <th>Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${allBooks}">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.bookName}</td>
                        <td>${book.author}</td>
                        <td>${book.purchaseDate}</td>
                        <td><a href="updateBook?id=${book.id}"/><div class="glyphicon glyphicon-pencil"></div> </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>

        <c:when test="${mode == 'BOOK_EDIT' || mode == 'BOOK_NEW'}"> <!-- display the edit form when mode is set to BOOK_EDIT or BOOK_NEW -->
            <form action="save" method="post">
                <input type="hidden" class="form-control" value="${book.id}" name="id" id="id">
                <div class="form-group">
                    <label for="bookName">Book Name:</label>
                    <input type="text" class="form-control" id="bookName" name="bookName" value="${book.bookName}">
                </div>
                <div class="form-group">
                    <label for="author">Author:</label>
                    <input type="text" class="form-control" id="author" name="author" value="${book.author}">
                </div>
                <div class="form-group">
                    <label for="purchaseDate">Purchase Date:</label>
                    <input type="date" name="purchaseDate" id="purchaseDate" class="form-control" placeholder="dd-mm-yyyy" value="${book.purchaseDate}">
                </div>

                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </c:when>

    </c:choose>


</div>

</body>
</html>
