<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대보3기 게시판</title>
<%--   <link rel="stylesheet" href="<c:url value='/resources/css/combined.css'/>"> --%>

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

.board-list-table th, .board-list-table td {
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

.contTop {
	margin: 50px auto;
	padding-left: 100px;
	width: 1000px;
	height: 40px;
}

.contTop label {
	height: 40px;
	line-height: 40px;
	margin: 0 10px;
}

.contTop #searchTitle {
	width: 100%;
	padding: 5px;
	margin: 0;
	board: 1px solid #ccc;
	boarder-radius: 3px;
	height: 40px;
	line-height: 40px;
	box-sizing: border-box;
}

.contTop #insertBtn {
	width: 70px;
	height: 40px;
	margin-left: -250px
}

.button_wrap {
	padding: 0 47px;
}

.button_wrap button {
	float: right;
	height: 40px;
	width: 75px;
}

/* 		내가 추가한 부분  */
.card-text
		.card-img
		
		
		.card-text, .card
		
		
		.card-text, .card-img-bottom {
	display: none;
}

.card:hover .card-text, .cardLhover .card-img-bottom {
	displa: block;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>
	<form name="pageForm" id="pageForm"
		action="<c:url value='/board/list'/>" method="post">
		<input type="hidden" name="pageNo" id="pageNo"
			value="${result.board.pageNo}" /> <input type="hidden"
			name="searchTitle" id="searchTitle"
			value="${result.board.searchTitle}" /> <input type="hidden"
			name="pageLength" id="pageLength" value="${result.board.pageLength}" />
	</form>

	<form id="mForm" name="mForm" action="<c:url value='/board/list'/>"
		method="post">
		<input type="hidden" name="pageNo" id="pageNo"
			value="${result.board.pageNo}" />
		<div class="contTop">
			<div style="width: 800px; float: left;">
				<div
					style="display: flex; margin: 0px auto; height: 40px; width: 70%; justify-align: center">
					<label>건수: </label> <select name="pageLength" id="pageLength"
						style="height: 40px;">
						<option value="10"
							${result.board.pageLength == 10 ? 'selected="selected"' : ''}>10건</option>
						<option value="20"
							${result.board.pageLength == 20 ? 'selected="selected"' : ''}>20건</option>
						<option value="50"
							${result.board.pageLength == 50 ? 'selected="selected"' : ''}>50건</option>
						<option value="100"
							${result.board.pageLength == 100 ? 'selected="selected"' : ''}>100건</option>
					</select> <label>제목 : </label> <input type="text" name="searchTitle"
						id="searchTitle" value="${result.board.searchTitle}"
						style="flex: 1"> <input type="submit" value="검색"
						style="padding: 10px 20px; margin: 0 10px; height: 40px;">

				</div>
			</div>

			<button id="insertBtn" type="button">등록</button>
		</div>
		<table border="1" class="board-list-table">
			<tr id="boardItem" style="display: none;">
				<td id="boardid"></td>
				<td id="title"></td>
				<td id="writerUid"></td>
				<td id="regDate"></td>
				<td id="viewCount"></td>
			</tr>

			<tr>

				<th style="width: 10%">글번호</th>
				<th style="width: 25%">제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 20%">작성날짜</th>
				<th style="width: 10%">조회수</th>
				<th style="width: 10%">삭제</th>
				<th style="width: 10%"><input type="checkbox"
					id="selectAllCheckbox"> 전체 선택</th>
			</tr>


			<c:forEach var="board" items="${result.list}">
				<tr class="board-list-tr">

					<td>${board.boardid}</td>
					<td style="text-align: left"><span
						style="padding-left:${(board.level-1)*20}px"></span> ${board.level != 1 ? "[답변] " : ""}
						<a onclick="dialogDetail(${board.boardid})">${board.title}</a></td>
					<td>${board.writer_uid}</td>
					<td>${board.reg_date}</td>
					<td>${board.view_count}</td>
					<td><button type="button" id="deleteBtn">삭제</button></td>
					<td><input type="checkbox" class="checkbox-item"
						onclick="checkSelectAll()" value="${board.boardid}"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form>


	<br>
	<div class="button_wrap">
		<button id="deleteSelected">선택 삭제</button>
	</div>
	<div style="text-align: center; margin-top: 20px;">
		<c:if test="${result.board.navStart != 1}">
			<a href="javascript:jsPageNo(${result.board.navStart-1})"
				style="padding: 10px; border:;"> &lt; </a>
		</c:if>
		<c:forEach var="item" begin="${result.board.navStart}"
			end="${result.board.navEnd}">
			<c:choose>
				<c:when test="${result.board.pageNo != item }">
					<a href="javascript:jsPageNo(${item})"
						style="padding: 10px; border:;">${item}</a>
				</c:when>
				<c:otherwise>
					<strong style="font-size: 2rem">${item}</strong>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${result.board.navEnd != result.board.totalPageSize}">
			<a href="javascript:jsPageNo(${result.board.navEnd+1})"
				style="padding: 10px; border:;"> &gt; </a>
		</c:if>
	</div>

	<div id="insertBoardFrom" title="게시판 등록">
		<div id="insertContent">
			<input type="text" id="inTitle" placeholder="제목"><br>
			<textarea id="inContents" placeholder="내용"></textarea>
			<br>
		</div>
	</div>




	<div id="detail" title="글 상세보기">
		<div class="detail">
			<input type="hidden" name="boardid" id="boardid2"
				value="${board.boardid}" />
			<h3 id="title2">[ ]</h3>
			<hr>
			<br>
			<div class="meta-info" id="info2">
				작성자 : <span id="writerUid2">${board.writer_uid}</span> | 작성날짜 : <span
					id="reg_date2">${board.reg_date}</span> | 조회수 : <span
					id="view_count2">${board.view_count}</span>

			</div>
			<div class="contents" id="contents2">${board.contentsHTML}</div>
			<div id="commentList"></div>
		</div>



		<!--<댓글폼> -->

		<div id="insertCommentBoard" title="댓글 등록">
			<div class="card-footer">
				<form id="commentForm">
					<div class="form-group">
						<input type="text" class="form-control" id="commentText"
							placeholder="댓글을 입력하세요" required>
					</div>
					<button type="submit" class="insertcomment">작성</button>
				</form>
				<div class="comments mt-3"></div>
			</div>
		</div>
	</div>


	<div id="update">
		<h1>공지사항 수정</h1>
		<form id="updateBoardForm" name="updateBoardForm" method="post">

			<input type="text" name="title" id="updateBoardTitle"
				placeholder="제목" class="text_title" value="${board.title}"><br>
			<textarea name="contents" id="updateBoardContents" placeholder="내용"
				class="board_ct">${board.contents}</textarea>
			<p>
				<input type="hidden" id="writerUid" name="updateBoardWriterUid"
					value="${loginMember.uid}" readonly>
			</p>
		</form>
	</div>


	<div id="reply" title="답글 등록">
		<div id="replyContent">
			<input type="text" id="replyTitle" placeholder="제목"><br>
			<textarea id="replyContents" placeholder="내용"></textarea>
			<br>
		</div>
	</div>


	<script>



/*--------------------------------------------버튼-------------------------------------------*/
 
//게시판 등록
     $("#insertBtn").on("click", function(){
        insertBoardFrom.dialog("open");
     });

/*--------------------------------------------대화상자-------------------------------------------*/
    

    // 게시판 등록
      const insertBoardFrom =$("#insertBoardFrom").dialog({
      autoOpen: false,
      modal : true,
      width: 600,
      height: 500,
      buttons: {
      
         "등록": insertBoard,
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
               const boardid =$("#boardid2").text();
               
               $("#updateBoardTitle").val(title);
               $("#updateBoardContents").val(contents);
               
               boardUpdate.dialog("open");
               
            },            
            "삭제" : dialogDelete,                 
            "답글달기":  function(){
               replyBoardForm.dialog("open");
            },
            
            Close: function () {
                $(this).dialog("close");
            }
        }

      });

       
       // 공지사항 수정하기
         const boardUpdate =$("#update").dialog({
         autoOpen: false,
         modal : true,
         width: 600,
         height: 500,
         buttons: {      
            "수정": dialogUpdate,
            Close: function(){
               $(this).dialog("close");         
            },
         }
      });

	      
	 //  답변 등록
	    const replyBoardForm =$("#reply").dialog({
	    autoOpen: false,
	    modal : true,
	    width: 600,
	    height: 500,
	    buttons: {
	    
	       "등록": replyBoard,
	       Close: function(){
	          $(this).dialog("close");
	       },
	    }
	 })
	 
	   
	// 댓글 등록 
	document.addEventListener("DOMContentLoaded", function() {
    const commentForm = document.getElementById("commentForm"); // 폼 요소 찾기
    const commentsContainer = document.querySelector("comments"); // 버튼 요소 찾기

    // 폼 제출 이벤트 핸들러 등록
    commentForm.addEventListener("submit", function(event) {
        event.preventDefault(); // 폼 기본 동작 방지 (페이지 새로고침 방지)

        insertcomment();
    });

    // insertcomment() 함수 정의
    function insertcomment() {
        
    	//댓글 작성자 정보 설정 (예시)
    	
    	const insertUid = "${loginMember.uid}";
        const writer_uid = insertUid;

        
        const inContents = document.getElementById("inContents");
        const commentText = inContents.value;
        
        const param = {
        		 writer_uid: writer_uid,
                 contents: commentText,
                 
        };
        
        // 서버에 댓글 데이터 전송
        fetch("<c:url value='/comment/insertcomment'/>", {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(param),
        })
        .then(response => response.json())
        .then(json => {
            alert(json.message);
            
            // 작성한 댓글을 화면에 표시
            const commentElement = document.createElement("div");
            commentElement.textContent = commentText;
            commentsContainer.appendChild(commentElement);

            // 입력 필드 초기화
            inContents.value = "";
        });
    }
});
     

	 
/*--------------------------------------------실행부-------------------------------------------*/   
   
	// 댓글 등록 함수
	function insertcomment() {
	    const insertUid = "${loginMember.uid}";
	    const writer_uid = writer_uid; // writer_uid 변수 정의
	
	    const param = {
	        writer_uid: writer_uid,
	        title: inTitle.value,
	        contents: inContents.value, // id값을 가져옴.
	    };
	
	    fetch("<c:url value='/comment/insertcomment'/>", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json; charset=UTF-8",
	        },
	        body: JSON.stringify(param),
	    })
	    .then(response => response.json())
	    .then(json => {
	        alert(json.message);
  
	    });
	}

	  function insertBoard(){

          const insertUid = "${loginMember.uid}";
          
          const param = {
                writer_uid : insertUid,
                title   : inTitle.value,
                contents : inContents.value, // id값을 가져옴.

          };
          
           fetch("<c:url value='/board/insert'/>", {
               method: "POST",
               headers: {
                   "Content-Type": "application/json; charset=UTF-8",
               },
               body: JSON.stringify(param)
           })
           .then(response => response.json())
           .then(json => {
                  alert(json.message);
                  location.href="<c:url value='/board/list'/>";
           });
       }

