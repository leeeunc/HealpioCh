    // API 요청을 보내서 JSON 데이터 가져오기
	fetch('/api/reservation/getReservationInfo?reservationNo=yourReservationNo')
    .then(response => response.json())
    .then(data => {
        // 가져온 데이터를 HTML에 삽입
        document.getElementById('reservationDate').textContent = data.reservation_date;
        document.getElementById('reservationTime').textContent = data.reservation_time;
        document.getElementById('classNo').textContent = data.class_no;
        document.getElementById('maxCount').textContent = data.reservation_maxcount; // 수정
    })
    .catch(error => console.error('Error fetching data:', error));
