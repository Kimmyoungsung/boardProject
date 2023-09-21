//$(function() {
//    // 등록 다이얼로그 설정
//    insertDialog = $("#insert-Form").dialog({
//        autoOpen: false,
//        height: 600,
//        width: 450,
//        modal: true,
//        buttons: {
//            "게시글 등록": addNotice,
//            "취소": function() {
//                insertDialog.dialog("close");
//            }
//        },
//        close: function() {
//            $("#insertNotice")[0].reset();
//        }
//    });
//
//    // 등록 버튼 클릭 시 등록 다이얼로그 열기
//    $("#addNoticeBtn").click(function() {
//        insertDialog.dialog("open");
//    });
//
//    // 삭제 버튼 클릭 시 선택한 항목 삭제
//    $("#deleteBtn").click(function() {
//        validateAndDelete();
//    });
//
//    // 게시글 등록 함수
//    function addNotice() {
//        const formData = new FormData($("#insertNotice")[0]);
//
//        $.ajax({
//            type: "POST",
//            url: "/board/addNotice.do", // 등록 처리를 수행할 URL
//            data: formData,
//            processData: false,
//            contentType: false,
//            success: function(response) {
//                if (response.status) {
//                    alert("게시글이 등록되었습니다.");
//                    insertDialog.dialog("close");
//                    // 등록 후 필요한 처리를 추가할 수 있습니다.
//                } else {
//                    alert("게시글 등록에 실패했습니다.");
//                }
//            }
//        });
//    }
//
//    // 게시글 삭제 함수
//    function deleteBoards(deleteIds) {
//        $.ajax({
//            type: "POST",
//            url: "/board/delete.do", // 삭제 처리를 수행할 URL
//            data: JSON.stringify({ deleteIds: deleteIds }),
//            contentType: "application/json",
//            success: function(response) {
//                if (response.status) {
//                    alert(response.message);
//                    window.location.href = '/board/list.do';
//                    // 삭제 후 필요한 처리를 추가할 수 있습니다.
//                } else {
//                    alert(response.message);
//                }
//            }
//        });
//    }
//
//    // 삭제 전 유효성 검사 및 삭제 함수 호출
//    function validateAndDelete() {
//        let deleteIds = [];
//        $(".checkbox2:checked").each(function() {
//            deleteIds.push(parseInt($(this).val()));
//        });
//
//        if (deleteIds.length === 0) {
//            alert("삭제할 대상을 선택해 주세요.");
//        } else {
//            if (confirm("선택한 게시글을 삭제하시겠습니까?")) {
//                deleteBoards(deleteIds);
//            }
//        }
//    }
//
//    // 게시글 목록 불러오는 함수
//    function loadBoardList() {
//        // AJAX 요청을 통해 서버에서 게시글 목록 데이터를 가져와서 화면에 렌더링
//        // 필요한 코드를 추가하세요.
//    }
//
//    // 초기 로딩 시 게시글 목록 불러오기
//    loadBoardList();
//});
