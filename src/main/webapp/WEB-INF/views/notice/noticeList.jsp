<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대보3기 공지사항</title>

    <style>
     
   .pagination-container {
    text-align: center;
    margin-top: 20px;
}
	
	/* 페이징 버튼 스타일 */
	.pagination-button {
	    display: inline-block;
	    margin: 5px;
	    padding: 5px 10px;
	    background-color: #007bff;
	    color: #fff;
	    border: 1px solid #007bff;
	    text-decoration: none;
	    cursor: pointer;
	    border-radius: 5px;
	}

/* 현재 페이지 버튼 스타일 */
.pagination-button.current {
    background-color: #333;
    border-color: #333;
}

/* 페이징 버튼 호버 스타일 */
.pagination-button:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}
            
            
        body {
            text-align: center;
            margin: 0 auto;
        }

        .search-options {
            display: flex;
            align-items: center;
        }

        .search-options label {
            margin-right: 10px;
        }

        .search-options input[type="text"] {
            flex: 1;
        }

        .board-list-table {
            width: 100%; /* 테이블 폭 100%로 설정 */
            border-collapse: collapse;
            margin-top: 20px;
        }

        .board-list-table th,
        .board-list-table td {
            padding: 10px;
            text-align: center;
        }

        .board-list-table th {
            background-color: #f2f2f2;
        }

        .pagination {
            margin-top: 20px;
        }

        .pagination a {
            padding: 10px;
          
            text-decoration: none;
        }

        .pagination a.pagination-current {
            font-size: 2rem;
            font-weight: bold;
        }
        
           .search-options {
            display: flex;
            align-items: center;
        }

        .search-options label {
            margin-right: 10px;
        }

        .search-options input[type="text"] {
            flex: 1;
        }

        .search-options input[type="submit"] {
            padding: 10px 20px;
        }
        
          .contTop { margin:50px auto;padding-left:100px;width:1000px;height:40px; }
        .contTop label { height:40px; line-height:40px; margin: 0 10px; }
		.contTop #searchTitle { width:100%;padding:5px;margin:0; board:1px solid #ccc; boarder-radius: 3px; height:40px;line-height:40px;box-sizing:border-box; }
		.contTop #insertBtn { width:70px;height:40px;margin-left:-250px }

		.button_wrap { padding:0 47px; }
		.button_wrap button { float:right;height:40px;width:75px; }
     
    </style>
    
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    
<body>
</head>
    <form name="pageForm" id="pageForm" action="<c:url value='/notice/list'/>" method="post">
       <input type="hidden" name="pageNo" id="pageNo" value="${result.notice.pageNo}" />
       <input type="hidden" name="searchTitle" id="searchTitle" value="${result.notice.searchTitle}" />
       <input type="hidden" name="pageLength" id="pageLength" value="${result.notice.pageLength}" />
    </form>
    
     <form id="mForm" name="mForm" action="<c:url value='/notice/list'/>" method="post">
     <input type="hidden" name="pageNo" id="pageNo" value="${result.notice.pageNo}" />
   <div style="margin:0px auto;">
         <div style="display: flex; margin:0px auto; width:70%; justify-align: center">
            <label>건수: </label>
            <select name="pageLength" id="pageLength" >
                <option value="10" ${result.notice.pageLength == 10 ? 'selected="selected"' : ''} >10건</option>
               <option value="20" ${result.notice.pageLength == 20 ? 'selected="selected"' : ''} >20건</option>
               <option value="50" ${result.notice.pageLength == 50 ? 'selected="selected"' : ''} >50건</option>
               <option value="100" ${result.notice.pageLength == 100 ? 'selected="selected"' : ''} >100건</option>
            </select>
          
            <label>제목 : </label>
            <input type="text" name="searchTitle" id="searchTitle" value="${result.notice.searchTitle}" style="flex:1">
            <input type="submit" value="검색" style="padding: 10px 20px;margin: 0 10px;height:40px;">
	
         </div>
      </div>   


    <table border="1" class="notice-list-table">
     <tr id="noticeItem" style="display:none;" >
         
         
            <td id="regDate"></td>
            <td id="noticeid"></td>
            <td id="title"></td>
            <td id="writerUid"></td>
            <td id="viewCount"></td>
         </tr>  
    
   <tr>
      <input type="checkbox" id="selectAllCheckbox"> 전체 선택
    <th style="width:10%">글번호</th>
    <th style="width:25%" >제목</th>
  
  
    <th style="width:10%">작성자</th>
 
      <th style="width:20%">조회수</th>
       <th style="width:20%">날짜</th>
       <th style="width:10%">삭제</th>
        <th style="width:10%">전체 선택</th>
    </th>
