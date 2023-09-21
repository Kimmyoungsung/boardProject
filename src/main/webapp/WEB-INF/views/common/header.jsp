<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>
        /* 라벨과 입력 필드를 왼쪽으로 정렬 */
        label {
            display: block;
            margin-bottom: 10px; 
            font-size: 14px;
            color: green;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: 200px;
            background-color: #1E82C28;
            border: 1px solid green;
            color: green;
            transition: border-color 0.3s, background-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: blue; /* 포커스 시 테두리 색상 변경 */
            background-color: lightblue; /* 포커스 시 배경 색상 변경 */
        }
        
        fieldset {
            border: 2px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            max-width: 300px;
            margin: 0 auto;
        }
    
        label {
            font-weight: bold;
        }
    
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 5px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
    
        a {
            text-decoration: underline;
            margin-top: 10px;
        }
    </style>


    <header>
        <div id="logo" href="http://localhost:8090/pro1/main.do"></div>
        <div class="header">
            <div class="container">
                <div id="sub_nav">
                    <ul style="display: flex; list-style-type: none">
                        <c:if test="${loginMember == null}">                          
                            <li><a href="javascript:void(0);" id="loginBtn">로그인</a></li>                                     
                            <li><a href="javascript:void(0);" id="findidBts">아이디찾기</a></li>                                     
                            <li><a href="javascript:void(0);" id="findpwdBtn">비밀번호찾기</a></li>
                            <li><a href="javascript:void(0);" id="registerBtn">회원가입</a></li>
                         
                        </c:if>                     
                        <c:if test="${loginMember != null}">
                            <li><a href="#" id="logoutButton">로그아웃</a></li>                        
                            <li><a href="javascript:void(0);" id="myPageBts">마이페이지</a></li>
                       <li><a href="http://localhost:8090/pro1/main.do">돌아가기</a></li>
                       
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    
   <div id="dialog-register" title="회원가입">
        <form id="rester2">
            <fieldset>
                <label for="uid">아이디</label>
                <input type="text" name="uid" id="uid" class="text ui-widget-content ui-corner-all" required><br>
                <input type="button" id="checkId" value="중복검사" style="margin-left: 10px;"> 
       
                <label for="name">이름</label>
                <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" required><br>

                <label for="pwd">비밀번호</label>
                <input type="password" name="pwd" id="pwd" class="text ui-widget-content ui-corner-all" required><br>

                <label for="phone">전화번호</label>
                <input type="text" name="phone" id="phone" class="text ui-widget-content ui-corner-all" required><br>

                <label for="email">이메일</label>
                <input type="text" name="email" id="email" class="text ui-widget-content ui-corner-all" required><br>

                <label for="address">주소</label>
                <input type="text" name="address" id="address" class="text ui-widget-content ui-corner-all" required><br>

                <label for="age">나이</label>
                <input type="number" name="age" id="age" class="text ui-widget-content ui-corner-all" required><br>

                <label for="gender">성별</label>
                <input type="text" name="gender" id="gender" class="text ui-widget-content ui-corner-all" required><br>
            </fieldset>
        </form>
    </div>
   
    <div id="dialog-login" title="로그인">
        <form id="login-form">
            <fieldset>
                <div>
                    <label for="uid">아이디</label>
                    <input type="text" name="uid" id="loginId" class="text ui-widget-content ui-corner-all" required>
                    
                    <label for="pwd">비밀번호</label>
                    <input type="password" name="pwd" id="loginpwd" class="text ui-widget-content ui-corner-all" required>
           
                </div>
            </fieldset>
        </form>
    </div>

		<div id="dialog-findid" title="아이디찾기">
	    	<form id="findIdForm"> 	
		        <fieldset>
		            <label for="name">이름</label>
		            <input type="text" name="name" id="findname" class="text ui-widget-content ui-corner-all" required><br>
		
		            <label for="email">이메일</label>
		            <input type="text" name="email" id="findemail" class="text ui-widget-content ui-corner-all" required><br>
		        </fieldset>
	   		</form>
		</div>
		

	<div id="dialog-find-password" title="비밀번호찾기">
	    <form id="findPasswordForm"> 
        <fieldset>
            <label for="uid">아이디</label>
            <input type="text" name="uid" id="find-passwordname" class="text ui-widget-content ui-corner-all" required><br>

            <label for="email">이메일</label>
            <input type="text" name="email" id="find-passwordemail" class="text ui-widget-content ui-corner-all" required><br>
        </fieldset>
	    </form>
	</div>
		
	<div id="dialog-myPage" title="마이페이지">
      	  <form id="myPageFrom">
            <fieldset>
                <label for="uid">아이디</label>
                <input type="text" name="uid" id="myPageuid" class="text ui-widget-content ui-corner-all" value="${loginMember.uid}" required> 
       
                <label for="name">이름</label>
                <input type="text" name="name" id="myPagename" class="text ui-widget-content ui-corner-all" value="${loginMember.name}" required><br>

                <label for="pwd">비밀번호</label>
                <input type="password" name="pwd" id="myPagepwd" class="text ui-widget-content ui-corner-all" value="${loginMember.pwd}" required><br>

                <label for="phone">전화번호</label>
                <input type="text" name="phone" id="myPagephone" class="text ui-widget-content ui-corner-all" value="${loginMember.phone}" required><br>

                <label for="email">이메일</label>
                <input type="text" name="email" id="myPageemail" class="text ui-widget-content ui-corner-all" value="${loginMember.email}" required><br>

                <label for="address">주소</label>
                <input type="text" name="address" id="myPageaddress" class="text ui-widget-content ui-corner-all" value="${loginMember.address}" required><br>

                <label for="age">나이</label>
                <input type="number" name="age" id="myPageage" class="text ui-widget-content ui-corner-all" value="${loginMember.age}" required><br>

                <label for="gender">성별</label>
                <input type="text" name="gender" id="myPagegender" class="text ui-widget-content ui-corner-all" value="${loginMember.gender}" required><br>
			</fieldset>
			</form>
			</div>


