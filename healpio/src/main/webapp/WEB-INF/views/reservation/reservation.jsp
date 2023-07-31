<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .container {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        .nav-arrow {
            cursor: pointer;
            font-size: 1.5em;
            color: #333;
            margin: 0 10px;
        }

        #calendar {
            width: 40%;
            text-align: center;
            margin: 0 auto;
            border-collapse: collapse;
        }

        #calendar td {
            border: 1px solid #000;
            padding: 10px;
        }

        #calendar td.selected {
            background-color: #eee;
        }

        #time-selection {
            width: 40%;
        }

        #time-selection button {
            margin: 5px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #eee;
            color: #333;
        }

        #time-selection button.selected {
            background-color: #aaa;
        }

        #reserve {
            display: block;
            margin: 20px auto;
            padding: 10px;
            background-color: #0a0;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        #confirmation-modal {
            text-align: center;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 20px;
            margin: 20px auto;
            border-radius: 5px;
            width: 30%;
        }

        #confirmation-modal p {
            margin-bottom: 20px;
        }

        #confirmation-modal button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin: 5px;
        }

        #confirmation-modal #confirm {
            background-color: #0a0;
            color: #fff;
        }

        #confirmation-modal #cancel {
            background-color: #a00;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div>
            <table id="calendar"></table>
        </div>
        <div id="time-selection">
        </div>
    </div>
    <button id="reserve" disabled>예약하기</button>

    <div id="confirmation-modal" style="display: none;">
        <p id="confirmation-text">예약하시겠습니까?</p>
        <button id="confirm">예</button>
        <button id="cancel">아니오</button>
    </div>


    <script>
        let now = new Date();
        let selectedDay = null;
        let selectedTime = null;

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

        function resetSelections() {
            selectedDay = null;
            selectedTime = null;
            document.getElementById('reserve').disabled = true;
        }

        function attachReservationListener() {
            document.getElementById('reserve').addEventListener('click', () => {
                let currentYear = now.getFullYear(); // 현재 연도를 가져옵니다.
                let currentMonth = now.getMonth() + 1; // JavaScript에서 월은 0부터 시작하기 때문에 1을 더해주어야 합니다.
                document.getElementById('confirmation-text').innerText = `예약하시겠습니까? ${currentYear}년 ${currentMonth}월 ${selectedDay.innerText}일 ${selectedTime.innerText}에 예약하시려면 '예'를 클릭하세요.`;
                document.getElementById('confirmation-modal').style.display = 'block';
            });
        }

        function attachModalButtonsListener() {
            document.getElementById('confirm').addEventListener('click', () => {
                location.href = "/reservation-completed"; // Replace this with the actual URL of the reservation completed page
            });

            document.getElementById('cancel').addEventListener('click', () => {
                document.getElementById('confirmation-modal').style.display = 'none';
            });
        }

        function main() {
            renderCalendar(now.getMonth(), now.getFullYear());
            renderTimeSelection();
            attachReservationListener();
            attachModalButtonsListener();
        }

        main();
    </script>
</body>
</html>