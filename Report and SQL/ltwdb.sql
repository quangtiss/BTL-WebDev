-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ltwdb`
--
DROP DATABASE IF EXISTS `ltwdb`;
CREATE DATABASE `ltwdb`;
USE `ltwdb`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `name`, `role`, `updated_at`) VALUES
(1, 'admin@hcmut.edu.vn', '$2y$10$.8c8OEDgbHEUM6lmB.mJk.vppsTxRyAvHcogQbjAvD/btY1Sr3NnW', 'Admin', 1, '2023-11-29 17:05:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Nước suối'),
(2, 'Nước tăng lực'),
(3, 'Nước ngọt có ga'),
(4, 'Nước ép trái cây');
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `username`, `email`, `message`, `status`, `created_at`) VALUES
(1, 'Phan Lê Nhật Minh', 'minh.phanpvd@hcmut.edu.vn', 'Website bán hàng nhanh, gọn, nhẹ', 1, '2024-12-03 12:50:40'),
(2, 'Nguyễn Văn Ngọc Quang', 'quangpro0166@gmail.com', 'chàng trai thư giãn', 1, '2024-12-03 12:50:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'Tiền mặt khi nhận hàng',
  `payment` bigint(20) NOT NULL,
  `address_receiver` varchar(50) NOT NULL,
  `phone_receiver` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Đang xử lý','Đang giao','Đã giao') NOT NULL DEFAULT 'Đang xử lý',
  `name_receiver` varchar(50) NOT NULL DEFAULT 'Đang xử lý'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `payment_method`, `payment`, `address_receiver`, `phone_receiver`, `updated_at`, `status`, `name_receiver`) VALUES
(1, 1, 'Tiền mặt khi nhận hàng', 10000, 'Trường Đại học Bách Khoa TP. HCM', '0829689890', '2024-12-05 08:20:20', 'Đã giao', 'Phan Lê Nhật Minh'),
(2, 2, 'Tiền mặt khi nhận hàng', 60000, 'KTX Khu A', '0000000000', '2024-12-05 09:40:30', 'Đã giao', 'Nguyễn Văn Ngọc Quang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_item`
--

