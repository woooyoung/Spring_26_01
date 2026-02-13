<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="에어코리아 대기오염 테스트" />

<script>
	const API_KEY = '공공데이터 -> 마이페이지 -> 인증키'; // Encoding된 키

	async function getAirData() {
		const url = 'https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty'
			+ '?serviceKey=' + API_KEY
			+ '&returnType=json&numOfRows=15&pageNo=2&sidoName=서울';

		try {
			const response = await fetch(url);
			if (!response.ok) {
				throw new Error(`HTTP 오류! 상태 코드: ${response.status}`);
			}
			const data = await response.json();
			console.log("대기오염 정보:", data);
			console.log("대기오염 정보:", data.response);
			console.log("대기오염 정보:", data.response.body);
			console.log("대기오염 정보:", data.response.body.items);
			console.log("대기오염 정보:", data.response.body.items[0]);
			console.log("대기오염 정보:", data.response.body.items[0].stationName);
			var a = data.response.body.items[0].stationName;
			alert(a);
		} catch (e) {
			console.error("API 호출 실패:", e);
		}
	}
	getAirData();
</script>

<%@ include file="../common/head.jspf"%>
<%@ include file="../common/foot.jspf"%>