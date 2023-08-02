
		
		
		  // '운동종류' select 요소를 변경할 때 호출되는 함수
		  function filterByExercise() {
		    const selectedExercise = document.querySelector('select[name="sports"]').value;
		    console.log(selectedExercise);
		    const contentBoxes = document.querySelectorAll('.contentbox');
		
		    for (const box of contentBoxes) {
		      const exerciseText = box.querySelector('.exercise-text').textContent;
		      box.style.display = (exerciseText.includes(selectedExercise)) ? 'block' : 'none';
		    }
		  }


          
          /*페이지 번호를 클릭하면 go 함수가 호출되도록 처리합니다.*/
          function go(pageNum) {
        	    document.getElementById('pageNo').value = pageNum; // 숨겨진 폼 필드에 페이지 번호 설정
        	    document.getElementById('searchForm').submit(); // 검색 폼 전송
        	}
          