CREATE TABLE `order_item` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_item` bigint(20) NOT NULL DEFAULT 1,
  `price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_item`
--

INSERT INTO `order_item` (`order_id`, `product_id`, `quantity_item`, `price`) VALUES
(1, 3, 1, 10000),
(2, 6, 1, 32000),
(2, 28, 1, 13000),
(2, 29, 1, 15000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`post_id`, `title`, `content`, `updated_at`, `image`) VALUES
(1, 'Nụ cười tràn đầy hy vọng', 'phá cỗ nhộn nhịp tùng dinh tùng phách. Đây cũng là dịp để gia đình sum vầy, trao nhau những món quà ý nghĩa. Tuy nhiên, không phải ai cũng có may mắn để trải qua một mùa trung thu thật trọn vẹn.\r\n\r\nNhìn vào hoàn cảnh khó khăn của các bé mồ côi, trẻ em bỏ rơi hay các em nhỏ sinh sống tại mái ấm Chùa Kỳ Quang và mái ấm Ánh Sáng, Công ty đã tổ chức một buổi ghé thăm phát quà trung thu để mang niềm vui đến cho các em vào ngày lễ đặc biệt này.', '2023-11-17 12:54:52', 'https://redcross.org.vn/upload/thang-4-2021/a-hd2.jpg?v=1.0.2'),
(2, 'CÔNG BỐ KẾT QUẢ KHÁCH HÀNG TRÚNG THƯỞNG | VÒNG QUAY MAY MẮN', 'Chúng ta đã cùng nhau tìm ra các khách hàng may mắn nhận được giải thưởng trong chương trình “Vòng Quay May Mắn”. Như vậy là các phần quà cũng đã tìm được chủ sở hữu của mình rồi., Công ty xin chúc mừng tất cả các bạn trúng thưởng, các bạn chưa may mắn trong lần này cũng đừng buồn nhen, hãy cùng Công ty đón chờ những chương trình tiếp theo nhé! \r\n\r\nDanh sách khách hàng may mắn nhận được giải thưởng sau:\r\n\r\n03 giải Nhất: Iphone 14 Promax 256G\r\n03 giải Nhì: Xe điện PEGA\r\n05 giải Ba: Loa Bluetooth JBL\r\n08 giải Tư: Nước hoa Chanel\r\n100 giải Năm: Hộp quà tặng\r\nGiải Khuyến khích: dành tặng cho tất cả khách hàng', '2023-11-17 12:57:24', 'https://insenglish.org/wp-content/uploads/2021/06/Layout-vuong-bang-ten--1024x1024.jpg');

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `images` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `price_sale` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `name`, `category_id`, `description`, `images`, `quantity`, `price`, `price_sale`, `timestamp`) VALUES
(3, 'Nước suối Aquafina', 1, 'Nước suối tinh khiết, an toàn và tốt cho sức khỏe.', 'aquafina.jpg', 60, 10000, NULL, '2023-12-01 12:10:00'),
(27, 'Nước suối Lavie', 1, 'Nước suối Lavie tinh khiết đóng chai 500ml.', 'nuoc-suoi-lavie.jpg', 100, 10000, NULL, CURRENT_TIMESTAMP),
(6, 'Monster Energy', 2, 'Thức uống năng lượng mạnh mẽ, phù hợp với những người năng động.', 'monster-energy.jpg', 25, 35000, 32000, '2023-12-01 12:25:00'),
(28, 'Coca-Cola', 3, 'Nước giải khát Coca-Cola lon 330ml, sảng khoái tươi mát.', 'coca-cola.jpg', 100, 15000, 13000, CURRENT_TIMESTAMP),
(29, 'Pepsi', 3, 'Pepsi lon 330ml - hương vị sảng khoái đặc trưng.', 'pepsi.jpg', 100, 15000, NULL, CURRENT_TIMESTAMP),
(30, 'Sprite', 3, 'Nước ngọt Sprite lon 330ml, hương chanh tươi mát.', 'sprite.jpg', 100, 15000, NULL, CURRENT_TIMESTAMP),
(31, '7Up', 3, 'Nước giải khát 7Up lon 330ml, vị chanh độc đáo.', '7up.jpg', 100, 15000, NULL, CURRENT_TIMESTAMP),
(32, 'Nước cam ép Minute Maid', 4, 'Nước cam ép Minute Maid chai 350ml, giàu vitamin C.', 'minute-maid-cam.jpg', 50, 20000, 18000, CURRENT_TIMESTAMP),
(33, 'Nước táo ép Minute Maid', 4, 'Nước táo ép Minute Maid chai 350ml, tươi ngon và bổ dưỡng.', 'minute-maid-tao.jpg', 50, 20000, NULL, CURRENT_TIMESTAMP),
(34, 'Red Bull', 2, 'Nước tăng lực Red Bull lon 250ml, bổ sung năng lượng tức thì.', 'red-bull.jpg', 100, 18000, 16000, CURRENT_TIMESTAMP),
(35, 'Number 1', 2, 'Nước tăng lực Number 1 lon 330ml, năng lượng dồi dào.', 'number-1.jpg', 100, 15000, NULL, CURRENT_TIMESTAMP),
(36, 'Nước dừa tươi Cocoxim', 4, 'Nước dừa tươi Cocoxim hộp 330ml, tươi mát tự nhiên.', 'cocoxim.jpg', 50, 25000, 22000, CURRENT_TIMESTAMP),
(37, 'Nước ép nho Welchs', 4, 'Nước ép nho Welchs chai 473ml, hương vị nho đậm đà.', 'welchs.jpg', 30, 30000, 28000, CURRENT_TIMESTAMP),
(38, 'Nước ép ổi Ceres', 4, 'Nước ép ổi Ceres hộp 1L, nguyên chất.', 'ceres-oi.jpg', 20, 45000, NULL, CURRENT_TIMESTAMP),
(39, 'Nước ép lựu Ceres', 4, 'Nước ép lựu Ceres hộp 1L, hương vị ngọt thanh.', 'ceres-luu.jpg', 20, 45000, NULL, CURRENT_TIMESTAMP),
(40, 'Nước ép dứa', 4, 'Nước ép dứa đóng chai 350ml, hương vị nhiệt đới.', 'ep-dua.jpg', 50, 20000, 18000, CURRENT_TIMESTAMP),
(41, 'Nước ép xoài', 4, 'Nước ép xoài đóng chai 350ml, vị ngọt tự nhiên.', 'ep-xoai.jpg', 50, 20000, NULL, CURRENT_TIMESTAMP),
(42, 'Trà xanh không độ', 4, 'Trà xanh không độ chai 455ml, vị thanh mát tự nhiên.', 'tra-xanh-khong-do.jpg', 100, 12000, 10000, CURRENT_TIMESTAMP),
(43, 'Nước yến ngân nhĩ Wonderfarm', 4, 'Nước yến ngân nhĩ Wonderfarm lon 240ml.', 'nuoc-yen-wonderfarm.jpg', 30, 30000, 28000, CURRENT_TIMESTAMP),
(44, 'Oolong Tea Tea+ Plus', 4, 'Trà Oolong Tea+ Plus chai 455ml.', 'oolong-tea-plus.jpg', 50, 20000, NULL, CURRENT_TIMESTAMP),
(45, 'Yakult', 4, 'Sữa chua uống Yakult hộp 5 chai, bổ sung lợi khuẩn.', 'yakult.jpg', 100, 25000, NULL, CURRENT_TIMESTAMP),
(46, 'Nước chanh muối Refresh', 4, 'Nước chanh muối Refresh chai 350ml.', 'refresh-chanh-muoi.jpg', 50, 15000, 13000, CURRENT_TIMESTAMP);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

INSERT INTO `review` (`review_id`, `product_id`, `user_id`, `title`, `content`, `updated_at`) VALUES
(1, 3, 1,'Ngon quá !!!','Nước tinh khiết', '2023-11-17 12:54:52'),
(2, 3, 2,'Chắc là không ngon đâu','Nước không chất lượng', '2023-11-17 12:57:24');

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verify_code` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `avatar`, `phone`, `address`, `updated_at`, `verify_code`, `active`) VALUES
(1, 'minh.phanpvd@hcmut.edu.vn', '$2y$10$Vu.lzuwRBT4ZhxkDxent1unTO.NpiCpqAdGFh3Mmy7C0IvRY0s5z2', 'Phan Lê Nhật Minh', NULL, '0829689890', 'Vinhomes Grand Park', '2024-12-05 09:10:20', 123456, b'1'),
(2, 'quangpro0166@gmail.com', '$2y$10$Vu.lzuwRBT4ZhxkDxent1unTO.NpiCpqAdGFh3Mmy7C0IvRY0s5z2', 'Nguyễn Văn Ngọc Quang', NULL, '0000000000', 'KTX Khu A', '2024-12-05 09:40:20', 123456, b'1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK_order_user` (`user_id`);

--
-- Chỉ mục cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `FK_order_item_product` (`product_id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_product_category` (`category_id`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FK__product` (`product_id`),
  ADD KEY `FK__user` (`user_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK__product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
