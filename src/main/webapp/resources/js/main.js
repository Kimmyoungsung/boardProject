	
// 메인 메뉴바 드롭 부분
    $(document).ready(function() {
    	  $('.dropdown-menu').hide(); // 초기에 드롭다운 메뉴를 숨김

    	  $('.dropdown-toggle').click(function(e) {
    	    e.preventDefault();
    	    var dropdownMenu = $(this).next('.dropdown-menu');
    	    $('.dropdown-menu').not(dropdownMenu).hide(); // 다른 드롭다운 메뉴 숨김
    	    dropdownMenu.toggle(); // 클릭한 드롭다운 메뉴 보이기
    	  });

    	  $(document).click(function(e) {
    	    if (!$(e.target).closest('.nav-item').length) {
    	      $('.dropdown-menu').hide(); // 다른 영역을 클릭하면 드롭다운 메뉴 숨김
    	    }
    	  });
    	});
    
    
    // 게시판 상세보기 다이어로그
    
    /* 게시판 상세 */
//	$(document).ready(function() {
//		$("#detail").dialog({
//		    autoOpen: false,
//		    modal: true,
//		    width: 800,
//		    height: 500,
//		    buttons: {
//		        "수정": function() {
//		        	
//		        	const title = $("#title2").text();
//		        	const contents = $("#contents2").text();
//		        	
//		        	$("#title3").val(title);
//		        	$("#contents3").val(contents);
//		        	console.log(title);
//		        	console.log(contents);
//		        	
//		            $("#update").dialog("open");
//		            
//		        },
//		        "삭제": function() {
//		            dialogDelete(); // noticeid를 함수에 전달
//		        },
//		        Close: function() {
//		            $(this).dialog("close");
//		        }
//		    }
//		});
//	});
//	
//	/* 글 상세 패치 코드 */
//	function dialogDetail(boardid) {
//		alert("asdasdas");
//	 	const noticeid2 = document.querySelector("#noticeid2");
//		const title2 = document.querySelector("#title2");
//		const contents2 = document.querySelector("#contents2");
//		const writer_uid2 = document.querySelector("#writer_uid2");
//		const reg_date2 = document.querySelector("#reg_date2");
//		const view_count2 = document.querySelector("#view_count2");
//
//		
//		const param = {
//		        noticeid: noticeid
//		      };
//
//		      fetch("<c:url value='/notice/detail.do'/>", {
//		        method: "POST",
//		        headers: {
//		          "Content-Type": "application/json; charset=UTF-8",
//		        },
//		        body: JSON.stringify(param),
//		      })
//		      .then((response) => response.json())
//		      .then((json) => {
//		    	   noticeid2.innerText = json.noticeid;  
//		    	   title2.innerText = json.title;  
//		    	   contents2.innerText = json.contents;  
//		    	   writer_uid2.innerText = json.writer_uid;  
//		    	   reg_date2.innerText = json.reg_date;  
//		    	   view_count2.innerText = json.view_count;  
//		       	   $("#detail").dialog("open");
//		      });
//		
//		return false;
//		}
//	}	
    
    
