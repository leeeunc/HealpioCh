
	let now = new Date(); // 현재 날짜 및 시간
	let selectedDay = null; // 선택된 일자
	let selectedTime = null; // 선택된 시간
	let selectedDate = null; // 선택된 날짜
	// DB에서 받아온 강사가 선택한 요일, 0 = 일요일, 1 = 월요일, ... , 6 = 토요일
	let activeDays = [0, 1, 3, 5]; // 예: 일, 월, 수, 금
//	var activeDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']; // 원하는 요일로 설정
	let buttonStates = {}; // 날짜별 버튼 상태를 저장하는 객체

	// 달력 생성 함수
	function renderCalendar(month, year) {
	    let daysInMonth = new Date(year, month + 1, 0).getDate(); // 선택된 월의 일수
	    let firstDayOfMonth = new Date(year, month, 1).getDay(); // 선택된 월의 첫번째 날짜
	
	    // 달력의 헤더 생성 (월, 년)
	    let calendarHeader = `
	        <tr>
	            <th colspan="7">
	                <span class="nav-arrow" id="prevMonth">&lt;</span>
	                ${year}년 ${month + 1}월
	                <span class="nav-arrow" id="nextMonth">&gt;</span>
	            </th>
	        </tr>
	        <tr>
	            <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
	        </tr>`;
	
	    let calendar = document.querySelector('#calendar'); // 달력 엘리먼트 선택
	    calendar.innerHTML = calendarHeader; // 달력 헤더 설정
	
	    // 첫번째 주 채우기
	    let calendarBody = '<tr>';
	    for(let i = 0; i < 7; i++) {
	        calendarBody += i < firstDayOfMonth ? '<td></td>' : `<td>${i - firstDayOfMonth + 1}</td>`;
	    }
	    calendarBody += '</tr>';
	
	    // 나머지 날짜 채우기
	    for(let i = 8 - firstDayOfMonth; i <= daysInMonth; i += 7) {
	        calendarBody += '<tr>';
	        for(let j = i; j < i + 7 && j <= daysInMonth; j++) {
	            calendarBody += `<td>${j}</td>`;
	        }
	        calendarBody += '</tr>';
	    }

	    calendar.innerHTML += calendarBody; // 달력 바디 설정
	
	    // 각 일자에 이벤트 리스너 추가
//	    document.querySelectorAll('#calendar td').forEach((e, i) => {
//	        if (i < 7 || e.innerText === "") return;
	    // 각 일자에 이벤트 리스너 추가
	    document.querySelectorAll('#calendar td').forEach(e => {
	        if (e.innerText === "") return;
	        let date = new Date(year, month, parseInt(e.innerText)); // 해당 날짜 구하기

	        let dayOfWeek = date.getDay(); // 해당 날짜의 요일 구하기

	        // activeDays 배열에 해당 요일이 없다면 리턴
	        if (!activeDays.includes(dayOfWeek)) return;

	        e.addEventListener('click', () => {
	            if (selectedDay === e) {
	                selectedDay.classList.remove('selected');
	                selectedDay = null;
	                selectedDate = null;
	            } else {
	                if (selectedDay) selectedDay.classList.remove('selected');
	                e.classList.add('selected');
	                selectedDay = e;

	                // 선택된 날짜를 저장
	                // Date.prototype.toISOString()을 사용하면 이 메소드는 항상 UTC(0) 시간대를 사용하여 날짜를 반환합니다.
//	                selectedDate = date.toISOString().split('T')[0]; // YYYY-MM-DD 형태의 문자열로 변환
	                
	                // 선택된 날짜를 저장
	                let dd = String(date.getDate()).padStart(2, '0'); // 일자를 가져와서 문자열로 변환. 숫자가 한 자리일 경우 앞에 0을 붙임.
	                let mm = String(date.getMonth() + 1).padStart(2, '0'); // 월을 가져와서 문자열로 변환. 월은 0부터 시작하므로 1을 더함. 숫자가 한 자리일 경우 앞에 0을 붙임.
	                let yyyy = date.getFullYear(); // 연도를 가져옴.
	                selectedDate = yyyy + '-' + mm + '-' + dd; // 연-월-일 형태의 문자열로 합침.

	                console.log("selectedDate======" + selectedDate); // 결과 출력.

	                // 모든 예약 시간 선택 버튼을 비활성화
	                document.getElementById('time-selection').querySelectorAll('button').forEach(e => {
	                    e.disabled = true;
	                });

	                // 선택된 날짜의 예약 시간 선택 버튼을 활성화
	                if (buttonStates[selectedDate]) {
	                    buttonStates[selectedDate].forEach(time => {
	                        document.getElementById(`time-${time}`).disabled = false;
	                    });
	                }
	            }
	            
	            renderTimeSelection();
	        });
	    });

	 // 이전 달로 이동 버튼에 대한 클릭 이벤트
        document.getElementById('prevMonth').addEventListener('click', () => {
            now.setMonth(now.getMonth() - 1); // 이전 달로 설정
            renderCalendar(now.getMonth(), now.getFullYear()); // 새로운 달력 렌더링
            renderTimeSelection(); // 예약 시간 재설정
            resetSelections(); // 선택된 날짜와 시간 초기화
        });

        // 다음 달로 이동 버튼에 대한 클릭 이벤트
        document.getElementById('nextMonth').addEventListener('click', () => {
            now.setMonth(now.getMonth() + 1); // 다음 달로 설정
            renderCalendar(now.getMonth(), now.getFullYear()); // 새로운 달력 렌더링
            renderTimeSelection(); // 예약 시간 재설정
            resetSelections(); // 선택된 날짜와 시간 초기화
        });
	}
	
	function resetSelections() {
	    if (selectedDay) {
	        selectedDay.classList.remove('selected');
	        selectedDay = null;
	    }
	    if (selectedTime) {
	        selectedTime.classList.remove('selected');
	        selectedTime = null;
	    }
	    document.getElementById('reserve').disabled = true;
	    renderTimeSelection(); // 선택된 날짜와 시간 초기화 후 예약 시간 재설정
	}
        
	// 예약시간버튼 생성 함수
	function renderTimeSelection() {
	    let availableTimes = ['08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00'];
	    let timeSelection = document.getElementById('time-selection');
	    timeSelection.innerHTML = '';

	    // 버튼을 4개씩 묶기 위한 빈 배열 생성
	    let timeButtons = [];

	    for(let i = 6; i <= 23; i++) {
	        let timeButton = document.createElement('button');
	        timeButton.className = 'time-button';
	        timeButton.textContent = i < 10 ? `0${i}:00` : `${i}:00`;
	        
	        console.log("Button text content: " + timeButton.textContent);

	        // 강사가 제공하는 시간에 따라 버튼 활성화/비활성화 처리
	        // 추가적으로, 날짜가 선택되었는지를 확인
	        timeButton.disabled = !(availableTimes.includes(timeButton.textContent) && selectedDay);
//	        timeButton.disabled = !(availableTimes.includes(timeButton.textContent));

	        // 토글 추가 버전이전
//	        timeButton.addEventListener('click', () => {
//	            if(timeButton.disabled) return;
//	            if (selectedTime) selectedTime.classList.remove('selected');
//	            timeButton.classList.add('selected');
//	            selectedTime = timeButton;
//	            document.getElementById('reserve').disabled = false;
//	        });
	        
	        // 토글버전 추가
	        timeButton.addEventListener('click', () => {
	            if(timeButton.disabled) return;
	            
	            if (selectedTime === timeButton) {
	                selectedTime.classList.remove('selected');
	                selectedTime = null;
	                document.getElementById('reserve').disabled = true;
	            } else {
	                if (selectedTime) selectedTime.classList.remove('selected');
	                timeButton.classList.add('selected');
	                selectedTime = timeButton;
	                document.getElementById('reserve').disabled = false;
	            }
	        });
	        

	        timeButtons.push(timeButton); // 배열에 버튼 추가

	        // 배열에 4개의 버튼이 담겼으면 이를 새로운 행(div)에 배치
	        if(timeButtons.length === 4) {
	            let row = document.createElement('div');
	            for(let j = 0; j < 4; j++) {
	                row.appendChild(timeButtons[j]);
	            }
	            timeSelection.appendChild(row);
	            timeButtons = []; // 배열을 초기화하여 다음 행에 버튼을 배치할 준비
	        }
	    }

	    // 마지막 행에 버튼이 4개 미만이라면 dummy 버튼을 추가
	    if(timeButtons.length > 0) {
	        let row = document.createElement('div');
	        for(let i = 0; i < timeButtons.length; i++) {
	            row.appendChild(timeButtons[i]);
	        }
	        while(row.childNodes.length < 4) {
	            let dummyButton = document.createElement('button');
	            dummyButton.style.visibility = 'hidden';
	            row.appendChild(dummyButton);
	        }
	        timeSelection.appendChild(row);
	    }
	}


    // 예약하기 버튼에 대한 이벤트 설정 함수
    function attachReservationListener() {
        // 예약하기 버튼에 클릭 이벤트 추가
        document.getElementById('reserve').addEventListener('click', () => {
            let currentYear = now.getFullYear(); // 현재 연도 가져오기
            let currentMonth = now.getMonth() + 1; // 현재 월 가져오기(JavaScript에서는 월이 0부터 시작하므로 1을 더해준다)
            // 모달에 표시할 텍스트 설정
            document.getElementById('confirmation-text').innerHTML = `예약하시겠습니까? <br> ${currentYear}년 ${currentMonth}월 ${selectedDay.innerText}일 ${selectedTime.innerText}에 예약하시려면 '예'를 클릭하세요.`;
            document.getElementById('modal').style.display = 'block'; // 모달 표시
            // 모달창 배경 보이기
            document.getElementById('myModal').style.display = 'block';
            // 모달창 내용물도 보이기
            document.getElementById('modal-content').style.display = 'block';
        });
    }

    // 모달의 버튼에 대한 이벤트 설정 함수
    function attachModalButtonsListener() {
        // 예약 확인 버튼 클릭 이벤트
        document.getElementById('confirm').addEventListener('click', () => {
            location.href = "/reservation/confirm"; // 실제 예약 완료 페이지의 URL로 변경
        });

        // 예약 취소 버튼 클릭 이벤트
        document.getElementById('cancel').addEventListener('click', () => {
            // 모달창 내용물 숨기기
            document.getElementById('modal-content').style.display = 'none';
            // 모달창 배경도 숨기기
            document.getElementById('myModal').style.display = 'none';
        });
    }

