-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2022 at 12:04 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appfinal411`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES
(1, 61, 1, '19979338'),
(1, 43, 1, '1503125'),
(2, 44, 1, '763125'),
(2, 59, 1, '22173600'),
(3, 56, 1, '10855825'),
(3, 45, 2, '69375'),
(4, 61, 1, '19979338'),
(4, 35, 1, '508750');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `sdt` varchar(15) NOT NULL,
  `soluong` int(11) NOT NULL,
  `tongtien` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `trangthai` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`id`, `iduser`, `diachi`, `sdt`, `soluong`, `tongtien`, `email`, `trangthai`) VALUES
(1, 4, 'Quảng Nam', '0935317530', 2, '21482463', 'customer@gmail.com', 0),
(2, 4, 'Đà Nẵng', '0935317530', 2, '22936725', 'customer@gmail.com', 0),
(3, 4, 'Đại Cường, Đại Lộc, Quảng Nam', '0935317530', 3, '10994575', 'customer@gmail.com', 2),
(4, 4, 'Quế Minh, Quế Sơn, Quảng Nam', '0935317530', 2, '20488088', 'customer@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tensanpham` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `hinhanh`) VALUES
(1, 'Trang chủ', 'https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281659830_1316977068791398_8335243275161760806_n.jpg?_nc_cat=107&ccb=1-6&_nc_sid=730e14&_nc_ohc=S7QVu0fnNC4AX8BoVqv&_nc_ht=scontent.fdad8-1.fna&oh=00_AT_rlnu4HrCmXJlapqhWH5E141H-0RqjkhhU3-21oeTRrQ&oe=6287DCD1'),
(2, 'Laptop', 'https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281733452_1316976978791407_4076968276516316644_n.jpg?_nc_cat=101&ccb=1-6&_nc_sid=730e14&_nc_ohc=FV2_5nPmW_IAX_MVJ0a&tn=JrGtNRldu7QY_RvY&_nc_ht=scontent.fdad8-1.fna&oh=00_AT-erXFgqxszaW5h3N8xODOb9QGOuyOMEkUpW2ZmXQTi8Q&oe=6286DC0A'),
(3, 'Phụ kiện', 'https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281789179_1316982768790828_7003528575107302943_n.jpg?_nc_cat=109&ccb=1-6&_nc_sid=730e14&_nc_ohc=SfuLSXu-VhgAX8S4gZJ&_nc_ht=scontent.fdad8-1.fna&oh=00_AT8LrIuPdzubY5FWpyRVW37SFX7X-oyKBtk10daYTQ5tgg&oe=6287D42E'),
(4, 'Liên hệ', 'https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281800252_1316977048791400_3059667288373321672_n.jpg?_nc_cat=107&ccb=1-6&_nc_sid=730e14&_nc_ohc=lIMbiNS3LZcAX_zkPNO&_nc_oc=AQllj42H6ORaxib0YzW95lEu2fna2y6F4AsrW77JrAxcWpV0taoNMOB0-04uJI2rigQ&_nc_ht=scontent.fdad8-1.fna&oh=00_AT-hehrO6zebbuA65MYPv4SKk_GlZn1j_p0m1mYpa6CfsA&oe=62883CA2'),
(5, 'Thông tin', 'https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281753007_1316977112124727_5236469132209632711_n.jpg?_nc_cat=100&ccb=1-6&_nc_sid=730e14&_nc_ohc=4pWaiRFjpO4AX-OfQ-X&_nc_ht=scontent.fdad8-1.fna&oh=00_AT-fYVQm-uvQkCJqJ3mpzA1aNtnZov7cLma-QtknOzXDHQ&oe=62875B3A'),
(6, 'Đơn hàng', 'https://scontent.fdad8-1.fna.fbcdn.net/v/t39.30808-6/281626520_1316977058791399_4844310662071811143_n.jpg?_nc_cat=108&ccb=1-6&_nc_sid=730e14&_nc_ohc=eAsyRc57jiMAX9w331Q&_nc_ht=scontent.fdad8-1.fna&oh=00_AT96RwKijuFe5KOHynD4gxxYvmKeyPY_6G0qgHeDIHHUUw&oe=62873B00');

-- --------------------------------------------------------

--
-- Table structure for table `sanphammoi`
--

