-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 26, 2023 lúc 05:14 PM
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
-- Cơ sở dữ liệu: `apple_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2023_02_24_160438_create_tbl_admin_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(6, '2023_02_24_185544_create_tbl_category_product', 2),
(7, '2023_03_04_214912_create_tbl_brand_product', 3),
(8, '2023_03_05_173919_create_tbl_product', 4),
(9, '2023_03_10_161744_tbl_customer', 5),
(10, '2023_03_10_165303_tbl_shipping', 6),
(11, '2023_03_13_195944_tbl_payment', 7),
(12, '2023_03_13_200141_tbl_order', 7),
(13, '2023_03_13_200159_tbl_order_details', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Dinh Vu', '0899996261', '2023-03-15 16:18:41', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(1) DEFAULT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_desc` text NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `category_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(10, 1, 'Iphone 14 Series', 'Iphone 14 Pro Max / \r\nIphone 14 Pro / \r\nIphone 14 Plus / \r\nIphone 14', 1, '2023-03-06 18:08:09', NULL),
(11, 1, 'Iphone 13 Series', 'Iphone 13 Pro Max / \r\nIphone 13 Pro /  \r\nIphone 13 / \r\nIphone 13 Mini', 1, '2023-03-06 18:09:00', NULL),
(12, 1, 'Iphone 12 Series', 'Iphone 12 Pro Max / \r\nIphone 12 Pro /  \r\nIphone 12', 1, '2023-03-06 18:10:52', NULL),
(13, 1, 'Iphone 11 Series', 'Iphone 11 Pro Max / \r\nIphone 11 Pro /  \r\nIphone 11', 1, '2023-03-06 18:11:07', NULL),
(14, NULL, 'Macbook M1', '2020', 1, '2023-03-06 18:38:40', NULL),
(15, 2, 'Macbook Pro', '2020', 1, '2023-03-06 18:41:08', NULL),
(16, 2, 'Macbook Air', '2020', 1, '2023-03-06 19:04:43', NULL),
(17, 2, 'IMac', '2021', 1, '2023-03-06 19:13:37', NULL),
(18, 2, 'Mac Mini', 'M1, M2', 1, '2023-03-06 19:14:01', NULL),
(19, 6, 'iPad Pro M1', 'Ipad Pro', 1, '2023-03-06 19:15:45', NULL),
(20, 6, 'iPad Pro M2', 'Ipad Pro', 1, '2023-03-06 19:15:52', NULL),
(21, 6, 'iPad Air', 'iPad Air', 1, '2023-03-06 19:16:06', NULL),
(22, 6, 'iPad Mini', 'iPad Mini', 1, '2023-03-06 19:16:17', NULL),
(23, 5, 'Apple Watch Ultra', 'Apple Watch Ultra', 1, '2023-03-06 19:16:44', NULL),
(24, 5, 'Apple Watch Series 8', 'Apple Watch Series 8', 1, '2023-03-06 19:16:54', NULL),
(25, 5, 'Apple Watch Series 7', 'Apple Watch Series 7', 1, '2023-03-06 19:17:01', NULL),
(26, 5, 'Apple Watch SE', 'Apple Watch SE', 1, '2023-03-06 19:17:10', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_desc` text NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Iphone', 'Điện thoại di động', 1, '2023-02-24 19:19:14', NULL),
(2, 'Macbook', 'Máy tính', 1, '2023-02-24 19:20:24', NULL),
(5, 'Apple Watch', 'Đồng hồ', 1, '2023-02-24 19:20:32', NULL),
(6, 'Ipad', 'Máy tính bảng', 1, '2023-02-24 19:20:42', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_type` int(11) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(70, 4, 77, 73, '15,832,000', '3', '2023-04-06 19:31:47', NULL),
(71, 4, 78, 74, '15,832,000', '3', '2023-04-06 19:36:30', NULL),
(72, 4, 79, 75, '1,699,000', '3', '2023-04-06 19:45:12', NULL),
(73, 4, 80, 76, '4,952,000', '4', '2023-04-06 19:59:31', NULL),
(74, 4, 81, 77, '11,271,200', '3', '2023-04-07 14:23:25', NULL),
(75, 4, 82, 78, '9,912,000', '4', '2023-04-07 19:13:59', NULL),
(79, 4, 86, 82, '9,912,000', '2', '2023-04-07 19:16:20', NULL),
(80, 4, 87, 83, '22,490,000', '2', '2023-04-07 19:18:56', NULL),
(81, 4, 88, 84, '40,304,000', '3', '2023-04-08 04:24:30', NULL),
(82, 4, 89, 85, '20,392,000', '4', '2023-04-08 05:42:28', NULL),
(83, 7, 90, 86, '115,680,000', '1', '2023-04-24 04:13:04', NULL),
(84, 7, 91, 87, '120,910,000', '1', '2023-04-24 05:09:35', NULL),
(85, 7, 92, 88, '76,830,000', '1', '2023-04-24 05:53:37', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_details_quantity` int(11) DEFAULT 1,
  `product_name` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_color` varchar(255) NOT NULL,
  `product_storage` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `order_details_quantity`, `product_name`, `product_price`, `product_color`, `product_storage`, `created_at`, `updated_at`) VALUES
(67, 70, 8, 1, 'iPhone 14 128GB', '19790000', 'Red', '128GB', '2023-04-06 19:31:47', NULL),
(68, 71, 8, 1, 'iPhone 14 128GB', '19790000', 'Red', '128GB', '2023-04-06 19:36:30', NULL),
(69, 72, 18, 1, 'Mac mini M1 8GB RAM', '1699000', 'White', '256GB', '2023-04-06 19:45:12', NULL),
(70, 73, 22, 1, 'Apple Watch SE Nhôm 2022 GPS', '6190000', 'Starlight', '40mm', '2023-04-06 19:59:31', NULL),
(71, 74, 18, 1, 'Mac mini M1 8GB RAM', '1699000', 'White', '256GB', '2023-04-07 14:23:25', NULL),
(72, 74, 14, 1, 'iPad mini 6', '12390000', 'Space Gray', '64GB', '2023-04-07 14:23:25', NULL),
(73, 75, 14, 1, 'iPad mini 6', '12390000', 'Space Gray', '64GB', '2023-04-07 19:13:59', NULL),
(74, 76, 14, 1, 'iPad mini 6', '12390000', 'Space Gray', '64GB', '2023-04-07 19:15:23', NULL),
(75, 77, 14, 1, 'iPad mini 6', '12390000', 'Space Gray', '64GB', '2023-04-07 19:15:34', NULL),
(76, 78, 14, 1, 'iPad mini 6', '12390000', 'Space Gray', '64GB', '2023-04-07 19:15:51', NULL),
(77, 79, 14, 1, 'iPad mini 6', '12390000', 'Space Gray', '64GB', '2023-04-07 19:16:20', NULL),
(78, 80, 9, 1, 'Iphone 14 Plus 128GB', '22490000', 'Purple', '128GB', '2023-04-07 19:18:56', NULL),
(79, 81, 6, 1, 'iPhone 14 Pro Max 128GB', '27890000', 'Gold', '128GB', '2023-04-08 04:24:30', NULL),
(80, 81, 9, 1, 'Iphone 14 Plus 128GB', '22490000', 'Purple', '128GB', '2023-04-08 04:24:30', NULL),
(81, 82, 7, 1, 'iPhone 14 Pro 128GB', '25490000', 'Deep Purple', '128GB', '2023-04-08 05:42:28', NULL),
(82, 83, 12, 2, 'iPad Pro M1 12.9 inch WiFi 512GB', '29950000', 'Space Gray', '512GB', '2023-04-24 04:13:04', NULL),
(83, 83, 6, 2, 'iPhone 14 Pro Max 128GB', '27890000', 'Gold', '128GB', '2023-04-24 04:13:04', NULL),
(84, 84, 6, 1, 'iPhone 14 Pro Max 128GB', '27890000', 'Gold', '128GB', '2023-04-24 05:09:35', NULL),
(85, 84, 15, 1, 'MacBook Pro M1 2020', '28550000', 'Space Gray', '256GB', '2023-04-24 05:09:35', NULL),
(86, 84, 20, 2, 'Apple Watch Series 8 Thép GPS + Cellular', '17990000', 'Silver', '41mm', '2023-04-24 05:09:35', NULL),
(87, 84, 10, 1, 'iPad Pro M2 12.9 inch WiFi 128GB', '28490000', 'Silver', '128GB', '2023-04-24 05:09:35', NULL),
(88, 85, 6, 1, 'iPhone 14 Pro Max 128GB', '27890000', 'Gold', '128GB', '2023-04-24 05:53:37', NULL),
(89, 85, 19, 1, 'Apple Watch Ultra LTE 49mm Alpine Loop size S', '20390000', 'Orange', '49mm', '2023-04-24 05:53:37', NULL),
(90, 85, 15, 1, 'MacBook Pro M1 2020', '28550000', 'Space Gray', '256GB', '2023-04-24 05:53:37', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(73, '1', 'Pending', '2023-04-06 19:31:47', NULL),
(74, '1', 'Pending', '2023-04-06 19:36:30', NULL),
(75, '2', 'Pending', '2023-04-06 19:45:12', NULL),
(76, '2', 'Pending', '2023-04-06 19:59:31', NULL),
(77, '2', 'Pending', '2023-04-07 14:23:25', NULL),
(78, '2', 'Pending', '2023-04-07 19:13:59', NULL),
(79, '2', 'Pending', '2023-04-07 19:15:23', NULL),
(80, '2', 'Pending', '2023-04-07 19:15:34', NULL),
(81, '2', 'Pending', '2023-04-07 19:15:51', NULL),
(82, '2', 'Pending', '2023-04-07 19:16:20', NULL),
(83, '2', 'Pending', '2023-04-07 19:18:56', NULL),
(84, '2', 'Pending', '2023-04-08 04:24:30', NULL),
(85, '2', 'Pending', '2023-04-08 05:42:28', NULL),
(86, '1', 'Pending', '2023-04-24 04:13:04', NULL),
(87, '1', 'Pending', '2023-04-24 05:09:35', NULL),
(88, '1', 'Pending', '2023-04-24 05:53:37', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_content` text NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `product_storage` varchar(255) DEFAULT NULL,
  `product_color` varchar(255) DEFAULT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `category_id`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_img`, `product_storage`, `product_color`, `product_status`, `created_at`, `updated_at`) VALUES
(6, 'iPhone 14 Pro Max 128GB', 1, 10, 'iPhone 14 Pro Max. Bắt trọn chi tiết ấn tượng với Camera Chính 48MP. Trải nghiệm iPhone theo cách hoàn toàn mới với Dynamic Island và màn hình Luôn Bật. Công nghệ an toàn quan trọng – Phát Hiện Va Chạm  thay bạn gọi trợ giúp khi cần kíp', 'iPhone 14 Pro Max Vượt trội', '27890000', 'iphone-14-pro-max-128gb4.jpg', '128GB', 'Gold', 1, '2023-03-06 17:58:16', NULL),
(7, 'iPhone 14 Pro 128GB', 1, 10, 'iPhone 14 Pro. Bắt trọn chi tiết ấn tượng với Camera Chính 48MP. Trải nghiệm iPhone theo cách hoàn toàn mới với Dynamic Island và màn hình Luôn Bật. Phát Hiện Va Chạm, một tính năng an toàn mới, thay bạn gọi trợ giúp khi cần kíp.', 'iPhone 14 Pro', '25490000', 'iphone-14-pro-128gb30.jpg', '128GB', 'Deep Purple', 1, '2023-03-06 17:59:30', NULL),
(8, 'iPhone 14 128GB', 1, 10, 'iPhone 14. Với hệ thống camera kép tiên tiến nhất từng có trên iPhone. Chụp những bức ảnh tuyệt đẹp trong điều kiện từ thiếu sáng đến dư sáng. Phát hiện Va Chạm, một tính năng an toàn mới, thay bạn gọi trợ giúp khi cần kíp.', 'iPhone 14. Một trời tính năng tuyệt vời.', '19790000', 'iphone-14-128gb5.jpg', '128GB', 'Red', 1, '2023-03-06 18:00:30', NULL),
(9, 'Iphone 14 Plus 128GB', 1, 10, 'iPhone 14 Plus. Nghĩ lớn cùng màn hình 6,7 inch lớn hơn và thời lượng pin bền bỉ cả ngày. Chụp những bức ảnh tuyệt đẹp trong điều kiện thiếu sáng và dư sáng cùng hệ thống camera kép mới. Phát Hiện Va Chạm, một tính năng an toàn mới, thay bạn gọi trợ giúp khi cần kíp.', 'iPhone 14 Plus. Thật lớn', '22490000', 'iphone-14-plus-128gb6.jpg', '128GB', 'Purple', 1, '2023-03-08 06:27:06', NULL),
(10, 'iPad Pro M2 12.9 inch WiFi 128GB', 6, 20, 'iPad Pro. Với hiệu năng ấn tượng, kết nối không dây siêu nhanh và trải nghiệm Apple Pencil thế hệ mới. Cùng với các tính năng mới mạnh mẽ cho hiệu suất công việc và cộng tác ở iPadOS 16. iPad Pro đem đến trải nghiệm iPad cực đỉnh.', 'iPad Pro. Siêu mạnh mẽ với M2.', '28490000', 'iPadProM263.jpg', '128GB', 'Silver', 1, '2023-03-09 17:11:04', NULL),
(11, 'iPhone 14 Plus 512GB', 1, 10, 'iPhone 14 Plus. Nghĩ lớn cùng màn hình 6,7 inch lớn hơn và thời lượng pin bền bỉ cả ngày. Chụp những bức ảnh tuyệt đẹp trong điều kiện thiếu sáng và dư sáng cùng hệ thống camera kép mới. Phát Hiện Va Chạm, một tính năng an toàn mới, thay bạn gọi trợ giúp khi cần kíp.', 'iPhone 14 Plus. Thật lớn', '27390000', 'iphone-14-plus-256gb81.jpg', '512GB', 'Purple', 1, '2023-03-09 17:16:57', NULL),
(12, 'iPad Pro M1 12.9 inch WiFi 512GB', 6, 19, 'Chiếc iPad đỉnh cao với chip Apple M1 siêu mạnh, màn hình Liquid Retina XDR 12.9 inch sống động, kết nối không dây siêu nhanh. Thắt dây an toàn vào đi nào.', 'iPad Pro 12.9 inch (2021)', '29950000', 'ipad-M1-512gb89.jpg', '512GB', 'Space Gray', 1, '2023-03-09 17:18:01', NULL),
(13, 'iPad Air 5', 6, 21, 'iPad Air. Với màn hình Liquid Retina 10.9 inch sống động. Chip Apple M1 đột phá cho hiệu năng nhanh hơn, giúp iPad Air trở nên siêu mạnh mẽ để sáng tạo và chơi game di động. Sở hữu Touch ID, camera tiên tiến, 5G và Wi-Fi 6 nhanh như chớp, cổng USB-C, cùng khả năng hỗ trợ Magic Keyboard và Apple Pencil (thế hệ thứ 2).', 'iPad Air 5 (2022)', '14490000', 'ipad-air44.jpg', '64GB', 'Space Gray', 1, '2023-03-09 17:19:10', NULL),
(14, 'iPad mini 6', 6, 22, 'iPad mini mới. Thiết kế màn hình toàn phần với màn hình Liquid Retina 8.3 inch. Chip A15 Bionic mạnh mẽ với Neural Engine. Camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình. Cổng kết nối USB-C.', 'iPad mini 6 (2021)', '12390000', 'ipad-mini45.jpg', '64GB', 'Space Gray', 1, '2023-03-09 17:20:03', NULL),
(15, 'MacBook Pro M1 2020', 2, 15, 'Thay đổi ngoạn mục nhờ chip Apple M1, với sức mạnh xử lý tăng thêm đến 2.8x, tốc độ xử lý đồ họa nhanh hơn 5x. Và thời lượng pin lên đến 20 giờ, thời lượng pin lâu nhất trong các dòng máy tính Mac từ trước đến nay. Để bạn có thể tiến xa trong công việc, dù đi bất kỳ nơi đâu.', 'MacBook Pro M1', '28550000', 'mac-pro-m199.jpg', '256GB', 'Space Gray', 1, '2023-03-09 17:20:47', NULL),
(16, 'MacBook Air M1 2020 (8GB RAM | 256GB SSD)', 2, 16, 'Là máy tính xách tay mỏng và nhẹ nhất của Apple – nay thay đổi ngoạn mục với chip Apple M1 mạnh mẽ. Tạo ra một cú nhảy vọt về hiệu năng CPU và đồ họa, cùng thời lượng pin lên đến 18 giờ.', 'MacBook Air M1', '19790000', '0006171_gold_55076.webp', '256GB', 'Gold', 0, '2023-03-09 17:23:41', NULL),
(17, 'iMac M1 2021 24 inch (7 Core GPU/8GB/256GB)', 2, 17, 'iMac 24 inch (2021) Thay đổi ngoạn mục với chip Apple M1, iMac nay mỏng ấn tượng và mạnh không thể tưởng. Được tạo tác để nổi bật trong mọi môi trường và phù hợp hoàn toàn với cuộc sống của bạn.', 'Apple iMac M1 2021 24 inch 7-Core GPU 8GB RAM 256GB SSD', '27990000', 'imac74.jpg', '256GB', 'Green', 1, '2023-03-09 17:26:03', NULL),
(18, 'Mac mini M1 8GB RAM', 2, 18, 'Nay có chip Apple M1 mới. Với CPU nhanh hơn đến 3x, GPU nhanh hơn đến 6x và Neural Engine mạnh mẽ cho hiệu năng máy học nhanh hơn đến 15x. Cho hiệu năng khủng mà kích cỡ không đổi.', 'Mac mini M1', '1699000', 'macmini53.jpg', '256GB', 'White', 1, '2023-03-09 17:27:30', NULL),
(19, 'Apple Watch Ultra LTE 49mm Alpine Loop size S', 5, 23, 'Các tính năng và cảm biến chuyên dụng, cùng với ba dây đeo mới được thiết kế cho các hoạt động khám phá, phiêu lưu, và rèn luyện sức bền\r\nVỏ titan hàng không chuyên dụng 49mm cân bằng hoàn hảo giữa các yêu cầu về trọng lượng, độ bền và khả năng chống ăn mòn', 'Apple Watch Ultra LTE', '20390000', 'watchultra47.jpg', '49mm', 'Orange', 1, '2023-03-09 17:29:04', NULL),
(20, 'Apple Watch Series 8 Thép GPS + Cellular', 5, 24, 'Sở hữu các cảm biến và ứng dụng sức khỏe tối tân, vì vậy bạn có thể đo điện tâm đồ (ECG),1 đo nhịp tim và nồng độ oxy trong máu,2 theo dõi sự thay đổi nhiệt độ3 để nắm bắt thông tin chuyên sâu về chu kỳ kinh nguyệt.', 'Apple Watch Series 8 (GPS + Cellular)', '17990000', 'watch820.jpg', '41mm', 'Silver', 1, '2023-03-09 17:30:20', NULL),
(21, 'Apple Watch Series 7 Nhôm GPS + Cellular', 5, 25, 'Màn hình Retina Luôn Bật lớn nhất, tiên tiến nhất giúp mọi tác vụ bạn thực hiện với Apple Watch Series 7 trông lớn hơn và đẹp hơn.', 'Apple Watch Series 7 (GPS)', '10990000', 'watch71.jpg', '41mm', 'Red', 1, '2023-03-09 17:31:14', NULL),
(22, 'Apple Watch SE Nhôm 2022 GPS', 5, 26, 'Các tính năng mới hoàn toàn. Giá vẫn nhẹ nhàng. Các tính năng thiết yếu giúp bạn luôn kết nối, năng động, khỏe mạnh, và an toàn.', 'Apple Watch SE 2022 Nhôm GPS', '6190000', 'watch665.jpg', '40mm', 'Starlight', 1, '2023-03-09 17:32:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) NOT NULL,
  `shipping_email` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `shipping_phone` varchar(255) NOT NULL,
  `shipping_note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_email`, `shipping_address`, `shipping_phone`, `shipping_note`, `created_at`, `updated_at`) VALUES
(90, 'Nguyễn Đình Vũ', 'nguyendinhvutkt@gmail.com', '29/4', '0365741845', '123', '2023-04-24 04:13:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Nguyễn Đình Vũ', 'nguyendinhvutkt@gmail.com', NULL, NULL, NULL, '$2y$10$x9nnCcfboyqkQkvlJKldMO8L.KNhhr.hqsiSHuVjtnVcbLp4yaFt6', NULL, '2023-04-23 20:41:58', '2023-04-23 20:41:58');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
