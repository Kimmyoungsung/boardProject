<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제주 여행</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
</head>
<body>
<style>
 .navbar-nav .nav-item:nth-child(1) a.nav-link,
    .navbar-nav .nav-item:nth-child(1) a.nav-link:focus,
    .navbar-nav .nav-item:nth-child(1) a.nav-link:hover {
        color: black;
    }

    /* 관광지 메뉴 글자 색 */
    .navbar-nav .nav-item:nth-child(2) a.nav-link,
    .navbar-nav .nav-item:nth-child(2) a.nav-link:focus,
    .navbar-nav .nav-item:nth-child(2) a.nav-link:hover {
        color: black;
    }

    /* 제주 맛집 모음집 메뉴 글자 색 */
    .navbar-nav .nav-item:nth-child(3) a.nav-link,
    .navbar-nav .nav-item:nth-child(3) a.nav-link:focus,
    .navbar-nav .nav-item:nth-child(3) a.nav-link:hover {
        color: black;
    }

    /* 문의하기 메뉴 글자 색 */
    .navbar-nav .nav-item:nth-child(4) a.nav-link,
    .navbar-nav .nav-item:nth-child(4) a.nav-link:focus,
    .navbar-nav .nav-item:nth-child(4) a.nav-link:hover {
        color: black;
    }

</style>
    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-xl navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="/home/index.do">
                <div class="logo" style="width: 112px; height: 60px">
                    <img src="<c:url value='/resources/images/logo.jpg'/>" style="width: 100%; height: 100%" alt="logo img">
                </div>
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <!-- 여행 메뉴 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            전체여행
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
                            <li><a class="dropdown-item" href="https://ijto.or.kr/korean/">제주도 가이드</a></li>
                            <li><a class="dropdown-item" href="https://kr.trip.com/toplist/tripbest/jeju-best-things-to-do-100000012168?allianceid=14887&sid=1621821&ppcid=ckid-_adid-_akid-_adgid-&utm_source=google&utm_medium=cpc&utm_campaign=20263098854&gclsrc=aw.ds&gclid=CjwKCAjwzJmlBhBBEiwAEJyLu57uQZ88ytpo50AaTd5m6S26jQ1KGLBf9whTue9FXue3uJlyjbnjMRoCwM8QAvD_BwE">2023 제주 가볼만한곳 베스트 20</a></li>
                            <li><a class="dropdown-item" href="https://sky.interpark.com/?area=domestic&utm_medium=cpc&utm_source=google&utm_campaign=tour_airdomestic_20210601_paidsearch_pc_cpc&utm_content=consider_34&utm_term=%EC%84%9C%EB%B8%8C%EB%A7%81%ED%81%AC1&gclid=CjwKCAjwzJmlBhBBEiwAEJyLu2xtT1JOHaGwc6XZM3wEut-AIBHzjpLAVsSKRyHM6TfUSoNbHRrQihoCs0sQAvD_BwE">실시간 제주 항공권</a></li>
                        </ul>
                    </li>
                    <!-- 관광지 메뉴 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            관광지
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown2">
                            <li><a class="dropdown-item" href="https://www.jejusi.go.kr/town/udo.do">우도</a></li>
                            <li><a class="dropdown-item" href="https://www.knps.or.kr/portal/main.do">한국산 국립 공원</a></li>
                            <li><a class="dropdown-item" href="https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500469">용두암</a></li>
                        </ul>
                    </li>
                    <!-- 제주 맛집 모음집 메뉴 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            제주 맛집 모음집
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown3">
                            <li><a class="dropdown-item" href="https://www.siksinhot.com/theme/view/1528">현지인 추천 음식</a></li>
                        </ul>
                    </li>
                    <!-- 문의하기 메뉴 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="boardList" id="navbarDropdown4" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            문의하기
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown4">
                            <li><a class="dropdown-item" href="<c:url value="/notice/list.do"/>">공지사항</a></li>
                            <li><a class="dropdown-item" href="<c:url value ="/board/list"/>">게시판</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
  
    <!-- Swiper 슬라이더 -->
<div id="container">
   <div id="middle">
      <div id="slideShow">
      <div id="slides1" class="slides">
      <img src="<c:url value='/resources/images/slide_wrap.jpg'/>" alt="" style="max-width: 100%; height: auto;">
      <img src="<c:url value='/resources/images/slide_wrap1.jpg'/>" alt="" style="max-width: 100%; height: auto;">
      </div>
   </div>