<!--    			<div id="dialog-myPage2" title="수정하기"> -->
<!--       	  <form id="EditFrom"> -->
<!--             <fieldset> -->
<!--                 <label for="uid">아이디</label> -->
<%--                 <input type="text" name="uid" id="myPageEdit" class="text ui-widget-content ui-corner-all" value="${loginMember.uid}" required>  --%>
       
<!--                 <label for="name">이름</label> -->
<%--                 <input type="text" name="name" id="myPageEdit1" class="text ui-widget-content ui-corner-all" value="${loginMember.name}" required><br> --%>

<!--                 <label for="pwd">비밀번호</label> -->
<%--                 <input type="password" name="pwd" id=myPageEdit2" class="text ui-widget-content ui-corner-all" value="${loginMember.pwd}" required><br> --%>

<!--                 <label for="phone">전화번호</label> -->
<%--                 <input type="text" name="phone" id="myPageEdit3" class="text ui-widget-content ui-corner-all" value="${loginMember.phone}" required><br> --%>
   	
<!-- 		</fieldset> -->
<!-- 		</form> -->
<!-- 		</div> -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 
   	
    <script>
   	 
	   	const dialogRegister = $("#dialog-register").dialog({
	        autoOpen: false,
	        modal: true,
	        width: 500,
	        height: 400,
	        buttons: {
	          
	        	"회원가입": function() {
	            	submitRegistrationForm();
	            	
	                //dialogRegister.dialog("close");
	            },
	            "취소": function() {
	                dialogRegister.dialog("close");
	            }
	        },
	        close: function() {
	            $("#rester2")[0].reset();
	        }
	    });
		    
	    $("#registerBtn").on("click", function() {
	        dialogRegister.dialog("open");
	    });
		
	    function submitRegistrationForm() {
            const uid = $("#uid").val();
            const name = $("#name").val();
            const pwd = $("#pwd").val();
            const phone = $("#phone").val();
            const email = $("#email").val();
            const address = $("#address").val();
            const age = $("#age").val();
            const gender = $("#gender").val();
			
            $.ajax({
                url: "<c:url value='/member/register'/>",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify({
                	uid: uid,
                    name: name,
                    pwd: pwd,
                    phone: phone,
                    email: email,
                    address: address,
                    age: age,
                    gender: gender
                }),
                success: function(response) {
                    alert(response.message)
                },
                error: function(error) {
                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        }
	    
        
        // 아이디 중복 검사 버튼 클릭 시 AJAX 요청
       $("#checkId").on("click", function() {
            const uid = $("#uid").val(); 
            var send = {
            		uid : uid
            }
            fetch("<c:url value='/member/checkId'/>", {
            	 method: "POST",
            	  headers: {
            	    "Content-Type": "application/json",
            	  },
            	  body: JSON.stringify(send)
            })
            .then(response=> response.json())
            .then(function (data) {
            	if (data.status) {
                    alert("사용 가능한 아이디입니다.");
                } else {
                    alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력하세요.");
                }
			})
          /*   $.ajax({
                url: "<c:url value='member/checkId'/>",
                type: "POST", 
                dataType: "json", 
                contentType: "application/json;",
                data: JSON.stringify({
                    uid: uid 
                }),
                success: function(response) {
                    if (response.status) {
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력하세요.");
                    }
                },
                error: function(error) {
                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                }
            }); */
        });
 
        // 로그인 다이얼로그 설정
        
        const dialogLogin = $("#dialog-login").dialog({
            autoOpen: false,
            modal: true,
            width: 500,
            height: 400, // 로그인 폼에 필요한 높이로 조절해주세요.
            buttons: {
              

            	"로그인": function() {
//             		alert("ddd");
                    const id = $("#loginId").val();
                    const pwd = $("#loginpwd").val();

                    
                    
                    if (id === "") {
                        alert("아이디를 입력해주세요.");
                        $("#loginId").focus();
                        return;
                    }

                    if (pwd === "") {
                        alert("비밀번호를 입력해주세요.");
                        $("#loginpwd").focus();
                        return;
                    }

                    
                    const param = {
                        uid: id,   //uid는 멤버 DTO이고 
                        pwd: pwd
                    };

                    
                    fetch("<c:url value='/member/login.do'/>", {
                   	 method: "POST",
                   	  headers: {
                   	    "Content-Type": "application/json",
                   	  },
                   	  body: JSON.stringify(param)
                   })
                   .then(response=> response.json())
                   .then(function (data) {
                	   if (data.status) {
                           alert("로그인 성공!");
                           location.href = "<c:url value='/main.do'/>";
                       } else {
                           alert("로그인 실패!");
                       }
       			})
                    
                    
                    
              /*       // 로그인 AJAX 요청
                    $.ajax({
                        type: "POST",
                        url: "<c:url value='/member/login.do'/>", //컨트롤러 (리퀘스트 매핑 value)
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        data: JSON.stringify(param),
                        success: function(response) {
                            if (response.status) {
                                alert("로그인 성공!");
                                location.href = "<c:url value='/main.do'/>";
                            } else {
                                alert("로그인 실패!");
                            }
                        },
                        error: function() {
                            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                        }
                    }); */
                },
               
             
                close: function() {
                    $("#login-form")[0].reset(); // 다이얼로그가 닫힐 때 폼 초기화
                    
                    
                }
            }
        });

        // 로그인 버튼 클릭 시 다이얼로그 열기
        $("#loginBtn").on("click", function() {
            dialogLogin.dialog("open");
        });

        // 로그아웃 버튼 클릭 시 AJAX 요청
        $("#logoutButton").on("click", function() {
            // 서버에 로그아웃 요청을 보냅니다.
            $.ajax({
                url: "<c:url value='/member/logout'/>", 
                type: "POST",
                dataType: "json", 
                success: function(response) {
                    if (response.status) {
                        // 로그아웃 성공
                        alert("로그아웃되었습니다.");
                        location.reload();
                    } else {
                        alert("로그아웃 실패!");
                    }
                },
                
                
                
                error: function(error) {
                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    

			// 아이디 찾기 다이얼로그 설정
		
			const dialogFindId = $("#dialog-findid").dialog({
			    autoOpen: false,
			    modal: true,
			    width: 500,
			    height: 400,
			    buttons: {
			      
			    	"아이디 찾기": function() {
			            // 아이디 찾기 양식 제출 함수 호출
			            submitFindIdForm();submitFindIdForm
			        },
			        
			       	 "취소": function() {
			            dialogFindId.dialog("close");
			        }
			    },
			    close: function() {
			        $("#findIdForm")[0].reset(); // 다이얼로그가 닫힐 때 폼 초기화
			    }
			});
		
			// 아이디 찾기 버튼 클릭 시 다이얼로그 열기
			$("#findidBts").on("click", function() {
			    dialogFindId.dialog("open");
			});

			// 아이디 찾기 양식 제출 함수
			function submitFindIdForm() {
			    const email = $("#findIdForm #findemail").val();
			    const name = $("#findIdForm #findname").val();
			
			    $.ajax({
			    	url: "<c:url value='/member/findUserId'/>",
			        type: "POST",
			        contentType: "application/json", 
			        data: JSON.stringify({ email: email, name: name }), 
			        success: function(response) {
			            if (response.status) {
			                alert(response.message); 
			            } else {
			                alert("해당 정보로 아이디를 찾을 수 없습니다.");
			            }
			            dialogFindId.dialog("close");
			        },
			        error: function(error) {
			            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
			        }
			    });
			}

			//비밀번호 찾기
			
			const dialogFindPassword = $("#dialog-find-password").dialog({
			    autoOpen: false,
			    modal: true,
			    width: 500,
			    height: 400,
			    buttons: {
			        "비밀번호 찾기": function() {
			            // 비밀번호 찾기 양식 제출 함수 호출
			            submitFindPasswordForm();
			        },
			        "취소": function() {
			            dialogFindPassword.dialog("close");
			        }
			    },
			    close: function() {
			        $("#findPasswordForm")[0].reset(); // 다이얼로그가 닫힐 때 폼 초기화
			    }
			});
			
			
			// 비밀번호 찾기 버튼 클릭 시 다이얼로그 열기
			
			$("#findpwdBtn").on("click", function() {
			    dialogFindPassword.dialog("open");
			});

			// 비밀번호 찾기 양식 제출 함수
			function submitFindPasswordForm() {
			    const uid = $("#findPasswordForm #find-passwordname").val();
			    const email = $("#findPasswordForm #find-passwordemail").val();
			
			    // AJAX로 비밀번호 찾기 요청 보내기
			    $.ajax({
			        url: "<c:url value='/member/findPassword'/>", // 비밀번호 찾기 처리를 수행하는 엔드포인트로 수정하세요.
			        type: "POST", // POST 또는 GET 방식을 선택하세요.
			        contentType: "application/json", 
			        dataType: "json", // 서버에서 JSON 응답을 받기 위해 지정합니다.
			        data: JSON.stringify({
			        	uid: uid,
			            email: email
			        }),
			        success: function(response) {
			            if (response.status) {
			                // 비밀번호를 사용자에게 보여줌
			                alert(response.message);
			            } else {
			                // 비밀번호를 찾지 못한 경우
			                alert("해당 정보로 비밀번호를 찾을 수 없습니다.");
			            }
			            dialogFindPassword.dialog("close");
			        },
			        error: function(error) {
			            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
			        }
			    });
			}
	 
			
			// 마이페이지 다이어로그 열기
			$("#myPageBts").on("click", function() {
			    dialogMypage.dialog("open");
			});

			const dialogMypage = $("#dialog-myPage").dialog({
			    autoOpen: false,
			    modal: true,
			    width: 500,
			    height: 400,
			    buttons: {
			    	  "수정하기": function() {
			              submitdialogMypageForm();
			          },
			          "탈퇴하기": function() {
			              submitDeleteProfileForm("close");
			        }
			    },
			    close: function() {
// 			        $("#myPageFrom")[0].reset(); // 다이얼로그가 닫힐 때 폼 초기화
			    }
			});

			// 수정하기 
			function submitdialogMypageForm() {
			    // 폼에서 사용자 정보 가져오기
			    const name = $("#myPageFrom #myPagename").val();
			    const pwd = $("#myPageFrom #myPagepwd").val();
			    const phone = $("#myPageFrom #myPagephone").val();
			    const email = $("#myPageFrom #myPageemail").val();
			    const myPageaddress = $("#myPageFrom #myPageaddress").val();
			    const myPageage = $("#myPageFrom #myPageage").val();
			    const myPagegender = $("#myPageFrom #myPagegender").val();

			    const updatedData = {
			        uid: "${loginMember.uid}",
			        name: name,
			        pwd: pwd,
			        phone: phone,
			        email: email,
			        address: myPageaddress,
			        age: myPageage,
			        gender: myPagegender
			    };

			    // 서버로 데이터를 전송하고 처리하는 AJAX 요청
			    $.ajax({
			        type: "POST",
			        url: "<c:url value='/member/updateProfile'/>", // 서버 요청 URL을 여기에 입력
			        dataType: "json",
			        contentType: "application/json",
			        data: JSON.stringify(updatedData),
			        
			        success: function(response) {
			            if (response.status) {
			                alert("수정이 완료되었습니다.");
			                dialogMypage.dialog("close");
			                dialogMypage.dialog("open");
			            }
			        },
			        error: function(error) {
			            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
			        }
			    });
			}

// 					// 수정완료 업로드 확인 
// 					$("#myPageuploadBtn").on("click", function () {
// 		    	dialogMypageuploadBts.dialog("open");
// 				});
				
// 				const dialogMypageuploadBts = $("#dialog-dialogUpdate2").dialog({
// 				    autoOpen: false,
// 				    modal: true,
// 				    width: 500,
// 				    height: 400,
// 				    buttons: {
// 				        "수정완료": function () {
// 				            EditFrom();
// 				        },
// 				        "취소": function () {
// 				            dialogMypageuploadBts.dialog("close");
// 				        },
// 				    },
// 				});

			    // 탈퇴하기
			    
			    function submitDeleteProfileForm() {
			     const name = $("#myPageFrom #myPagename").val();
			    
			     const deletData = {uid: "${loginMember.uid}"};

			     
			        // 서버로 탈퇴 요청을 전송하는 AJAX 요청
			        $.ajax({
			            type: "POST", // POST 요청
			            url: "<c:url value='/member/leaveMember'/>",// 서버 요청 URL을 여기에 입력
			            dataType: "json",
			            contentType: "application/json",
			            data: JSON.stringify(deletData),
			            success: function(response) {
			                if (response.status) {
			                    alert("탈퇴가 완료되었습니다.");
			                  
			                }
			            },
			            error: function(error) {
			                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
			            }
			        });
			    }

    </script>