//    // 페이지가 로드되었을 때 실행할 코드
//    window.onload = function() {
//        renderCalendar(now.getMonth(), now.getFullYear()); // 달력 렌더링
//        renderTimeSelection(); // 예약 시간 설정
//        resetSelections(); // 처음 페이지가 로드되었을 때 달력과 시간 선택을 렌더링하고 선택을 초기화합니다.
//        attachReservationListener(); // 예약하기 버튼 이벤트 설정
//        attachModalButtonsListener(); // 모달 버튼 이벤트 설정
//    };
    
    document.addEventListener("DOMContentLoaded", function() {
    	renderCalendar(now.getMonth(), now.getFullYear()); // 달력 렌더링
        renderTimeSelection(); // 예약 시간 설정
        resetSelections(); // 처음 페이지가 로드되었을 때 달력과 시간 선택을 렌더링하고 선택을 초기화합니다.
        attachReservationListener(); // 예약하기 버튼 이벤트 설정
        attachModalButtonsListener(); // 모달 버튼 이벤트 설정
    });
    
    // 모달창 가져오기
    var modal = document.getElementById("myModal");
    // 모달을 여는 버튼 가져오기
    var btn = document.getElementById("reserve");
    // 모달을 닫는 버튼(엑스) 가져오기
    var span = document.getElementsByClassName("close")[0];
    // 사용자가 버튼을 클릭하면 모달창 열기
    btn.onclick = function() {
      modal.style.display = "block";
    }
    // 사용자가 엑스(x)를 클릭하면 모달창 닫기
    span.onclick = function() {
      modal.style.display = "none";
    }
    // 사용자가 모달창 외부를 클릭하면 모달창 닫기
    window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
    }
    
 // 예약하기 버튼 클릭 이벤트
    document.getElementById('reserve').addEventListener('click', (event) => {
        event.preventDefault();  // form 제출 막기

        // 선택된 날짜와 시간을 변수에 저장
        var selectedDate = document.getElementById('date').value;
        var selectedTime = document.getElementById('time').value;

        // 선택된 날짜와 시간을 모달창에 표시
        document.getElementById('confirmation-text').textContent = `선택하신 날짜는 ${selectedDate}이고 시간은 ${selectedTime}입니다. 이대로 예약하시겠습니까?`;

        // 모달창 보이기
        document.getElementById('myModal').style.display = 'block';
        document.getElementById('modal-content').style.display = 'block';
    });

    
 // 예 버튼 클릭 이벤트
    $("#confirm").click(function(e){
        e.preventDefault();

        // 날짜와 시간을 가져옵니다
        var date = $('#date').val();
        var time = $('#time').val();

        // Form 데이터를 생성합니다
        var formData = new FormData();
        formData.append('date', date);
        formData.append('time', time);

        // Ajax를 사용하여 데이터를 전송합니다
        $.ajax({
            url: "/reservation/confirm/",
            type: "POST",
            data: {date: date, time: time},
            success: function(response){
                // 응답을 JSON으로 파싱합니다
                var data = JSON.parse(response);

                // 데이터를 콘솔에 출력하거나 웹 페이지에 표시합니다
                console.log("날짜: " + data.date);
                console.log("시간: " + data.time);
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.error("Ajax request failed: " + textStatus + ", " + errorThrown);
            }
        });
    });

    // 날짜를 선택했을 때...
    document.getElementById('date').value = selectedDate;
    // 시간을 선택했을 때...
    document.getElementById('time').value = selectedTime;

    