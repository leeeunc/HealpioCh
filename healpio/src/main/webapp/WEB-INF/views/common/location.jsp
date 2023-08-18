<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <script src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
 <script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
 
 <style type="text/css">
 .location-select {
    display: flex;
    gap: 10px; /* 선택 옵션 사이 간격 설정 */
    float: left; /* 왼쪽으로 이동 */
    margin-right: 50px; /* 두 요소 간격 설정 */
}


 </style>
 
   <script>

   jQuery(document).ready(function () {
		//sido option 추가
		jQuery.each(hangjungdong.sido, function (idx, code) {
			//append를 이용하여 option 하위에 붙여넣음
			let sel_province = '${param.sel_province}';
			let selected = code.sido==sel_province?'selected':'';
			jQuery('#sido').append(fn_option(code.sido, code.codeNm, selected));
			
 			// 검색유지
			// province값이 파라메터로 전달 된 경우 (검색조건에 있는경우)
			if(sel_province){
				// 시구군 옵션 추가
				addSigugunOptions();
				console.log("if(sel_province 테스트");
 				   
				// 시구군 선택 - 검색유지
				  if (jQuery('#sido > option:selected').val() == code.sido){
						console.log(" if (jQuery('#sido > option:selected').val() == code.sido) 테스트");
 						jQuery.each(hangjungdong.sigugun, function (idx, code) {
							let sel_city = '${param.sel_city }';
							let selected = code.sigugun==sel_city?'selected':'';
			        		jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm, selected));

					}); 
				} 
			}; 
		});
		
		

		// #sido 값 변경 시 실행되는 코드
		jQuery('#sido').change(function () {
			addSigugunOptions();
		});

		
	    // sigugun 값 변경 시  실행되는 코드
	    jQuery('#sigugun').change(function () {
	    	addDongOptions();
	    });
	    
		
	    // 동 값 변경 시 실행되는 코드
	    jQuery('#dong').change(function () {
	    	addDongSelected();
	    });

		
	    /* 
		// 페이지 로드 시 초기 실행	
		addSigugunOptions();

		 */
		
		
		
		



 		

			var sido = jQuery('#sido option:selected');
			var sigugun = jQuery('#sigugun option:selected');
			var dong = jQuery('#dong option:selected');

				jQuery('#sido').change(function () {
					
					var sido = jQuery('#sido option:selected');
	
					var locationName = sido.text(); // 시도 이름
					jQuery('#province').val(locationName);
					

				});
			
				jQuery('#sigugun').change(function () {
		
					var sigugun = jQuery('#sigugun option:selected');
					
					var locationName = sigugun.text(); // 시도 시군구 이름
					jQuery('#city').val(locationName);


		
				});
				
				jQuery('#dong').change(function () {
		
					var dong = jQuery('#dong option:selected');	
					
					var locationName = dong.text(); // 시도/시군구/읍면동 이름
					jQuery('#district').val(locationName);


					
				});
				
				
	});

   
   
// 시군구 옵션을 추가하는 함수
	function addSigugunOptions() {
	    jQuery('#sigugun').show();
	    jQuery('#sigugun').empty();
	    jQuery('#sigugun').append(fn_option('', '시군구 선택'));

	    
	    jQuery.each(hangjungdong.sigugun, function (idx, code) {
	        if (jQuery('#sido > option:selected').val() == code.sido)
	        	
	             jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
	        

	    });
	    
	 	// 세종특별자치시 예외처리 함수
	    if (jQuery('#sido option:selected').val() == '36') {
	        jQuery('#sigugun').hide();
	        jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
	        jQuery('#sigugun').trigger('change');
	    }
	}


		// 시군구 옵션을 선택했을 때
		// 동 옵션을 추가하는 함수
	function addDongOptions() {
		 if (jQuery('#sigugun option:selected').val() !== '') {
	            jQuery('#sigugun option:selected').attr('selected', 'selected');
	        }
	        var selectedSigugun = jQuery('#sigugun option:selected');
	        var sigugunName = selectedSigugun.text();
	        jQuery('#city').val(sigugunName);

	        jQuery('#dong').empty();
	        jQuery('#dong').append(fn_option('', '읍면동 선택'));
	        jQuery.each(hangjungdong.dong, function (idx, code) {
	            if (selectedSigugun.val() === code.sigugun) {
	                jQuery('#dong').append(fn_option(code.dong, code.codeNm));
	            }
	        });
	}

	function addDongSelected() {
	    if (jQuery('#dong option:selected').val() !== '') {
	        jQuery('#dong option:selected').attr('selected', 'selected');
	    }
	    var selectedDong = jQuery('#dong option:selected');
	    var dongName = selectedDong.text();
	    jQuery('#district').val(dongName);
	}
    
    
	
 	function fn_option(code, name, selected) {
 		
		return '<option value="' + code + '" '+ selected +'>' + name + '</option>';
		
	}




	function filterByProvince(){
		// 지역 초기화 함수
	    document.querySelector('#city').value = "";
	    document.querySelector('#district').value = "";
	}
	
	function filterByCity(){
		// 지역 초기화 함수
	    document.querySelector('#district').value = "";
	}
	
	

	console.log("provice : " + '${param.sel_province }')
	console.log("city : " + '${param.sel_city }')
	console.log("district : " + '${param.sel_district}')
    </script>
  
</head>
<body>


    <div class="location-select">
		<select name="sel_province" id="sido" onclick="filterByProvince()"><option value="" >시도 선택</option></select>
		<select name="sel_city" id="sigugun" onclick="filterByCity()"><option value="">시군구 선택</option></select>
		<select name="sel_district" id="dong"><option value="">읍면동 선택</option></select>
    </div>




</body>
</html>