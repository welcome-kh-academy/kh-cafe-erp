<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<jsp:include page="/WEB-INF/views/layout/product-header.jsp"/>

<div>
	<h1>판매 방식 설정</h1>
	<hr/>
	<table class="table">
	<tr>
		<td>
			판매기간
		</td>
		<td>
        	<input class="input--style-1 js-datepicker" type="text" placeholder="" id="hiredDate" name="hiredDate">
            <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
             ~ 
            <input class="input--style-1 js-datepicker" type="text" placeholder="" id="hiredDate" name="hiredDate">
            <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
		</td>
	</tr>
	<tr>
		<td>
			판매가격
		</td>
		<td>
			<input type="text"/> 원
		</td>
	</tr>
	<tr>
		<td>
			단위별 가격
		</td>
		<td>
			-------------------
		</td>
	</tr>
	</table>
</div>

<jsp:include page="/WEB-INF/views/layout/product-footer.jsp"/>