// 상세보기
   function dialogDetail(boardid){
        
       const boardid2 = document.querySelector("#boardid2");
       const title2 = document.querySelector("#title2");
       const contents2 = document.querySelector("#contents2");
       const writer_uid2 = document.querySelector("#writerUid2");
       const reg_date2 = document.querySelector("#reg_date2");
       const view_count2 = document.querySelector("#view_count2");
            
         const param = {
            boardid : boardid
         };
         
          fetch("<c:url value='/board/detail'/>", {
              method: "POST",
              headers: {
              "Content-Type" : "application/json; charset=UTF-8",
              },
              body: JSON.stringify(param)
          })
          .then(response => response.json())
          .then((json) => {
               boardid2.innerText = json.board.boardid;  
               title2.innerText = json.board.title;  
               contents2.innerText = json.board.contents;  
               writerUid2.innerText = json.board.writer_uid;  
               reg_date2.innerText = json.board.reg_date;  
               view_count2.innerText = json.board.view_count;
               console.log(json.commentList);
               loadInitComment(json.commentList); // loadInitComment 함수명임.
                  $("#detail").dialog("open");
           });
     return false;   
      }
     
   //수정하기
   function dialogUpdate() {
      
      const boardid3 = $("#boardid2").text();
       const title3 = $("#updateBoardTitle").val();
       const contents3 = $("#updateBoardContents").val();
       const writerUid3 = $("#writerUid").val(); 
       
       const param = {
          boardid: boardid3,
           title: title3,
           contents: contents3,
           writer_uid: writerUid3,
       };
       
       
       fetch("<c:url value='/board/revice'/>", {
           method: "POST",
           headers: {
               "Content-Type": "application/json; charset=UTF-8",
           },
           body: JSON.stringify(param)
       })
       .then(response => response.json())
       .then(json => {
               alert(json.message);
               boardUpdate.dialog("close");
               
               // 수정이 성공한 경우에 업데이트된 내용을 화면에 반영
               $("#title2").text(title3);
               $("#contents2").text(contents3);
       });
   }


   function dialogDelete(){
         
      const boardid4 = $("#boardid2").text();
       
       const param = {
           boardid : boardid4
          
       };
       
        fetch("<c:url value='/board/delete'/>", {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(param)
        })
        .then(response => response.json())
        .then(json => {
               alert(json.message);
               location.href="<c:url value='/board/list'/>";
        });
    }

