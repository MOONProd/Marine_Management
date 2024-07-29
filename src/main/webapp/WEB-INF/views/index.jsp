<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marine Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/index_styles.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    
</head>
<body>
    <header>
        <div class="container">
            <div class="logo"><a href="/">MOONPOOL</a></div>
            <nav>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/form">Register</a></li>
                    <li><a href="/list_protect">Protect</a></li>
                    <li><a href="/list_all">All</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <section class="hero">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium1.jpg" alt="Aquarium 1">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium2.jpg" alt="Aquarium 2">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium3.jpg" alt="Aquarium 3">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium4.jpg" alt="Aquarium 4">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium5.jpg" alt="Aquarium 5">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium6.jpg" alt="Aquarium 6">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium7.jpg" alt="Aquarium 7">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/images/aquarium8.jpg" alt="Aquarium 8">
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <div class="hero-text">
                <h1>Welcome to MOONPOOL Aquarium</h1>
                <p>우리 아쿠아리움 친구들을 만나보세요.</p>
                <div class="form-actions">
                	<button class="button button--aylen" onclick="location.href='adminSignUp'">로그인</button>
                </div>
            </div>
        </section>
        <section class="what-we-do">
            <h2>WHAT WE DO</h2>
            <p>이곳에서 모든 친구들을 관리합니다.</p>
            <div class="box new-friends">
            	<div class="box-background">
					<img src="${pageContext.request.contextPath}/images/new_p.jpg" alt="NewFriends Image">
				</div>
                <h3><i class="fas fa-user-plus"></i>새로 온 친구들을 등록해주세요!</h3>
                 <div class="form-actions">
                	<button class="button button--aylen" onclick="location.href='form'">등록</button>
                </div>
            </div>
			<div class="boxes">
				<div class="box need-protect">
					<div class="box-background">
						<img src="${pageContext.request.contextPath}/images/left_p.jpg" alt="Protect Image">
					</div>
					<h3>
						<i class="fas fa-shield-alt"></i>보호관리가 필요한 친구들
					</h3>
					<div class="form-actions button-left">
						<button class="button button--aylen search-size"
							onclick="location.href='list_protect'">검색</button>
					</div>
				</div>
				<div class="box all-friends">
					<div class="box-background">
						<img src="${pageContext.request.contextPath}/images/right_p.jpg" alt="All Friends Image">
					</div>
					<h3>
						<i class="fas fa-users"></i>우리 아쿠아리움 친구들
					</h3>
					<div class="form-actions button-left">
						<button class="button button--aylen search-size"
							onclick="location.href='list_all'">검색</button>
					</div>
				</div>
			</div>
		</section>
    </main>
    <footer>
        <div class="container">
            <p>&copy; 2024 MoonPooL. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        const swiper = new Swiper('.swiper-container', {
            loop: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
        });

        document.addEventListener('DOMContentLoaded', function () {
            const boxes = document.querySelectorAll('.box');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                        observer.unobserve(entry.target);
                    }
                });
            }, {
                threshold: 0.5,
            });

            boxes.forEach(box => {
                observer.observe(box);
            });
        });
    </script>
</body>
</html>