</tr>


<c:forEach var="notice" items="${result.list}">
    <tr class="notice-list-tr">
    <td>${notice.noticeid}</td>
   <td onclick="dialogDetail(${notice.noticeid})">${notice.title}</td>
 <td>${notice.writer_uid}</td> 
     <td>${notice.view_count}</td>
        <td>${notice.reg_date}</td>
      <td><button type="button" id="deleteBtn">선택 삭제하기</button></td>      
      <td><input type="checkbox" class="checkbox-item"  onclick="checkSelectAll()" value="${board.boardid}"></td>   
       
    </tr>
</c:forEach>
     </tbody>
    </table>
    </form>
    
    
    <br>
    
       
    <br>
   <div class="button_wrap">
        <button id="deleteSelected">선택 삭제</button>
    </div>
<div style="text-align: center;margin-top:20px;">
         <c:if test="${result.notice.navStart != 1}">
            <a href="javascript:jsPageNo(${result.notice.navStart-1})" style="padding: 10px;border:"> &lt; </a> 
         </c:if>
         <c:forEach var="item" begin="${result.notice.navStart}" end="${result.notice.navEnd}">
            <c:choose>
               <c:when test="${result.notice.pageNo != item }">
                  <a href="javascript:jsPageNo(${item})" style="padding: 10px;border:;">${item}</a>  
               </c:when>
               <c:otherwise>
                  <strong style="font-size:2rem">${item}</strong>   
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${result.notice.navEnd != result.notice.totalPageSize}">
            <a href="javascript:jsPageNo(${result.notice.navEnd+1})" style="padding: 10px;border: "> &gt; </a> 
         </c:if>   
</div>

      <div id="insertNoticeFrom" title="게시판 등록">
           <div id="insertContent">
              <input type="text" id="inTitle" placeholder="제목"><br>
              <textarea id="inContents" placeholder="내용"></textarea><br>
               <label for="fixedYN">고정 여부:</label>
           <input type="radio" id="fixedYN" name="fixedYN" value="Y">예
           <input type="radio" id="fixedYN" name="fixedYN" value="N">아니오
          </div>
       </div>


      <div id="detail" title="글 상세보기" >
         <div class="detail">
              <input type="hidden" name="noticeid" id="noticeid2" value="${notice.noticeid}"/> 
               <h3 id="title2">[  ] </h3>
               <hr>
               <br>
               <div class="meta-info" id="info2">
                 작성자 :  <span id="writerUid2">${notice.writer_uid}</span>  |　 작성날짜 :  <span id="reg_date2">${notice.reg_date}</span>　 |　 조회수 :  <span id="view_count2">${notice.view_count}</span>
              </div>
               <div class="contents" id="contents2">
                ${notice.contentsHTML}
              </div>
         </div>
      </div>



	<div id="update">
		<h1>공지사항 수정</h1>
		<form id="updateNoticeForm" name="updateNoticeForm" method="post">

			<input type="text" name="title" id="updateNoticeTitle"
				placeholder="제목" class="text_title" value="${notice.title}"><br>
			<textarea name="contents" id="updateNoticeContents" placeholder="내용"
				class="notice_ct">${notice.contents}</textarea>
			<p>
				<input type="hidden" id="updateNoticeWriterUid" name="updateNoticeWriterUid"
					value="${loginMember.uid}" readonly>
			</p>
			<span class="radio-group"> 상단고정 여부 <label><input
					type="radio" name="fixed_yn" class="updateFixed_yn"
					id="updateFixed_yn" value="Y" checked>Y</label> <label><input
					type="radio" name="fixed_yn" class="updateFixed_yn"
					id="updateFixed_yn" value="N">N</label>
			</span>
		</form>
	</div>

	<div id="deleteNotice" title="게시물 삭제">
       <p>이 게시물을 삭제하시겠습니까?</p><br>
   </div>
<script>

