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
 
 
   <script>

   jQuery(document).ready(function () {
		//sido option 추가
		jQuery.each(hangjungdong.sido, function (idx, code) {
			//append를 이용하여 option 하위에 붙여넣음
			jQuery('#sido').append(fn_option(code.sido, code.codeNm));
		});

		//sido 변경시 시군구 option 추가
		jQuery('#sido').change(function () {
			jQuery('#sigugun').show();
			jQuery('#sigugun').empty();
			jQuery('#sigugun').append(fn_option('', '선택')); //
			jQuery.each(hangjungdong.sigugun, function (idx, code) {
				if (jQuery('#sido > option:selected').val() == code.sido)
					jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
			});

			//세종특별자치시 예외처리
			//옵션값을 읽어 비교
			if (jQuery('#sido option:selected').val() == '36') {
				jQuery('#sigugun').hide();
				//index를 이용해서 selected 속성(attr)추가
				//기본 선택 옵션이 최상위로 index 0을 가짐
				jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
				//trigger를 이용해 change 실행
				jQuery('#sigugun').trigger('change');
			}
		});

		//시군구 변경시 행정동 옵션추가
		jQuery('#sigugun').change(function () {
			//option 제거
			jQuery('#dong').empty();
			jQuery.each(hangjungdong.dong, function (idx, code) {
				if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
					jQuery('#dong').append(fn_option(code.dong, code.codeNm));
			});
			//option의 맨앞에 추가
			jQuery('#dong').prepend(fn_option('', '선택'));
			//option중 선택을 기본으로 선택
			jQuery('#dong option:eq("")').attr('selected', 'selected');
		});


			var sido = jQuery('#sido option:selected');
			var sigugun = jQuery('#sigugun option:selected');
			var dong = jQuery('#dong option:selected');

				jQuery('#sido').change(function () {
					
					var sido = jQuery('#sido option:selected');
					var sigugun = jQuery('#sigugun option:selected');
					var dong = jQuery('#dong option:selected');
	
					var locationName = sido.text(); // 시도 이름
					jQuery('#locationBox').val(locationName);
					
					// 주소 찾기 기능
					checkAndShowContentBox(locationName);
		
				});
			
				jQuery('#sigugun').change(function () {
		
					var sido = jQuery('#sido option:selected');
					var sigugun = jQuery('#sigugun option:selected');
					var dong = jQuery('#dong option:selected');
					
					var locationName = sido.text() + ' ' + sigugun.text(); // 시도 시군구 이름
					jQuery('#locationBox').val(locationName);
					
					// 주소 찾기 기능
					checkAndShowContentBox(locationName);
		
				});
				
				jQuery('#dong').change(function () {
		
					var sido = jQuery('#sido option:selected');
					var sigugun = jQuery('#sigugun option:selected');
					var dong = jQuery('#dong option:selected');	
					
					var locationName = sido.text() + ' ' + sigugun.text() + ' ' + dong.text(); // 시도/시군구/읍면동 이름
					jQuery('#locationBox').val(locationName);
					
					// 주소 찾기 기능
					checkAndShowContentBox(locationName);
		
			/* 		var dongCode = sido.val() + sigugun.val() + dong.val() + '00'; // 숫자코드
					jQuery('#dongCode').text(dongCode);
			 */
				});
				

					// 주소 찾기 기능
			      function checkAndShowContentBox(address) {
			          var locationText = getLocationText();
			          if (locationText.includes(address)) {
			            $('.contentbox').show();
			          } else {
			            $('.contentbox').hide();
			          }
			        }

			        function getLocationText() {
			          return $('.location-text').text().trim();
			        }
				
	});

	function fn_option(code, name) {
		return '<option value="' + code + '">' + name + '</option>';
	}
	function fn_iframe(url) {
		jQuery('#iframe').attr('src', url);
	}	 
	 
    </script>
  
</head>
<body>

	<div class="contents">
		<select id="sido"><option value="">시도 선택</option></select>
		<select id="sigugun"><option value="">시군구 선택</option></select>
		<select id="dong"><option value="">읍면동 선택</option></select>
		<div>
			 <input type="text" id="locationBox">
			<!-- 코드: <span id="dongCode"></span> -->
		</div>
	</div>



</body>
</html>