</div>
    
    <!-- 페이지 콘텐츠 -->
    <div class="container">
        <div class="row">
            <!-- Blog entries -->
            <div class="col-lg-8">
                <!-- Featured blog post -->
                <!-- Nested row for non-featured blog posts -->
                <div class="row">
                    <div class="col-lg-6">
                        <!-- 포스트 1 -->
                        <div class="card">
                            <a href="https://www.myrealtrip.com/offers/104638">
                                <img class="card-img-top" src="<c:url value='/resources/images/town.jpg'/>" alt="town" />
                                <div class="card-body">
                                    <h2 class="card-title h4">제주해양레저타운</h2>
                                    <a class="btn btn-success" href="#!">더 보기 →</a>
                                </div>
                            </a>
                        </div>
                        <!-- 포스트 2 -->
                        <div class="card">
                            <a href="https://www.myrealtrip.com/offers/82383">
                                <img class="card-img-top" src="<c:url value='/resources/images/forest.jpg'/>" alt="forest" />
                                <div class="card-body">
                                    <h2 class="card-title h4">제주야자나무숲</h2>
                                    <a class="btn btn-success" href="#!">더 보기 →</a>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <!-- 포스트 3 -->
                        <div class="card">
                            <a href="https://www.myrealtrip.com/offers/99726">
                                <img class="card-img-top" src="<c:url value='/resources/images/gareden.jpg'/>" alt="garden" />
                                <div class="card-body">
                                    <h2 class="card-title h4">스누피가든</h2>
                                    <a class="btn btn-success" href="#!">더 보기 →</a>
                                </div>
                            </a>
                        </div>
                        <!-- 포스트 4 -->
                        <div class="card">
                            <a href="http://jeju.vpass.co.kr/www/tour/search.html?SEARCH_TEXT=%EC%95%84%EC%BF%A0%EC%95%84%ED%94%8C%EB%9D%BC%EB%84%B7&n_media=27758&n_query=%EC%A0%9C%EC%A3%BC%EB%8F%84%EC%95%84%EC%BF%A0%EC%95%84%ED%94%8C%EB%9D%BC%EB%84%B7&n_rank=3&n_ad_group=grp-m001-01-000001023603846&n_ad=nad-a001-01-000000208916291&n_keyword_id=nkw-a001-01-000002244242547&n_keyword=%EC%A0%9C%EC%A3%BC%EB%8F%84%EC%95%84%EC%BF%A0%EC%95%84%ED%94%8C%EB%9D%BC%EB%84%B7&n_campaign_type=1&n_ad_group_type=1&NaPm=ct%3Dljnu8fao%7Cci%3D0yq00016EUbyczKzTeZ6%7Ctr%3Dsa%7Chk%3D13a7f92670651c79c01fe76d9ed56c3c51e9a3bc">
                                <img class="card-img-top" img src="<c:url value='/resources/images/aqua.jpg'/>" alt="aqua">
                                <div class="card-body">
                                    <h2 class="card-title h4">아쿠아플레넷</h2>
                                    <a class="btn btn-success" href="#!">더 보기 →</a>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Side widgets -->
            <div class="col-lg-4">
                <!-- Search widget -->
                <div class="card">
                    <div class="card-header">검색</div>
                    <div class="card-body">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="관광지를 입력하세요" aria-label="Enter search term..." aria-describedby="button-search" />
                            <button class="btn btn-success" id="button-search" type="button">찾기</button>
                        </div>
                    </div>
                </div>
                <!-- 게시판 -->
                <div class="card">
                    <div class="card-header text-center">게시판</div>
                    <c:forEach var="board" items="${board}">
                        <li><a href="#" onclick="dialogDetail(${board.boardid})">${board.title}</a></li>
                    </c:forEach>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <!-- 게시판 목록 -->
                        </ul>
                    </div>
                </div>
                <!-- 공지사항 -->
                <div class="card">
                    <div class="card-header text-center">공지사항</div>
                    <c:forEach var="notice" items="${notice}">
                        <li><a href="#" onclick="dialogDetail(${notice.noticeid})">${notice.title}</a></li>
                    </c:forEach>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <!-- 공지사항 목록 -->
                        </ul>
                    </div>
                </div>
                
                
               </div>
               
                   </div>
        </div>
    </div>

    <!-- 스크립트 및 외부 라이브러리 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="<c:url value='/resources/js/main.js'/>"></script>
</body>
</html>