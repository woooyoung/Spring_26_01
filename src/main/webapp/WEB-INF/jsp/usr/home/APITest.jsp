<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="타슈" />

<script>
	const API_KEY = 'e7f88fecf7b3f822aa477e910646254479dc3cdb60dc8374fbdd5c606ab0aeea'; // Encoding된 키

	async function getData() {
		const url = 'https://apis.data.go.kr/6300000/openapi2022/tasuInfo/gettasuInfo'
			+ '?serviceKey=' + API_KEY
			+ '&pageNo=1&numOfRows=10';
		
		try {
			const response = await fetch(url);
			if (!response.ok) {
				console.log(response.status);
				throw new Error(`HTTP 오류! 상태 코드: ${response.status}`);
			}
			const data = await response.json();
			console.log("타슈 :", data);
			console.log("타슈 :", data.response);
			console.log("타슈 :", data.response.body);
			console.log("타슈 :", data.response.body.items);
			console.log("타슈 :", data.response.body.items[0]);
			console.log("타슈 :", data.response.body.items[0].laCrdnt);
			console.log("타슈 :", data.response.body.items[0].loCrdnt);
		} catch (e) {
			console.error("API 호출 실패:", e);
		}
	}
	getData();
</script>

<%@ include file="../common/head.jspf"%>
<%@ include file="../common/foot.jspf"%>