<?php
session_start();
ob_start();
$rootPath = '/Lap_trinh_web';
require_once './database/DB.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nước giải khát</title>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.1.2/css/all.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="./public/css/base.css">
    <!-- <link rel="stylesheet" href="./public/css/home.css"> -->
    <style>
        p {
            text-align: justify;
        }
    </style>
</head>

<body>
    <?php
    require './includes/header.php';
    require './includes/navbar.php';
    $bestSellerQueryString = "SELECT product.product_id, `order`.`order_id`, product.name, SUM(order_item.quantity_item) AS number_sold, product.images
        FROM order_item, product, `order`
        WHERE order_item.product_id = product.product_id 
            AND order_item.order_id = `order`.`order_id` 
            AND MONTH(`order`.`updated_at`) = MONTH(CURRENT_DATE())
            AND YEAR(`order`.`updated_at`) = YEAR(CURRENT_DATE())
        GROUP BY product.product_id
        ORDER BY number_sold DESC
        LIMIT 3";

    $result = mysqli_query($conn, $bestSellerQueryString);
    ?>

    <div id="template-mo-zay-hero-carousel" class="carousel carousel-dark slide mb-5" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="2000">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 d-flex align-items-center image-container">
                            <a href="#"><img class="img-fluid rounded" src="./public/img/carousels/carousel1.webp"
                                    alt="hinh.jpg" style="height: 300px;" /></a>
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center content-wrapper" style="height: 300px;">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1" style="color:#002A54"><strong>Giải Khát Trọn Vẹn Cảm Xúc</strong></h1>
                                <h3 class="h2" style="color:#ED171F">Nước uống không chỉ là giải khát, mà còn là trải
                                    nghiệm.
                                </h3>
                                <p>Chúng tôi mang đến những dòng sản phẩm đậm đà hương vị, giúp bạn tận hưởng từng giây
                                    phút tươi mát, tiếp thêm năng lượng và cảm hứng cho ngày mới.

                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 d-flex align-items-center image-container">
                            <a href="#"><img class="img-fluid rounded" src="./public/img/carousels/carousel2.png"
                                    style="height: 300px;" /></a>
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center content-wrapper" style="height: 300px" ;>
                            <div class="text-align-left">
                                <h1 class="h1" style="color:#002A54">Vì Một Cuộc Sống Tươi Mới</h1>
                                <h3 class="h2" style="color:#ED171F">Uống sạch, sống khỏe, yêu đời hơn mỗi ngày.</h3>
                                <p>
                                    Không chỉ là nước giải khát, sản phẩm của chúng tôi còn là lời cam kết về sức khỏe,
                                    giúp bạn giữ vững phong độ và tận hưởng từng khoảnh khắc quý giá bên người thân yêu.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 d-flex align-items-center image-container">
                            <a href="#"><img class="img-fluid rounded" src="./public/img/carousels/carousel3.jpg"
                                    style="height: 300px;" /></a>
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center content-wrapper" style="height: 300px;">
                            <div class="text-align-left">
                                <h1 class="h1" style="color:#002A54">Đỉnh Cao Của Sảng Khoái</h1>
                                <h3 class="h2" style="color:#ED171F">Mỗi chai nước là một hành trình khám phá vị giác.
                                </h3>
                                <p>
                                    Với công thức pha chế đặc biệt từ nguyên liệu tự nhiên, chúng tôi tự hào mang đến
                                    cho bạn sự cân bằng hoàn hảo giữa chất lượng, an toàn và hương vị tuyệt vời.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid bg-secondary bg-opacity-10 pt-5 pb-5">
        <!-- team member -->
        <div class="container mb-5">
            <div class="row text-center mb-2">
                <div class="h2">CÁC LOẠI THỨC UỐNG</div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class="text-center">
                        <a href="http://localhost/Lap_trinh_web/product.php?categoryId=1"><img alt="AVT" width="200"
                                height="200" src="<?php echo $rootPath ?>/public/img/category1.jpg"
                                class="rounded-circle mb-3 mt-3" /></a>
                        <p class="text-dark" style="text-align: center; font-weight: bold;">Nước suối</p>
                        <!-- <a class="btn btn-primary text-light" href="#">Contact</a> -->
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class="text-center">
                        <a href="http://localhost/Lap_trinh_web/product.php?categoryId=2"><img alt="AVT" width="200"
                                height="200"
                                src="<?php echo $rootPath ?>/public/img/category2.jpg?v=<?php echo time(); ?>"
                                class="rounded-circle mb-3 mt-3" /></a>
                        <p class="text-dark" style="text-align: center; font-weight: bold;">Nước tăng lực</p>
                        <!-- <a class="btn btn-primary text-light" href="#">Contact</a> -->
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class="text-center">
                        <a href="http://localhost/Lap_trinh_web/product.php?categoryId=3"><img alt="AVT" width="200"
                                height="200" src="<?php echo $rootPath ?>/public/img/category3.jpg"
                                class=" rounded-circle mb-3 mt-3" /></a>
                        <p class="text-dark" style="text-align: center; font-weight: bold;">Nước ngọt có ga</p>
                        <!-- <a class="btn btn-primary text-light" href="#">Contact</a> -->
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class="text-center">
                        <a href="http://localhost/Lap_trinh_web/product.php?categoryId=4"><img alt="AVT" width="200"
                                height="200" src="<?php echo $rootPath ?>/public/img/category4.jpg"
                                class="rounded-circle mb-3 mt-3" /></a>
                        <p class="text-dark" style="text-align: center; font-weight: bold;">Nước ép trái cây</p>
                        <!-- <a class="btn btn-primary text-light" href="#">Contact</a> -->
                    </div>
                </div>
            </div>
        </div>

        <!-- best seller -->
        <?php function DisplayBestSeller()
        { ?>
            <?php
            global $result;
            if (mysqli_num_rows($result) == 0) {
                return;
            }
            ?>
            <div class="container mb-5">
                <div class="row text-center">
                    <div class="h3 mb-2" style="color:#ED171F">BEST SELLER OF THE MONTH</div>
                </div>
                <div class="row">
                    <?php while ($productData = mysqli_fetch_assoc($result)) { ?>
                        <div class="col-xl-4">
                            <div class="text-center">
                                <a href="product_detail.php?productId=<?php echo $productData['product_id']; ?>">
                                    <img alt="topProduct" width="200" height="200"
                                        src="public/img/products/<?php echo $productData['images']; ?>"
                                        class="rounded-circle mb-3 mt-3 border border-2" />
                                </a>
                                <p class="h4 text-dark" style="text-align: center;"><?php echo $productData['name']; ?></p>
                                <a class="btn btn-primary btn-lg"
                                    href="product_detail.php?productId=<?php echo $productData['product_id']; ?>">Buy Now</a>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
        <?php } ?>
        <?php
        DisplayBestSeller();
        ?>
    </div>

    <?php
    $sqlShowProducts = "SELECT product_id, name, quantity, images, price, price_sale FROM product";
    $categoryId = '';
    if (isset($_POST['search_btn'])) {
        $categoryId = $_POST['categoryId'];
        $sqlShowProducts = "SELECT product_id, name, quantity, images, price, price_sale FROM product WHERE category_id = '$categoryId'";
    }
    $products = $conn->query($sqlShowProducts);
    $totalProducts = $products->num_rows;
    $currentPage = 1;
    if (isset($_GET['page'])) {
        settype($_GET['page'], 'int'); // tránh injection, trang tự về 0
        $currentPage = $_GET['page'];
    }
    $limit = 8;
    $totalPage = ceil($totalProducts / $limit);

    // giới hạn phân trang trong 1-totalPage
    if ($currentPage > $totalPage) {
        $currentPage = $totalPage;
    } elseif ($currentPage < 1) {
        $currentPage = 1;
    }

    $start = ($currentPage - 1) * $limit;
    // $sqlShowProducts = "SELECT product_id, name, quantity, images, price, price_sale FROM product LIMIT $start, $limit";
    $sqlShowProducts = $sqlShowProducts . " LIMIT $start, $limit";
    $products = $conn->query($sqlShowProducts);
    ?>

    <?php
    require './includes/footer.php';
    ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
        integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">
        </script>
    <script src="./public/javascripts/loadCartHeader.js"></script>

    <script>
        $(document).ready(function () {
            loadCartAjax();

            $(window).scroll(function () {
                if ($(this).scrollTop() > 114) {
                    $("#navbar-top").addClass('fix-nav')
                } else {
                    $("#navbar-top").removeClass('fix-nav')
                }
            })
        });
    </script>
    <script src="./public/javascripts/liveSearch.js"></script>

</body>

</html>