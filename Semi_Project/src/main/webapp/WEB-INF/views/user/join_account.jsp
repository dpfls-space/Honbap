<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
<link href="resources/css/joinAcc.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
<style>
	@font-face {
	    font-family: 'MinSans-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'MinSans-Bold';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Bold.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
</style>
</head>
<body style="margin: 0px; background-color: #FFFBF2;">
	<jsp:include page="../common/header.jsp"/>
	<div class="mainDiv">
		<div class="join title">
			<p>회원가입</p>
		</div>
		<form action="${contextPath}/joinMember.user" method="post" id="joinMemberForm">
			<div class="join account_table_div">
				<table class="join account_table" border="1">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" id="join_id" class="joinInput" name="id" placeholder="영문 대/소문자, 숫자로 이루어진 4~10글자"/>
						</td>
						<td class="infor_Td" style="text-align: right">
							<span class="table_In_Infor" id="inforId"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" id="join_pwd" class="joinInput" name="pwd" autocomplete="off" placeholder="영문 대/소문자, 숫자, 특수문자로 이루어진 6~15글자"/>
						</td>
						<td class="infor_Td" style="text-align: right; width: 225px;">
							<label class="table_In_Infor" id="inforPwd"></label>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" id="join_rePwd" class="joinInput" name="rePwd" autocomplete="off" placeholder="필수 입력"/>
						</td>
						<td class="infor_Td" style="text-align: right;">
							<label class="table_In_Infor" id="inforRePwd"></label>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2"><input type="text" id="join_name" class="joinInput" name="name" placeholder="한글 2~6글자 / 영문 2~18글자"/></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td colspan="2">
							<input type="text" id="phone" class="joinInput" name="phone" placeholder="- 포함 입력"/>
						</td>
					</tr>
					<tr class="memberTr">
						<th>주소</th>
						<td>
							<input type="text" style="cursor:default; width: 450px;" class="joinInput" id="sample4_roadAddress" placeholder="주소 찾기 버튼을 눌러 주세요" readonly>
							<input type="text" class="joinInput" id="sample4_detailAddress" placeholder="상세 주소 입력" required="required">
							<input type="hidden" value="" name="address"/>
						</td>
						<td style="text-align: center;">
							<input type="button" id="addressSearch" onclick="sample4_execDaumPostcode()" value="주소 찾기">
						</td>
					</tr>
					<tr class="memberTr">
						<th id="lastTrBTh">가입경로</th>
						<td id="lastTrBTd" colspan="2">
							<input type="radio" name="signupPath" class="joinInputRa" id="search" value="SEARCH" checked/><label class="joinInputRa Lab" for="search">검색</label>
							<input type="radio" name="signupPath" class="joinInputRa" id="homePage" value="HOMEPAGE"/><label class="joinInputRa Lab" for="homePage">홈페이지</label>
							<input type="radio" name="signupPath" class="joinInputRa" id="introduce" value="INTRODUCE"/><label class="joinInputRa Lab" for="introduce">지인 소개</label>
							<input type="radio" name="signupPath" class="joinInputRa" id="cafeCom" value="INTERNET"/><label class="joinInputRa Lab" for="cafeCom">카페/커뮤니티</label>
							<input type="radio" name="signupPath" class="joinInputRa" id="etc" value="ETC"/><label class="joinInputRa Lab" for="etc">기타</label>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<button id="join_button" type="button">회원가입</button>
				<button id="a_admin" type="button">관리자 회원가입</button>
			</div>
		</form>
	</div>	
	<jsp:include page="../common/footer.jsp"/>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var detailAddress = ''; // 상세 주소 변수

	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                	detailAddress += (detailAddress !== '' ? ', ' + data.buildingName : data.buildingName);
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_detailAddress").value = detailAddress;
	              	
					document.getElementById('sample4_detailAddress').addEventListener('focusout', function() {
						if(document.getElementById("sample4_roadAddress").value !== '' && document.getElementById('sample4_detailAddress').value != ''){
							document.getElementsByName('address')[0].value = roadAddr + '§§●' + document.getElementById('sample4_detailAddress').value;
						}
					})
	            },
	            theme: {
					bgColor: "#FFFBF2", //바탕 배경색
					searchBgColor: "#F24822", //검색창 배경색
					//contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
					pageBgColor: "#F9AE98", //페이지 배경색
					textColor: "#000000", //기본 글자색
					queryTextColor:  "#FFFFFF", //검색창 글자색
					postcodeTextColor:  "#FB9374", //우편번호 글자색
					emphTextColor: "#000000" //강조 글자색
				}
	        }).open();
	    }
		
		window.onload = () => {
			document.getElementById('a_admin').addEventListener('click', () => {
				location.href="${ contextPath }/joinAdmin.user";
			});
			
			const inputs = document.getElementsByClassName('joinInput');
			let phone = document.getElementById('phone');
			const regPho = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			let nameInput = document.getElementById('join_name');
			const regName = /^([가-힣]{2,6}|[a-zA-Z]{2,18})$/ 
			
			document.getElementById('join_button').addEventListener('click', e => {			
				let count = 0;
				for(const input of inputs){
					if(input.value.trim() == ''){
						count++;
					}
				}
				
				
				if(count <= 6 && count > 0){
					alert('필수 항목을 입력해 주세요.');
					for(input of inputs){
						if(input.value == ''){
							input.focus();
						}
					}
				} else if(!pwdCheck()){
					alert('비밀번호가 일치하지 않습니다.');
					pwd.focus();
				} else if(inforPwd.innerText.includes('특수문자')){
					alert('다른 비밀번호를 입력해 주세요.');
					pwd.focus();
				} else if(inforId.innerText.includes('불가한')){
					alert('다른 아이디를 입력해 주세요.');
					idInput.focus();
				} else if(!regPho.test(phone.value)){
					alert('유효한 전화번호가 아닙니다. 다시 입력해 주세요.');
					phone.focus();
				} else if(!regName.test(nameInput.value)) {
					alert('이름을 다시 입력해 주세요.');
					nameInput.focus();
				} else if(count == 0 && pwdCheck() && inforId.innerText.includes('사용 가능한')) {
					alert(nameInput.value + '님 환영합니다!');
					document.querySelector("#joinMemberForm").submit();
				}
			});
		}
		
		let pwd = document.getElementById('join_pwd');
		let rePwd = document.getElementById('join_rePwd');
		let inforPwd = document.getElementById('inforPwd');
		let inforRePwd = document.getElementById('inforRePwd');
		const inforId = document.getElementById('inforId');
		let idInput = document.getElementById('join_id');
		const regId = /^[A-Za-z0-9]{4,10}$/;
		const regPwd = /^[A-Za-z0-9@$!^%*#?&.]{6,15}$/;
		
		idInput.addEventListener('focusout', checkId);
		pwd.addEventListener('focusout', pwdReg);
		rePwd.addEventListener('focusout', pwdCheck);
		
		function checkId(){
			let id = idInput.value;
			if(id.trim() != ''){
				$.ajax({
					url: 'checkId.user',
					data: {id:id},
					success: (data) => {
						if(data == 0 && regId.test(id)){
							inforId.innerText = '사용 가능한 아이디입니다';
							inforId.style.color = 'green'
							return true;
						} else {
							inforId.innerText = '사용 불가한 아이디입니다';
							inforId.style.color = 'red';
							return false;
						}
					},
					error: data => console.log(data)
				});
			}
		}
		
		function pwdCheck(){
			if(pwd.value === rePwd.value && (pwd.value.trim() != '' || rePwd.value.trim() != '')){
				inforRePwd.innerText = '비밀번호가 일치합니다';
				inforRePwd.style.color = 'green';
				return true;
			} else {
				inforRePwd.innerText = '비밀번호가 일치하지 않습니다';
				inforRePwd.style.color = 'red';
				return false;
			}
			
		}
		
		function pwdReg(){
			if(!regPwd.test(pwd.value)){
				inforPwd.innerText = '비밀번호는 6~15자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요';
				inforPwd.style.color = 'red';
				return false;
			} else {
				inforPwd.innerText = '';
				return true;
			}
		}
		
	</script>
	
</body>
</html>