/* 
//"선택 삭제하기" 버튼 클릭 이벤트 핸들러
document.getElementById("deleteBtn").addEventListener("click", function () {
    // 체크된 항목을 저장할 배열
    const checkedItems = [];

    // 모든 체크박스 요소를 가져옵니다.
    const checkboxes = document.querySelectorAll(".checkbox-item");

    // 각 체크박스를 확인하며 체크된 항목을 배열에 추가합니다.
    checkboxes.forEach(function (checkbox) {
        if (checkbox.checked) {
            checkedItems.push(checkbox.value);
        }
    });

    // 선택된 항목이 없으면 알림을 표시하고 종료합니다.
    if (checkedItems.length === 0) {
        alert("선택된 항목이 없습니다.");
        return;
    } */




/*--------------------------------------------버튼-------------------------------------------*/
//공지사항 등록
   $("#insertBtn").on("click", function(){
      insertNoticeFrom.dialog("open");
   });
/*--------------------------------------------대화상자-------------------------------------------*/
// 공지사항 등록 
   const insertNoticeFrom =$("#insertNoticeFrom").dialog({
      autoOpen: false,
      modal : true,
      width: 600,
      height: 500,
      buttons: {
         "등록": insertNotice,
         Close: function(){
            $(this).dialog("close");
         }
      }
   });

    // 공지사항 상세보기 
   const detail =$("#detail").dialog({
      autoOpen: false,
      modal : true,
      width: 600,
      height: 500,
      buttons: {
         "수정": function(){
        	 
        	 const title =$("#title2").text();
        	 const contents =$("#contents2").text();
        	 const noticeid =$("#noticeid2").text();
        	 
        	 $("#updateNoticeTitle").val(title);
        	 $("#updateNoticeContents").val(contents);
        	 
        	 noticeUpdate.dialog("open");
        	 
         },
         "삭제" : dialogDelete,
         Close: function(){
            $(this).dialog("close");
         }
      }
   });

    
    // 공지사항 수정하기
      const noticeUpdate =$("#update").dialog({
      autoOpen: false,
      modal : true,
      width: 600,
      height: 500,
      buttons: { 	  
         "수정": dialogUpdate,
         Close: function(){
            $(this).dialog("close");    	  
         }
      }
   });

    
    // 공지사항 삭제하기
    
    // 삭제 확인 다이얼로그
	const deleteNotice = $("#deleteNotice").dialog({
    autoOpen: false,
    modal: true,
    width: 400,
    buttons: {
       
    	"삭제": function() {
            // 삭제할 공지사항 ID를 가져옴 (예: noticeid3)
            const noticeid3 = $("#noticeid2").text();
            
     
            deleteNoticeFunction(noticeid3);
        },
        "취소": function() {
            $(this).dialog("close");
        }
    }
});

	$(document).ready(function() {
	    // 전체 선택 체크박스 클릭 시 모든 체크박스 상태 업데이트
	    $("#selectAllCheckbox").click(function() {
	        var isChecked = $(this).prop("checked");
	        $(".checkbox-item").prop("checked", isChecked);
	    });

	    // 선택 삭제 버튼 클릭 시 선택된 공지사항 삭제
	    $("#deleteSelected").click(function() {
	        var selectedNoticeIds = [];

	        // 선택된 체크박스 찾아서 ID 수집
	        $(".checkbox-item:checked").each(function() {
	            selectedNoticeIds.push($(this).val());
	        });

	        // 선택된 공지사항 삭제 API 호출
	        if (selectedNoticeIds.length > 0) {
	            deleteSelectedNotices(selectedNoticeIds);
	        } else {
	            alert("선택된 항목이 없습니다.");
	        }
	    });
	});

      // 선택된 공지사항 삭제 요청
      function deleteSelectedNotices(selectedIds) {
          $.ajax({
              url: "<c:url value='/notice/deleteSelected'/>",
              type: "POST",
              data: JSON.stringify({ noticeIds: selectedIds }),
              contentType: "application/json; charset=UTF-8",
              success: function(response) {
                  if (response.success) {
                      alert(response.message);
                      location.reload(); // 페이지 새로고침
                  } else {
                      alert(response.message);
                  }
              },
              error: function() {
                  alert("오류가 발생했습니다.");
              }
          });
      }
    
/*--------------------------------------------실행부-------------------------------------------*/
    function insertNotice(){
   
       const checkFixed = document.querySelector('input[name="fixedYN"]:checked'); // 수정: # 추가
        const fixedValue = checkFixed ? checkFixed.value: '';
       const insertUid = "${loginMember.uid}";
       
       const param = {
             writer_uid : insertUid,
             title   : inTitle.value,
             contents : inContents.value, // id값을 가져옴.
             fixed_yn : fixedValue
       };
       
        fetch("<c:url value='/notice/insert'/>", {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(param)
        })
        .then(response => response.json())
        .then(json => {
               alert(json.message);
               location.href="<c:url value='/notice/list'/>";
        });
    }


 //상세보기
