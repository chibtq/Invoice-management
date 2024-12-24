-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 24, 2024 lúc 08:16 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `jewelry_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `colour_id` int(30) NOT NULL,
  `size_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'Nhẫn', 'Khám phá bộ sưu tập nhẫn tinh tế, từ thiết kế thanh lịch đến kiểu dáng hiện đại, giúp bạn tỏa sáng trong mọi dịp.', '0000-00-00 00:00:00'),
(2, 'Vòng cổ', 'Tôn lên vẻ đẹp quyến rũ với các mẫu vòng cổ đa dạng, kết hợp hoàn hảo giữa phong cách sang trọng và sự sáng tạo.							', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colours`
--

CREATE TABLE `colours` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `color` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `colours`
--

INSERT INTO `colours` (`id`, `product_id`, `color`, `date_created`) VALUES
(1, 2, 'Silver', '2020-11-12 13:00:31'),
(2, 2, 'Gold', '2020-11-12 13:00:31'),
(3, 3, '', '2020-11-12 13:36:42'),
(4, 4, 'Silver', '2020-11-12 13:49:10'),
(5, 5, '', '2020-11-12 13:49:40'),
(6, 6, '', '2024-12-12 21:04:32'),
(7, 7, '', '2024-12-12 21:08:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_id` varchar(200) NOT NULL,
  `user_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `ref_id`, `user_id`, `delivery_address`, `status`, `date_created`) VALUES
(3, 'IMBgCcw1HTqVFPtS', 2, 'Hà nội', 2, '2024-12-07 14:20:48'),
(4, 'aIcXjLSzUQb7ZuVq', 2, 'Hà Đông', 3, '2024-12-12 20:54:56'),
(5, 'TJZI0jRzo3A97P5s', 2, 'Cầu Giấy', 0, '2024-12-12 21:10:16'),
(6, 'dE5Fab3Bh2DCvNxM', 2, 'Ba Đình', 0, '2024-12-12 21:10:40'),
(7, '9YdRft0Z6FHPAXl4', 2, 'Hà nỘi', 0, '2024-12-12 22:38:05'),
(8, 't7Cl8vH6nqbYNQTZ', 2, 'Đông ANh Hà Nội', 0, '2024-12-12 22:42:48'),
(9, 'yegsI28JLS4VbETj', 2, 'Linh Đàm', 0, '2024-12-12 22:43:09'),
(10, 'wjiBVPts6QbAfkn1', 2, 'Hà đông', 0, '2024-12-12 22:55:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `colour_id` int(30) NOT NULL,
  `size_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `colour_id`, `size_id`, `qty`, `price`, `date_created`) VALUES
(4, 3, 2, 1, 2, 2, 3500, '2024-12-07 14:20:48'),
(5, 4, 5, 5, 8, 1, 3500, '2024-12-12 20:54:56'),
(6, 4, 4, 4, 6, 3, 1500, '2024-12-12 20:54:56'),
(7, 5, 6, 6, 9, 2, 2000, '2024-12-12 21:10:16'),
(8, 5, 5, 5, 8, 1, 3500, '2024-12-12 21:10:16'),
(9, 6, 2, 1, 2, 2, 3000, '2024-12-12 21:10:40'),
(10, 7, 3, 3, 5, 1, 3500, '2024-12-12 22:38:05'),
(11, 7, 2, 1, 2, 1, 3000, '2024-12-12 22:38:05'),
(12, 7, 5, 5, 8, 1, 3500, '2024-12-12 22:38:05'),
(13, 8, 3, 3, 5, 2, 3500, '2024-12-12 22:42:48'),
(14, 9, 3, 3, 5, 1, 3500, '2024-12-12 22:43:09'),
(15, 9, 7, 7, 10, 1, 2500, '2024-12-12 22:43:09'),
(16, 10, 7, 7, 10, 1, 2500, '2024-12-12 22:55:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `item_code` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `item_code`, `price`, `date_created`) VALUES
(2, 1, 'Đôi nhẫn bạc mạ Crom', '																																								&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit.&lt;/p&gt;																																																		', 'JCSMmyV453K7xEg9', 3000, '2020-11-12 12:13:24'),
(3, 2, 'Vòng cổ bạc tinh tế', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Aliquam consequat non tortor sed placerat. Mauris pulvinar suscipit est at tempor. Curabitur tempor ornare mauris, vitae sagittis massa congue ac. Nulla nisl ante, convallis at metus non, laoreet feugiat nisi. Proin rutrum lorem ut interdum suscipit. Sed ultrices nec magna eget rutrum. Nunc aliquam mauris vitae accumsan pulvinar. Nullam lorem neque, auctor in nisl vel, accumsan ultrices sapien. Morbi porta, ante at placerat eleifend, risus tellus consequat nisi, quis euismod ipsum ligula ac elit. Ut auctor nulla at sem blandit eleifend. Sed mollis auctor varius. Fusce tristique nibh quis orci sagittis viverra. Nullam consequat vestibulum volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dapibus fermentum nulla et ultricies.&lt;/span&gt;																						', 'b9qSY10cfy7uPmI6', 3500, '2020-11-12 13:36:42'),
(4, 1, 'Nhẫn bạc mạ vàng 67', '																																																								&lt;div style=&quot;text-align: justify;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Nhẫn đơn giản thanh lịch sang trọng&amp;nbsp;&lt;/span&gt;&lt;/font&gt;&lt;/div&gt;																																																	', 'NoHid3pArPCSqTEk', 23000, '2020-11-12 13:49:10'),
(5, 2, 'Vòng cổ bạc đơn giản', '																								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Aliquam consequat non tortor sed placerat. Mauris pulvinar suscipit est at tempor.&amp;nbsp;&lt;/span&gt;', '5KygmkTuPLDaHRob', 3500, '2020-11-12 13:49:40'),
(6, 2, 'Vòng cổ mặt trăng', 'Sang trọng đẳng cấp', 'qxIpQSlbrcCzg1kZ', 2000, '2024-12-12 21:04:32'),
(7, 2, 'Vòng cổ ngọc', '															', 'yQeNp5xmFUiH4ZKC', 2500, '2024-12-12 21:08:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `product_id`, `size`, `date_created`) VALUES
(2, 2, '5 (.62\"/1.57cm)', '2020-11-12 12:13:24'),
(3, 2, '6 (.65\"/1.65cm)', '2020-11-12 12:13:24'),
(4, 2, '7 (.98\"/1.73cm)', '2020-11-12 12:13:24'),
(5, 3, '', '2020-11-12 13:36:42'),
(6, 4, '5 (.62\"/1.57cm)', '2020-11-12 13:49:10'),
(7, 4, '7 (.98\"/1.73cm)', '2020-11-12 13:49:10'),
(8, 5, '', '2020-11-12 13:49:40'),
(9, 6, '', '2024-12-12 21:04:32'),
(10, 7, '7.5 cm', '2024-12-12 21:08:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2= users',
  `avatar` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Admin', 'Admin', '', '+12354654787', 'Sample', 'chi@admin.com', '202cb962ac59075b964b07152d234b70', 1, '', '2020-11-11 15:35:19'),
(2, 'Claire', 'Blake', '', '+12345687', 'Sample Address', 'chi@khach.com', '202cb962ac59075b964b07152d234b70', 2, '', '2020-11-12 14:45:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colours`
--
ALTER TABLE `colours`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `colours`
--
ALTER TABLE `colours`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
