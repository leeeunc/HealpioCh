$.ajax({
    url: '/reservation/confirm',  // 요청을 보낼 서버의 URL
    type: 'POST',            // HTTP 메서드 (GET, POST 등)
    dataType: 'json',       // 서버에서 받을 데이터의 타입
    success: function(response){
        // 응답을 콘솔에 출력합니다
        console.log(response);
        try {
            // 응답을 JSON으로 파싱하려고 시도합니다
            var data = JSON.parse(response);
            console.log("날짜: " + data.date);
            console.log("시간: " + data.time);
        } catch (error) {
            // JSON 파싱이 실패하면 오류를 출력합니다
            console.error("JSON 파싱 오류:", error);
        }
    },
    error: function(jqXHR, textStatus, errorThrown) {
        // HTTP 요청이 실패하면 오류를 출력합니다
        console.error("Ajax request failed: " + textStatus + ", " + errorThrown);
    }
});