function dialogDetail(noticeid){
         
    const noticeid2 = document.querySelector("#noticeid2");
    const title2 = document.querySelector("#title2");
    const contents2 = document.querySelector("#contents2");
    const writerUid2 = document.querySelector("#writerUid2");
    const reg_date2 = document.querySelector("#reg_date2");
    const view_count2 = document.querySelector("#view_count2");
         
      const param = {
         noticeid : noticeid
      };
      
       fetch("<c:url value='/notice/detail'/>", {
           method: "POST",
           headers: {
               "Content-Type": "application/json; charset=UTF-8",
           },
           body: JSON.stringify(param)
       })
       .then(response => response.json())
       .then((json) => {
            noticeid2.innerText = json.noticeid;  
            title2.innerText = json.title;  
            contents2.innerText = json.contents;  
            writerUid2.innerText = json.writer_uid;  
            reg_date2.innerText = json.reg_date;  
            view_count2.innerText = json.view_count;  
               $("#detail").dialog("open");
        });
  return false;   
   }
    
    
//수정하기
function dialogUpdate() {
   
    const noticeid3 = $("#noticeid2").text();
    const title3 = $("#updateNoticeTitle").val();
    const contents3 = $("#updateNoticeContents").val();
    const writerUid3 = $("#updateNoticeWriterUid").val(); 
    const fixed_yn3 = $("input[name='fixed_yn']:checked").val(); 
    
    const param = {
       noticeid: noticeid3,
        title: title3,
        contents: contents3,
        writer_uid: writerUid3,
        fixed_yn: fixed_yn3
    };
    
    
    fetch("<c:url value='/notice/revice'/>", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(param)
    })
    .then(response => response.json())
    .then(json => {
            alert(json.message);
            noticeUpdate.dialog("close");
            
            // 수정이 성공한 경우에 업데이트된 내용을 화면에 반영
            $("#title2").text(title3);
            $("#contents2").text(contents3);
            $("#fixed_yn2").prop("checked", fixed_yn3 === "Y");
    
    });
}


function dialogDelete(){
	   
	const noticeid4 = $("#noticeid2").text();
    
    const param = {
    	 noticeid : noticeid4
       
    };
    
     fetch("<c:url value='/notice/delete'/>", {
         method: "POST",
         headers: {
             "Content-Type": "application/json; charset=UTF-8",
         },
         body: JSON.stringify(param)
     })
     .then(response => response.json())
     .then(json => {
            alert(json.message);
            location.href="<c:url value='/notice/list'/>";
     });
 }


/*--------------------------------------------기타-------------------------------------------*/
 // 페이지 번호 변경 함수
 function jsPageNo(pageNo) {
     document.querySelector("#pageForm > #pageNo").value = pageNo;
     document.querySelector("#pageForm").submit();
 }


//         전체 선택 삭제
//         function selectAllCheckboxes() {
//             // 체크박스 상태를 가져옴
//             var isChecked = document.getElementById("selectAllCheckbox").checked;
            
//             // 모든 체크박스를 선택 또는 해제
//             var checkboxes = document.querySelectorAll(".checkbox2.checkbox-header");
//             for (var i = 0; i < checkboxes.length; i++) {
//                 checkboxes[i].checked = isChecked;
//             }
//         }

//         // 다른 체크박스 클릭 시 전체 선택 체크박스 감시
//         function check(checkbox, noticeId) {
//             // 모든 체크박스가 체크되었는지 확인
//             var checkboxes = document.querySelectorAll(".checkbox2.checkbox-header");
//             var allChecked = true;
//             for (var i = 0; i < checkboxes.length; i++) {
//                 if (!checkboxes[i].checked) {
//                     allChecked = false;
//                     break;
//                 }
//             }
            
//             // 전체 선택 체크박스 상태 업데이트
//             document.getElementById("selectAllCheckbox").checked = allChecked;
//         }

//         // 등록하기 버튼 클릭 시 다이얼로그 열기
//         $("#writeBtn").on("click", function() {
//             $("#dialog-write").dialog("open");
            
//             // 전체 선택 체크박스 상태 업데이트
//             document.getElementById("selectAllCheckbox").checked = allChecked;
//         });
    </script>
</body>
</html>