// 답변달기
   function replyBoard(){

          const insertUid = "${loginMember.uid}";
          const replyboardid = $("#boardid2").text();
          
          const param = {
              boardid : replyboardid,
             writer_uid : insertUid,
             title   : replyTitle.value,
             contents : replyContents.value, // id값을 가져옴.

          };
          
           fetch("<c:url value='/board/reply'/>", {
               method: "POST",
               headers: {
                   "Content-Type": "application/json; charset=UTF-8",
               },
               body: JSON.stringify(param)
           })
           .then(response => response.json())
           .then(json => {
                  alert(json.message);
                  location.href="<c:url value='/board/list'/>";
                  
                  sendEmail(replayEmail);
           });
}	

      
/*--------------------------------------------기타-------------------------------------------*/
 
   // 페이지 번호 변경 함수
        function jsPageNo(pageNo) {
            document.querySelector("#pageForm > #pageNo").value = pageNo;
            document.querySelector("#pageForm").submit();
   }
   
/*--------------------------------------------댓글-------------------------------------------*/
  
//리스트
 function loadInitComment(commentList) {
//   const commentListHTML = document.querySelector("#commentList");
  const commentListHTML = $("#commentList");
	
  commentList.forEach(comment => {
    console.log("댓글 데이터: ", comment);
    const commentItem = document.createElement("div");
    commentItem.className = "comment-item";

    commentItem.innerHTML =
      "<input type='text' value='" + comment.commentid + "' class='comment-id'>" +
      "<p>작성자 " + comment.writer_uid + "</p>" +
      "<p>작성일 " + comment.reg_date + "</p>" +
      "<p>내용 " + comment.contents + "</p>" +
      "<button type='button'>수정</button>" +
      "<button type='button'>삭제</button>";

      commentListHTML.append(commentItem);
  });
}


//  function loadInitComment(commentList) {
// 	  const commentListHTML = $("#commentList");

// 	  commentList.forEach(function (comment) {
// 	    console.log("댓글 데이터: ", comment);
// 	    const commentItem = $("<div>").addClass("comment-item");

// 	    commentItem.html
// 	      "<input type='text' value='" + comment.commentid + "' class='comment-id'>" +
// 	      "<p>작성자 " + comment.writer_uid + "</p>" +
// 	      "<p>작성일 " + comment.reg_date + "</p>" +
// 	      "<p>내용 " + comment.contents + "</p>" +
// 	      "<button type='button'>수정</button>" +
// 	      "<button type='button'>삭제</button>";

// 	    commentListHTML.appendChild(commentItem);
// 	  });
// 	}


</script>
</body>
</html>

