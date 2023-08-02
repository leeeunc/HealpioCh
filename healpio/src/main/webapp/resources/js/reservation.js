
		let now = new Date();
        let selectedDay = null;
        let selectedTime = null;
        
//        // 서버에서 강사 스케줄 데이터를 로드합니다.
//        function loadInstructorSchedule() {
//            fetch('/path/to/your/api')  // 여기서 '/path/to/your/api'를 실제 API 경로로 변경해야 합니다.
//            .then(response => response.json())
//            .then(data => {
//                // 데이터를 기반으로 버튼의 활성화 상태를 설정합니다.
//                let days = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
//                days.forEach((day, index) => {
//                    if (!data.availableDays.includes(day)) {
//                        // 해당 요일에 예약할 수 없다면 요일 버튼을 비활성화합니다.
//                        document.querySelectorAll('#calendar td')[index + 7].classList.add('disabled');
//                    }
//                });
//
//                document.querySelectorAll('#time-selection button').forEach(button => {
//                    let time = parseInt(button.textContent.split(':')[0]);
//                    if (time < data.availableTime.start || time > data.availableTime.end) {
//                        // 해당 시간에 예약할 수 없다면 시간 버튼을 비활성화합니다.
//                        button.disabled = true;
//                    }
//                });
//            });
//        }

        // 달력 년도, 월 생성
        function renderCalendar(month, year) {
            let daysInMonth = new Date(year, month + 1, 0).getDate();
            let firstDayOfMonth = new Date(year, month, 1).getDay();
            
            // Calendar header with month and year
            let calendarHeader = `
                <tr>
                    <th colspan="7">
                        <span class="nav-arrow" id="prevMonth">&lt;</span>
                        ${year}년 ${month + 1}월
                        <span class="nav-arrow" id="nextMonth">&gt;</span>
                    </th>
                </tr>
                <tr>
                    <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
                </tr>`;
            
            let calendar = document.querySelector('#calendar');
            calendar.innerHTML = calendarHeader;

            // Fill in the first week
            let calendarBody = '<tr>';
            for(let i = 0; i < 7; i++) {
                calendarBody += i < firstDayOfMonth ? '<td></td>' : `<td>${i - firstDayOfMonth + 1}</td>`;
            }
            calendarBody += '</tr>';

            // Fill in the rest of the days
            for(let i = 8 - firstDayOfMonth; i <= daysInMonth; i += 7) {
                calendarBody += '<tr>';
                for(let j = i; j < i + 7 && j <= daysInMonth; j++) {
                    calendarBody += `<td>${j}</td>`;
                }
                calendarBody += '</tr>';
            }

            calendar.innerHTML += calendarBody;

            // Attach event listeners for each day
            document.querySelectorAll('#calendar td').forEach((e, i) => {
                if (i < 7 || e.innerText === "") return;

                e.addEventListener('click', () => {
                    if (selectedDay) selectedDay.classList.remove('selected');
                    e.classList.add('selected');
                    selectedDay = e;

                   //document.getElementById('reserve').disabled = false;
                   document.getElementById('time-selection').querySelectorAll('button').forEach(e => e.disabled = false);
                });
            });

            document.getElementById('prevMonth').addEventListener('click', () => {
                now.setMonth(now.getMonth() - 1);
                renderCalendar(now.getMonth(), now.getFullYear());
                renderTimeSelection();
                resetSelections();
            });

            document.getElementById('nextMonth').addEventListener('click', () => {
                now.setMonth(now.getMonth() + 1);
                renderCalendar(now.getMonth(), now.getFullYear());
                renderTimeSelection();
                resetSelections();
            });
        }
        
        // 예약시간버튼
        function renderTimeSelection() {
            let timeSelection = document.getElementById('time-selection');
            timeSelection.innerHTML = '';
            for(let i = 6; i <= 23; i++) {
                let timeButton = document.createElement('button');
                timeButton.textContent = i < 10 ? `0${i}:00` : `${i}:00`;
                timeButton.disabled = true;
                timeSelection.appendChild(timeButton);

                // Attach event listener for each time button
                timeButton.addEventListener('click', () => {
                    if (selectedTime) selectedTime.classList.remove('selected');
                    timeButton.classList.add('selected');
                    selectedTime = timeButton;

                    document.getElementById('reserve').disabled = false;
                });

                // Add a line break after every four time slots
                if(i % 4 === 1) timeSelection.appendChild(document.createElement('br'));
            }
        }

        // 예약확인버튼
        function attachMonthNavigationListener() {
            document.getElementById('prevMonth').addEventListener('click', () => {
                now.setMonth(now.getMonth() - 1);
                renderCalendar(now.getMonth(), now.getFullYear());
                renderTimeSelection();
                resetSelections();
            });

            document.getElementById('nextMonth').addEventListener('click', () => {
                now.setMonth(now.getMonth() + 1);
                renderCalendar(now.getMonth(), now.getFullYear());
                renderTimeSelection();
                resetSelections();
            });
        }
        
        //
        function resetSelections() {
            selectedDay = null;
            selectedTime = null;
            document.getElementById('reserve').disabled = true;
        }

        // 예약하기 버튼
        function attachReservationListener() {
            document.getElementById('reserve').addEventListener('click', () => {
                let currentYear = now.getFullYear(); // 현재 연도를 가져옵니다.
                let currentMonth = now.getMonth() + 1; // JavaScript에서 월은 0부터 시작하기 때문에 1을 더해주어야 합니다.
                document.getElementById('confirmation-text').innerHTML = `예약하시겠습니까? <br> ${currentYear}년 ${currentMonth}월 ${selectedDay.innerText}일 ${selectedTime.innerText}에 예약하시려면 '예'를 클릭하세요.`;
                document.getElementById('modal').style.display = 'block';
            });
        }
        

        function attachModalButtonsListener() {
            document.getElementById('confirm').addEventListener('click', () => {
                location.href = "/reservation/confirm"; // Replace this with the actual URL of the reservation completed page
            });

            document.getElementById('cancel').addEventListener('click', () => {
                document.getElementById('modal').style.display = 'none';
            });
        }

        window.onload = function() {
            renderCalendar(now.getMonth(), now.getFullYear());
            renderTimeSelection();
            attachReservationListener();
            attachModalButtonsListener();
//            loadInstructorSchedule();  // 페이지 로딩시 강사 스케줄 데이터를 로드합니다.
        };