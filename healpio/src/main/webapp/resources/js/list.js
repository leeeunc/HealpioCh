
    	
    	// '운동종류' select 요소를 변경할 때 호출되는 함수
    	function filterByExercise() {
    		

    		
    		// 운동 종류를 검색필드에 저장
    		document.querySelector('#exercise_name').value = document.querySelector('select[name="sports"]').value;
    		// 검색
    		go(1);
    		
    		
    	}
    	


    	
    	
    	  // 페이지 로드 시 저장된 값을 입력란에 채워넣기
    	  window.onload = function() {
    	    var provinceValue = sessionStorage.getItem('province');
    	    var cityValue = sessionStorage.getItem('city');
    	    var districtValue = sessionStorage.getItem('district');
    	    
    	    document.querySelector('#province').value = provinceValue;
    	    document.querySelector('#city').value = cityValue;
    	    document.querySelector('#district').value = districtValue;
    	  }


          
          /*페이지 번호를 클릭하면 go 함수가 호출되도록 처리합니다.*/
          function go(pageNum) {
        	    document.getElementById('pageNo').value = pageNum; // 숨겨진 폼 필드에 페이지 번호 설정
        	    
        	    document.getElementById('searchForm').submit(); // 검색 폼 전송

        	    
        	    
        	}
          
          
          
          
         window.onkeydown = function() {
        	  var kcode = event.keyCode;
        	  if(kcode == 116) {
        	  history.replaceState({}, null, location.pathname);
        	  }
        	  }