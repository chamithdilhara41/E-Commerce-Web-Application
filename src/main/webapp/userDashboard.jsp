<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulky E-Commerce</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Enhanced Banner Styles */
        .banner-category-section {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin: 20px 0;
        }

        .hero-banner {
            flex: 2;
            position: relative;
            height: 400px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-size: cover;
            background-position: center;
            transition: background-image 0.5s ease;
        }

        .hero-banner::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.4) 50%, rgba(0,0,0,0.2) 100%);
            z-index: 1;
        }

        .hero-banner-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #fff;
            z-index: 2;
            width: 80%;
            opacity: 1;
            transition: opacity 0.3s ease;
        }

        .hero-banner-content.fade {
            opacity: 0;
        }

        .hero-banner-content h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero-banner-content p {
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
        }

        .hero-banner-content .price {
            font-size: 2rem;
            color: #ffd700;
            font-weight: bold;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero-banner-content .btn-shop-now {
            background: linear-gradient(45deg, #447ffd, #87a9ff);
            color: white;
            padding: 12px 30px;
            border-radius: 25px;
            text-transform: uppercase;
            font-weight: 600;
            border: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .hero-banner-content .btn-shop-now:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
        }

        /* Banner navigation dots */
        .banner-dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            z-index: 3;
        }

        .banner-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .banner-dot.active {
            background: #fff;
        }

        /* Categories Scroll Styles */
        .categories-scroll {
            flex: 1;
            background-color: #f8f9fa;
            padding: 15px;
            max-height: 400px;
            overflow-y: auto;
            border-radius: 10px;
            border: 1px solid #eee;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .categories-scroll::-webkit-scrollbar {
            width: 0px;
        }

        .category-card {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .category-card:hover {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .category-card img {
            height: 80px;
            width: 80px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 15px;
        }

        /* Product Card Styles */
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .card-img-top {
            border-radius: 10px 10px 0 0;
        }

        /* Footer Styles */
        .footer {
            background-color: #212529;
            color: #fff;
            padding: 40px 0 20px;
            margin-top: 40px;
        }

        .footer h6 {
            color: #fff;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .footer a {
            color: #fff;
            text-decoration: none;
            display: block;
            margin-bottom: 10px;
            opacity: 0.8;
            transition: opacity 0.3s ease;
        }

        .footer a:hover {
            opacity: 1;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .hero-banner {
                height: 300px;
            }

            .hero-banner-content h1 {
                font-size: 2rem;
            }

            .hero-banner-content p {
                font-size: 1rem;
            }

            .categories-scroll {
                flex: 100%;
                max-height: 300px;
            }
        }
    </style>
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Bulky</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item search-bar">
                    <form class="d-flex" action="#" method="get">
                        <input class="form-control me-2" type="search" placeholder="Search for items..." aria-label="Search">
                        <button class="btn btn-outline-success" type="submit"><i class="fas fa-search"></i></button>
                    </form>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Sign In</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Sign Up</a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i></a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Enhanced Banner and Categories Section -->
<div class="container">
    <div class="banner-category-section">
        <div class="hero-banner">
            <div class="hero-banner-content">
                <!-- Content will be dynamically populated -->
            </div>
            <div class="banner-dots">
                <!-- Dots will be dynamically populated -->
            </div>
        </div>
        <div class="categories-scroll">
            <div class="category-card">
                <img src="dress.jpg" alt="Dresses">
                <h6>Dresses & Frocks</h6>
            </div>
            <div class="category-card">
                <img src="winter.jpg" alt="Winter Wear">
                <h6>Winter Wear</h6>
            </div>
            <div class="category-card">
                <img src="glasses.jpg" alt="Glasses">
                <h6>Glasses & Lenses</h6>
            </div>
            <div class="category-card">
                <img src="jeans.jpg" alt="Jeans">
                <h6>Shorts & Jeans</h6>
            </div>
            <div class="category-card">
                <img src="accessories.jpg" alt="Accessories">
                <h6>Accessories</h6>
            </div>
        </div>
    </div>
</div>

<!-- Products Section -->
<div class="container py-5">
    <h2 class="mb-4 text-center">Featured Products</h2>
    <div class="row">
        <!-- Product cards -->
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="jacket.jpg" class="card-img-top" alt="Jacket" style="height: 300px; object-fit: cover;">
                <div class="card-body">
                    <h6 class="card-title">Men's Winter Leather Jacket</h6>
                    <p class="text-muted">$48.00</p>
                    <div class="d-grid gap-2">
                        <a href="#" class="btn btn-primary">Buy Now</a>
                        <a href="#" class="btn btn-outline-secondary">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="jacket.jpg" class="card-img-top" alt="Jacket" style="height: 300px; object-fit: cover;">
                <div class="card-body">
                    <h6 class="card-title">Men's Winter Leather Jacket</h6>
                    <p class="text-muted">$48.00</p>
                    <div class="d-grid gap-2">
                        <a href="#" class="btn btn-primary">Buy Now</a>
                        <a href="#" class="btn btn-outline-secondary">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="jacket.jpg" class="card-img-top" alt="Jacket" style="height: 300px; object-fit: cover;">
                <div class="card-body">
                    <h6 class="card-title">Men's Winter Leather Jacket</h6>
                    <p class="text-muted">$48.00</p>
                    <div class="d-grid gap-2">
                        <a href="#" class="btn btn-primary">Buy Now</a>
                        <a href="#" class="btn btn-outline-secondary">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="jacket.jpg" class="card-img-top" alt="Jacket" style="height: 300px; object-fit: cover;">
                <div class="card-body">
                    <h6 class="card-title">Men's Winter Leather Jacket</h6>
                    <p class="text-muted">$48.00</p>
                    <div class="d-grid gap-2">
                        <a href="#" class="btn btn-primary">Buy Now</a>
                        <a href="#" class="btn btn-outline-secondary">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="jacket.jpg" class="card-img-top" alt="Jacket" style="height: 300px; object-fit: cover;">
                <div class="card-body">
                    <h6 class="card-title">Men's Winter Leather Jacket</h6>
                    <p class="text-muted">$48.00</p>
                    <div class="d-grid gap-2">
                        <a href="#" class="btn btn-primary">Buy Now</a>
                        <a href="#" class="btn btn-outline-secondary">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- More product cards... -->
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <!-- Your existing footer code -->
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Dynamic Banner JavaScript -->
<script>
    // Banner data
    const banners = [
        {
            image: 'banner1.jpg',
            title: "Women's Latest Fashion Sale",
            description: "Discover the newest trends in women's fashion",
            price: "Starting at $20.00",
            buttonText: "Shop Now"
        },
        {
            image: 'banner2.jpg',
            title: "New Summer Collection",
            description: "Get ready for summer with our latest collection",
            price: "Up to 40% Off",
            buttonText: "Explore Now"
        },
        {
            image: 'banner3.jpg',
            title: "Exclusive Winter Deals",
            description: "Stay warm with our winter collection",
            price: "From $35.00",
            buttonText: "Shop Winter"
        }
    ];

    let currentBannerIndex = 0;
    const bannerContent = document.querySelector('.hero-banner-content');
    const heroBanner = document.querySelector('.hero-banner');
    const dotsContainer = document.querySelector('.banner-dots');
    let rotationInterval;

    // Create dots
    banners.forEach((_, index) => {
        const dot = document.createElement('div');
        dot.className = `banner-dot ${index == 0 ? 'active' : ''}`;
        dot.addEventListener('click', () => {
            currentBannerIndex = index;
            updateBanner();
        });
        dotsContainer.appendChild(dot);
    });

    function updateBanner() {
        const banner = banners[currentBannerIndex];

        // Fade out content
        bannerContent.classList.add('fade');

        setTimeout(() => {
            // Update content
            bannerContent.innerHTML = `
                <h1>${banner.title}</h1>
                <p>${banner.description}</p>
                <div class="price">${banner.price}</div>
                <button class="btn btn-shop-now">${banner.buttonText}</button>
            `;

            // Update background
            heroBanner.style.backgroundImage = `url('${banner.image}')`;

            // Update dots
            document.querySelectorAll('.banner-dot').forEach((dot, index) => {
                dot.classList.toggle('active', index === currentBannerIndex);
            });

            // Fade in content
            bannerContent.classList.remove('fade');
        }, 300);
    }

    function rotateBanner() {
        currentBannerIndex = (currentBannerIndex + 1) % banners.length;
        updateBanner();
    }

    // Initialize first banner
    updateBanner();

    // Start auto-rotation
    rotationInterval = setInterval(rotateBanner, 5000);

    // Stop rotation on hover
    heroBanner.addEventListener('mouseenter', () => clearInterval(rotationInterval));
    heroBanner.addEventListener('mouseleave', () => {
        rotationInterval = setInterval(rotateBanner, 5000);
    });
</script>

</body>
</html>