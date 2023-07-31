
		document.addEventListener("DOMContentLoaded", function () {
			
	    	console.log(hangjungdong.sido);
	    	  // sido option 추가
	    	  hangjungdong.sido.forEach(function (code) {
	    	    document.querySelector("#sido").appendChild(fn_option(code.sido, code.codeNm));
	    	  });

	    	  // sido 변경시 시군구 option 추가
	    	  document.querySelector("#sido").addEventListener("change", function () {
	    	    var sigugun = document.querySelector("#sigugun");
	    	    sigugun.style.display = "block";
	    	    sigugun.innerHTML = "";
	    	    sigugun.appendChild(fn_option("", "선택"));

	    	    hangjungdong.sigugun.forEach(function (code) {
	    	      if (document.querySelector("#sido").value == code.sido) {
	    	        sigugun.appendChild(fn_option(code.sigugun, code.codeNm));
	    	      }
	    	    });

	    	    if (document.querySelector("#sido").value == "36") {
	    	      sigugun.style.display = "none";
	    	      sigugun.querySelector("option:nth-child(2)").selected = true;
	    	      sigugun.dispatchEvent(new Event("change"));
	    	    }
	    	  });

	    	  // 시군구 변경시 행정동 옵션추가
	    	  document.querySelector("#sigugun").addEventListener("change", function () {
	    	    var dong = document.querySelector("#dong");
	    	    dong.innerHTML = "";

	    	    hangjungdong.dong.forEach(function (code) {
	    	      if (
	    	        document.querySelector("#sido").value == code.sido &&
	    	        document.querySelector("#sigugun").value == code.sigugun
	    	      ) {
	    	        dong.appendChild(fn_option(code.dong, code.codeNm));
	    	      }
	    	    });

	    	    dong.insertBefore(fn_option("", "선택"), dong.firstChild);
	    	    dong.querySelector("option[value='']").selected = true;
	    	  });

	    	  document.querySelector("#dong").addEventListener("change", function () {
	    	    var sido = document.querySelector("#sido").value;
	    	    var sigugun = document.querySelector("#sigugun").value;
	    	    var dong = document.querySelector("#dong").value;
	    	    var dongCode = sido + sigugun + dong + "00";
	    	  });
	    	  
	
	    	});

		
		
		
		
	    	  function fn_option(code, name) {
	    		    var option = document.createElement("option");
	    		    option.value = code;
	    		    option.text = name; // 여기서 name으로 변경합니다.
	    		    return option;
	    		  }
	    	
	    	
		
		
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

		  
		  // 시도를 선택할 경우 해당 시도만 표시되는 함수
          function filterBylocation(){
        	
              const selectedLocation = document.querySelector('select[name="sido"]').value;
			  
              console.log(selectedLocation);
              const contentBoxes = document.querySelectorAll('.contentbox');

              for(const box of contentBoxes){
                  const locationText = box.querySelector('.location-text').textContent;
                  box.style.display = (locationText.includes(selectedLocation)) ? 'block' : 'none';
              }

            }

          
          /*페이지 번호를 클릭하면 go 함수가 호출되도록 처리합니다.*/
          function go(pageNum) {
        	    document.getElementById('pageNo').value = pageNum; // 숨겨진 폼 필드에 페이지 번호 설정
        	    document.getElementById('searchForm').submit(); // 검색 폼 전송
        	}
          
