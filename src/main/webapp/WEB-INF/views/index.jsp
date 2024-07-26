<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marine Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index_styles.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    
</head>
<body>
    <header>
        <div class="container">
            <div class="logo"><a href="/">VELOCITY</a></div>
            <nav>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/form">Register</a></li>
                    <li><a href="/list_protect">Protect</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <section class="hero">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium1.jpg" alt="Aquarium 1">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium2.jpg" alt="Aquarium 2">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium3.jpg" alt="Aquarium 3">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium4.jpg" alt="Aquarium 4">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium5.jpg" alt="Aquarium 5">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium6.jpg" alt="Aquarium 6">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium7.jpg" alt="Aquarium 7">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/aquarium8.jpg" alt="Aquarium 8">
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <div class="hero-text">
                <h1>Welcome to UREX Aquarium</h1>
                <p>Meet our Aquarium friends.</p>
                <button class="sign-up">SIGN UP</button>
                <button class="learn-more">LEARN MORE</button>
            </div>
        </section>
        <section class="what-we-do">
            <h2>WHAT WE DO</h2>
            <p>THIS IS SOME TEXT INSIDE OF A DIV BLOCK.</p>
            <div class="box new-friends">
                <h3>New Friends</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <button onclick="location.href='form'">등록</button>
            </div>
            <div class="boxes">
                <div class="box need-protect">
                    <h3>Need to Protect</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="location.href='list_protect'">검색</button>
                </div>
                <div class="box all-friends">
                    <h3>All Friends</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <button onclick="location.href='list_all'">검색</button>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <div class="container">
            <p>&copy; 2024 Velocity. All rights reserved.</p>
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