CREATE TABLE `sanphammoi` (
  `id` int(11) NOT NULL,
  `tensp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` text COLLATE utf8_unicode_ci NOT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `loai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanphammoi`
--

INSERT INTO `sanphammoi` (`id`, `tensp`, `gia`, `hinhanh`, `mota`, `loai`) VALUES
(1, 'Asus TUF Gaming FX706HE i7', '19632875', '1.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(2, 'Asus TUF Gaming FX516PM i7', '8084125', '2.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(3, 'Asus ZenBook UX482EA i7', '15013375', '3.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(4, 'MSI Modern 14 i3', '10255290', '4.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(5, 'HP 240 G8 i5 1135G7', '10855825', '5.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(6, 'Dell Vostro 5510 i5', '6005350', '6.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(7, 'Laptop Dell Vostro i7', '12934600', '7.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(8, 'Dell Gaming G3 i7', '22173600', '8.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(9, 'Acer Predator Helios i7', '30719675', '9.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(10, 'Acer Aspire 3 i5', '19979338', '10.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(11, 'Acer Swift 3 i5', '17785075', '11.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(12, 'Lenovo IdeaPad Slim 5', '20325800', '12.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(13, 'Lenovo Ideapad 5 i5', '12010700', '13.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(14, 'Lenovo ThinkBook 14 i7', '10855825', '14.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(15, 'HP Gaming VICTUS 16 R5', '17092150', '15.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(16, 'HP Pavilion Gaming i7', '22635550', '16.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(17, 'Lenovo Legion 5 Gaming i7', '9943750', '17.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(18, 'MSI Katana Gaming GF66 i7', '20350000', '18.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(19, 'Gigabyte G5 i5 11400H', '24743750', '19.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(20, 'Asus TUF Gaming FX706HC i5', '25437500', '20.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(21, 'Acer Swift 5 i7', '25900000', '21.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(22, 'Lenovo Yoga 7 14ITL5 i7\r\n', '28906250', '22.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(23, 'GIGABYTE Gaming G5 i5', '28906250', '23.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(24, 'Dell Inspiron 7400 i5', '31218750', '24.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(25, 'MacBook Air M1 2020 7-core GPU\r\n', '32375000', '25.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(26, 'Dell Gaming G15', '33300000', '26.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(27, 'Acer Nitro 5 Gaming i5', '33531250', '27.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(28, 'MacBook Pro M1 2020', '34687500', '28.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(29, 'MSI GF65 Thin 10UE i5', '34687500', '29.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(30, 'Asus TUF Gaming FX516PE i7', '35843750', '30.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(31, 'MacBook Air M1 2020 8-core GPU', '37000000', '31.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(32, 'HP EliteBook X360 830 G8 i7', '44862500', '32.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(33, 'Balo Laptop 15.6 inch Xiaomi City', '624375', '33.jpg', '1. Thiết kế thời trang phù hợp với nhiều lứa tuổi khác nhau.\r\n2. Sử dụng chất liệu cao cấp có độ bền cao, kháng nước và gọn nhẹ.\r\n3. Dây đeo vai thiết kế bản lớn chịu lực tốt.\r\n4. Chống sốc tốt, hạn chế thấp nhất rủi ro hư hỏng cho các thiết bị.\r\n5. Nhiều ngăn tiện lợi trong đó có 1 ngăn đựng vừa laptop 15.6 inch.', 2),
(35, 'Túi chống sốc Laptop 15.6 inch', '508750', '35.jpg', 'Vẻ ngoài gọn gàng, phủ sắc đen sang trọng, dễ dàng mang theo. \r\nSử dụng cho máy tính xách tay, máy tính bảng, thiết bị 2 trong 1 có kích thước 15.6 inch. \r\nLàm từ vật liệu Poly, PU có độ bền cao, không bị biến dạng, các góc bọc cao su tổng hợp chống sốc tối ưu. \r\nThiết kế ngăn phụ đính khóa kéo riêng bảo quản an toàn cho sách vở, chìa khóa, ví tiền,...\r\n', 2),
(36, 'Chuột Gaming Logitech G102 Gen2', '578125', '36.jpg', 'Tương thích: Windows\r\nĐộ phân giải mặc định: 8000 DPI\r\nCách kết nối: Dây cắm USB\r\nĐộ dài dây/Khoảng cách kết nối: Dây dài 209 cm\r\nĐèn LED: RGB 16.8 triệu màu\r\nỨng dụng điều khiển: Logitech G HUB\r\nTrọng lượng: 85 g\r\nThương hiệu của: Thụy Sĩ\r\nSản xuất tại: Trung Quốc\r\nHãng: Logitech.', 2),
(37, 'Chuột Logitech Master 3 Đen', '2196875', '37.jpg', 'Tương thích: Windows\r\nĐộ phân giải mặc định: 8000 DPI\r\nCách kết nối: Dây cắm USB\r\nĐộ dài dây/Khoảng cách kết nối: Dây dài 209 cm\r\nĐèn LED: RGB 16.8 triệu màu\r\nỨng dụng điều khiển: Logitech G HUB\r\nTrọng lượng: 85 g\r\nThương hiệu của: Thụy Sĩ\r\nSản xuất tại: Trung Quốc\r\nHãng: Logitech.', 2),
(39, 'Loa Bluetooth Sony SRS-XB13', '1271875', '39.jpg', 'Tổng công suất:5 W\r\nNguồn: Pin\r\nThời gian sử dụng: Dùng khoảng 16 tiếngSạc khoảng 4 - 5 tiếng\r\nKết nối không dây: Bluetooth 4.2\r\nTiện ích: Chống nước, chống bụi IP67Kết nối cùng lúc 2 loa\r\nPhím điều khiển: Bật/tắt bluetoothNghe/nhận cuộc gọiNút nguồnPhát/dừng chơi nhạcTăng/giảm âm lượng\r\nThương hiệu của: Nhật Bản\r\nHãng: Sony.', 2),
(40, 'Loa Bluetooth Sony Extra Bass SRS', '161875', '40.jpg', 'Tổng công suất:5 W\r\nNguồn: Pin\r\nThời gian sử dụng: Dùng khoảng 16 tiếngSạc khoảng 4 - 5 tiếng\r\nKết nối không dây: Bluetooth 4.2\r\nTiện ích: Chống nước, chống bụi IP67Kết nối cùng lúc 2 loa\r\nPhím điều khiển: Bật/tắt bluetoothNghe/nhận cuộc gọiNút nguồnPhát/dừng chơi nhạcTăng/giảm âm lượng\r\nThương hiệu của: Nhật Bản\r\nHãng: Sony.', 2),
(41, 'Tai nghe Có Dây Chụp Tai Sony MDR', '578125', '41.jpg', 'Jack cắm: 3.5 mm\r\nTương thích: AndroidiOS (iPhone)Windows Phone\r\nTiện ích: Có mic thoại\r\nĐiều khiển bằng: Phím nhấn\r\nPhím điều khiển: Mic thoạiNghe/nhận cuộc gọiPhát/dừng chơi nhạc\r\nHãng: Sony.', 2),
(42, 'Tai nghe chụp tai Sony Extra Bass MDR', '1040625', '42.jpg', 'Jack cắm: 3.5 mm\r\nTương thích: AndroidiOS (iPhone)Windows Phone\r\nTiện ích: Có mic thoại\r\nĐiều khiển bằng: Phím nhấn\r\nPhím điều khiển: Mic thoạiNghe/nhận cuộc gọiPhát/dừng chơi nhạc\r\nHãng: Sony.', 2),
(43, 'Tai nghe Gaming Logitech G Pro Đen', '1503125', '43.jpg', 'Jack cắm: 3.5 mm\r\nTương thích: AndroidiOS (iPhone)Windows Phone\r\nTiện ích: Có mic thoại\r\nĐiều khiển bằng: Phím nhấn\r\nPhím điều khiển: Mic thoạiNghe/nhận cuộc gọiPhát/dừng chơi nhạc\r\nHãng: Sony.', 2),
(49, 'Asus TUF Gaming FX706HE i7', '19632875', '49.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(50, 'Asus TUF Gaming FX516PM i7', '8084125', '50.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(51, 'Asus ZenBook UX482EA i7', '15013375', '51.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(52, 'Balo Laptop 15.6 inch Xiaomi City', '624375', '52.jpg', '1. Thiết kế thời trang phù hợp với nhiều lứa tuổi khác nhau.\r\n2. Sử dụng chất liệu cao cấp có độ bền cao, kháng nước và gọn nhẹ.\r\n3. Dây đeo vai thiết kế bản lớn chịu lực tốt.\r\n4. Chống sốc tốt, hạn chế thấp nhất rủi ro hư hỏng cho các thiết bị.\r\n5. Nhiều ngăn tiện lợi trong đó có 1 ngăn đựng vừa laptop 15.6 inch.', 2),
(54, 'Túi chống sốc Laptop 15.6 inch', '508750', '54.jpg', 'Vẻ ngoài gọn gàng, phủ sắc đen sang trọng, dễ dàng mang theo. \r\nSử dụng cho máy tính xách tay, máy tính bảng, thiết bị 2 trong 1 có kích thước 15.6 inch. \r\nLàm từ vật liệu Poly, PU có độ bền cao, không bị biến dạng, các góc bọc cao su tổng hợp chống sốc tối ưu. \r\nThiết kế ngăn phụ đính khóa kéo riêng bảo quản an toàn cho sách vở, chìa khóa, ví tiền,...\r\n', 2),
(55, 'MSI Modern 14 i3', '10255290', '55.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(56, 'HP 240 G8 i5 1135G7', '10855825', '56.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(57, 'Dell Vostro 5510 i5', '6005350', '57.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(58, 'Laptop Dell Vostro i7', '12934600', '58.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(59, 'Dell Gaming G3 i7', '22173600', '59.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(60, 'Acer Predator Helios i7', '30719675', '60.jpg', 'CPU:\r\ni711800H2.30 GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz\r\nỔ cứng:\r\nSSD 512 GB NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng\r\nMàn hình:\r\n17.3\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3050Ti 4GB\r\nCổng kết nối:\r\nJack tai nghe 3.5 mmThunderbolt 4 USB-C3 x USB 3.2HDMILAN (RJ45)\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg\r\nThời điểm ra mắt:\r\n2021', 1),
(61, 'Acer Aspire 3 i5', '19979338', '61.jpg', 'CPU:\r\ni711370H3.3GHz\r\nRAM:\r\n8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz\r\nỔ cứng:\r\nHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)\r\nMàn hình:\r\n15.6\"Full HD (1920 x 1080)144Hz\r\nCard màn hình:\r\nCard rờiRTX 3060 6GB\r\nCổng kết nối:\r\n3 x USB 3.2HDMI 2.0Jack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C\r\nĐặc biệt:\r\nCó đèn bàn phím\r\nHệ điều hành:\r\nWindows 10 Home SL\r\nThiết kế:\r\nVỏ nhựa - nắp lưng bằng kim loại\r\nKích thước, trọng lượng:\r\nDài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg\r\nThời điểm ra mắt:\r\n2021', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `sdt` varchar(15) NOT NULL,
  `uid` text NOT NULL,
  `token` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `username`, `sdt`, `uid`, `token`, `status`) VALUES
(1, 'nthhanh.20it10@vku.udn.vn', '11092002', 'honghanh', '0706114371', 'FWmEWjWH9dZviGqqS6DdA9gHjC23', 'foxIsxYnTsCD2_4_mwlHPL:APA91bGcsgjf8R9ikzxAqsi6ByUDW1ggcsImuwsa5FLlhllbr8AdgFvdmnNbK3VVVz5HeGtbAZJ_wls0UhwzD76gYodNp_DUIUI7sTi4OWfu1m1eZG8gVaj9UuJDspL_1fzf7SfDtOdt', 1),
(2, 'npthinh.20it2@vku.udn.vn', '04112002', 'phuocthinh', '0973309606', 'CiwPcqMjKIUXBeGmvZE7sVdNmuB2', 'dLogx7-oRey8YEaFhoMqVC:APA91bFzzCD7ES6zHFio4TBakIvJzhr8KFoMzOHBv0tF3rNREaYZ-xSmbMipeTA972bktq4CSp5ZzcjYIlGliNBQzhvwhzN1MDX55fYp6TBgRELp5vOacZu_MqN5g_SCA45UCYz4CZIA', 1),
(3, 'test@gmail.com', '12345678', 'test', '0123456789', 'EzqicKYylcQJCoxKPLSjvNvRT1U2', 'dLogx7-oRey8YEaFhoMqVC:APA91bFzzCD7ES6zHFio4TBakIvJzhr8KFoMzOHBv0tF3rNREaYZ-xSmbMipeTA972bktq4CSp5ZzcjYIlGliNBQzhvwhzN1MDX55fYp6TBgRELp5vOacZu_MqN5g_SCA45UCYz4CZIA', 0),
(4, 'customer@gmail.com', '12345678', 'customer', '0935317530', 'nfAGXtjzN8a4WJe68FmHzNjZkh23', 'dLogx7-oRey8YEaFhoMqVC:APA91bFzzCD7ES6zHFio4TBakIvJzhr8KFoMzOHBv0tF3rNREaYZ-xSmbMipeTA972bktq4CSp5ZzcjYIlGliNBQzhvwhzN1MDX55fYp6TBgRELp5vOacZu_MqN5g_SCA45UCYz4CZIA', 0),
(5, 'nthhnguyenhanh@gmail.com', '11092002', 'hanh', '0706114371', '4txqCSedtMT0o7i2ehFrPw0Y5fy1', '', 0),
(6, 'hanhnguyen.1109@gmail.com', 'hanhnguyen', 'hanhnguyen', '0999333555', '3Cx2Y1xLUGbhJvQQs6Hg4k6FFZw1', '', 0),
(7, 'hanhnguyen.110902@gmail.com', '11092002', 'hanh1109', '01628364954', 'H6KFPcu5NlUUd33qrd5739cZmBn1', 'dLogx7-oRey8YEaFhoMqVC:APA91bFzzCD7ES6zHFio4TBakIvJzhr8KFoMzOHBv0tF3rNREaYZ-xSmbMipeTA972bktq4CSp5ZzcjYIlGliNBQzhvwhzN1MDX55fYp6TBgRELp5vOacZu_MqN5g_SCA45UCYz4CZIA', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanphammoi`
--
ALTER TABLE `sanphammoi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sanphammoi`
--
ALTER TABLE `sanphammoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
