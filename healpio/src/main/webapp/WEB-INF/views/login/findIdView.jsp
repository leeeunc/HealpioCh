<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    
</head>
<body>

    <div id="login_container">
        <div class="text-center">
            <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
            <p class="mb-4">이메일을 입력해주세요.</p>
        </div>
        <form class="user" action="/login/findId" method="post">
            <div class="form-group">
                <input type="email" class="form-control form-control-user"
                       id="email" aria-describedby="emailHelp" name="email"
                       placeholder="이메일을 입력하세요" required>
            </div>
            <button type="submit" class="btn btn-primary btn-user btn-block">
                Find ID
            </button>
        </form>
        <hr>
        <a href="/login/login" class="btn btn-facebook btn-user btn-block">
            Login
        </a>
        <hr>
        
    </div>

</body>
</html>
