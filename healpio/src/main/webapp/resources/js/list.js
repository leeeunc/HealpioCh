

// 페이지 로드 시 저장된 값을 입력란에 채워넣기
window.onload = function() {
	teacherynDisplay();
	
/*	var provinceValue = sessionStorage.getItem('province');
	var cityValue = sessionStorage.getItem('city');
	var districtValue = sessionStorage.getItem('district');
	
	document.querySelector('#sel_province').value = provinceValue;
	document.querySelector('#sel_city').value = cityValue;
	document.querySelector('#sel_district').value = districtValue;
	*/

}

function teacherynDisplay() {
    var teacheryn = document.querySelector('.teacheryn');
    var regBtn = document.querySelector('.regBtn');


        if (teacheryn.value.trim() === 'Y') {
            regBtn.style.display = 'block';
        } else if (teacheryn.value.trim() != 'Y') {
            regBtn.style.display = 'none';
        }

}



	
	// '운동종류' select 요소를 변경할 때 호출되는 함수
	function filterByExercise() {
		console.log("js테스트")
		// 운동 종류를 검색필드에 저장
		document.querySelector('#exercise_name').value = document.querySelector('select[name="sports"]').value;
		
	}

	function filterByarray() {
		console.log("array테스트")
		// 운동 종류를 검색필드에 저장
		document.querySelector('#dependsArray').value = document.querySelector('select[name="array"]').value;
		
	}
		
	
	function go(pageNum){
		console.log("gogogogogogoggogogogogogogogo테스트");
		document.getElementById('pageNo').value = pageNum;
		document.getElementById('searchForm').submit();
	}
	

     window.onkeydown = function() {
    	  var kcode = event.keyCode;
    	  if(kcode == 116) {
    	  history.replaceState({}, null, location.pathname);
    	  }
     }
     
     
     