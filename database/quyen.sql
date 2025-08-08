-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 22, 2024 lúc 02:23 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quyen`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rpos_admin`
--

CREATE TABLE `rpos_admin` (
  `admin_id` varchar(200) NOT NULL,
  `admin_name` varchar(200) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rpos_admin`
--

INSERT INTO `rpos_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
('10e0b6dc958adfb5b094d8935a13aeadbe783c25', 'Admin', 'admin@gmail.com', '39a7634d82053a4703622d40816d6c770451b7a6');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rpos_customers`
--

CREATE TABLE `rpos_customers` (
  `customer_id` varchar(200) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_phoneno` varchar(200) NOT NULL,
  `customer_email` varchar(200) NOT NULL,
  `customer_password` varchar(200) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rpos_customers`
--

INSERT INTO `rpos_customers` (`customer_id`, `customer_name`, `customer_phoneno`, `customer_email`, `customer_password`, `created_at`) VALUES
('06549ea58afd', 'Minh', '4589698780', 'minh@gmail.com', '413d928b1fbc75e6ee4967605d0468c85d3e739a', '2024-12-22 12:55:23.853292'),
('1fc1f694985d', 'Nam', '2145896547', 'nam@gmail.com', '9beb97aab68d9e7c2b058e0b24e25e0391328bee', '2024-12-22 12:54:09.062354'),
('27e4a5bc74c2', 'Linh', '4589654780', 'linh@gmail.com', '9bcc3cd3ec0285e501dcc6280ef6e1e6e692903a', '2024-12-22 12:56:57.709295'),
('29c759d624f9', 'Thịnh', '5896321002', 'thinh@gmail.com', '8750644b203c7ef65d60e3583ec78e1d11360b86', '2024-12-22 13:22:07.308634'),
('35135b319ce3', 'Quyến', '7412569698', 'quyen@gmail.com', 'ff689279d72367aba303e6873d7021135d4d36f3', '2024-12-22 12:53:52.345199'),
('3859d26cd9a5', 'Giang', '7856321000', 'giang@gmail.com', '757664055b1456ede3146223a34d24e1b4e840ca', '2024-12-22 12:56:41.790780'),
('7c8f2100d552', 'Thành', '3210145550', 'thanh@gmail.com', '549c6e60d442bf5edcaa768c9699b6ccefb9d909', '2024-12-22 12:54:48.331054'),
('9c7fcc067bda', 'Đạt', '7850001256', 'dat@gmail.com', '3890632ad9be29b27b6b57a7fedf28b5becf9734', '2024-12-22 12:56:10.929030'),
('9f6378b79283', 'Đức', '7145665870', 'duc@gmail.com', '131aab1bf1bbcc6d1392cc6932927cfcfe31dbfa', '2024-12-22 13:22:32.110116'),
('d7c2db8f6cbf', 'Hải', '1458887896', 'hai@gmail.com', '7dd10197722eeb89d12bc7a1379293891d520218', '2024-12-22 13:22:18.005516'),
('e711dcc579d9', 'Hà', '3245557896', 'ha@gmail.com', '59d7b76cd06247735831316bf33a2b2205b96bd4', '2024-12-22 12:56:24.620747'),
('fe6bb69bdd29', 'Sơn', '1020302055', 'son@gmail.com', '13065fb9d968db5344c58a4ff83f7d3beb0c98ee', '2024-12-22 12:54:29.977707');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rpos_orders`
--

CREATE TABLE `rpos_orders` (
  `order_id` varchar(200) NOT NULL,
  `order_code` varchar(200) NOT NULL,
  `customer_id` varchar(200) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `prod_id` varchar(200) NOT NULL,
  `prod_name` varchar(200) NOT NULL,
  `prod_price` varchar(200) NOT NULL,
  `prod_qty` varchar(200) NOT NULL,
  `order_status` varchar(200) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rpos_orders`
--

INSERT INTO `rpos_orders` (`order_id`, `order_code`, `customer_id`, `customer_name`, `prod_id`, `prod_name`, `prod_price`, `prod_qty`, `order_status`, `created_at`) VALUES
('019661e097', 'AEHM-0653', '06549ea58afd', 'Minh', 'bd200ef837', 'Cà phê Thổ Nhĩ Kỳ', '80000', '1', 'Đã thanh toán', '2024-10-19 13:26:00.331494'),
('49c1bd8086', 'IUSP-9453', 'fe6bb69bdd29', 'Nam', 'd57cd89073', 'Bít tết chiên kiểu miền quê', '100000', '1', 'Đã thanh toán', '2024-12-03 11:50:40.496625'),
('514ada5047', 'OTEV-8532', '3859d26cd9a5', 'Thành', '0c4b5c0604', 'Mỳ Ý sốt bò bằm', '150000', '1', 'Đã thanh toán', '2024-12-03 13:13:38.855058'),
('6466fd5ee5', 'COXP-6018', '7c8f2100d552', 'Thịnh', '31dfcc94cf', 'Cánh gà Buffalo', '110000', '2', 'Đã thanh toán', '2024-12-03 12:17:44.639979'),
('80ab270866', 'JFMB-0731', '35135b319ce3', 'Quyến', '97972e8d63', 'Cà phê Ireland', '40000', '1', 'Đã thanh toán', '2024-10-04 16:37:03.655834'),
('8815e7edfc', 'QOEH-8613', '29c759d624f9', 'Đạt', '2b976e49a0', 'Hamburger phô mai', '30000', '3', 'Đã thanh toán', '2024-10-05 12:02:32.926529'),
('a27f1d87be', 'EJKA-4501', '35135b319ce3', 'Hà', 'ec18c5a4f0', 'Xúc xích chiên bột', '40000', '2', 'Đã thanh toán', '2024-12-04 16:31:54.525284'),
('a74337db7e', 'ZPXD-6951', 'e711dcc579d9', 'Linh', 'a5931158fe', 'Thịt lợn xé', '80000', '2', 'Đã thanh toán', '2024-11-03 13:12:46.959558'),
('af52d0022d', 'FNAB-9142', '35135b319ce3', 'Sơn', '2fdec9bdfb', 'Jambalaya', '90000', '2', 'Đã thanh toán', '2024-11-04 16:32:14.852482'),
('c051fc38eb', 'ONSY-2465', '57b7541814ed', 'Đạt', '826e6f687f', 'Pizza Margherita', '120000', '1', 'Đã thanh toán', '2024-12-14 08:35:50.172062'),
('fc79a55455', 'INHG-0875', '9c7fcc067bda', 'Hải', '3adfdee116', 'Enchiladas', '70000', '1', 'Đã thanh toán', '2024-12-04 16:35:22.470600');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rpos_payments`
--

CREATE TABLE `rpos_payments` (
  `pay_id` varchar(200) NOT NULL,
  `pay_code` varchar(200) NOT NULL,
  `order_code` varchar(200) NOT NULL,
  `customer_id` varchar(200) NOT NULL,
  `pay_amt` varchar(200) NOT NULL,
  `pay_method` varchar(200) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rpos_payments`
--

INSERT INTO `rpos_payments` (`pay_id`, `pay_code`, `order_code`, `customer_id`, `pay_amt`, `pay_method`, `created_at`) VALUES
('0bf592', '9UMWLG4BF8', 'EJKA-4501', '35135b319ce3', '80000', 'Tiền mặt', '2024-12-04 16:31:54.525284'),
('4423d7', 'QWERT0YUZ1', 'JFMB-0731', '35135b319ce3', '40000', 'Tiền mặt', '2024-10-04 16:37:03.655834'),
('442865', '146XLFSC9V', 'INHG-0875', '9c7fcc067bda', '70000', 'Chuyển khoản', '2024-12-04 16:35:22.470600'),
('65891b', 'MF2TVJA1PY', 'ZPXD-6951', 'e711dcc579d9', '160000', 'Tiền mặt', '2024-11-03 13:12:46.959558'),
('75ae21', '1QIKVO69SA', 'IUSP-9453', 'fe6bb69bdd29', '100000', 'Tiền mặt', '2024-12-03 11:50:40.496625'),
('7e1989', 'KLTF3YZHJP', 'QOEH-8613', '29c759d624f9', '90000', 'Tiền mặt', '2024-10-05 12:02:32.926529'),
('968488', '5E31DQ2NCG', 'COXP-6018', '7c8f2100d552', '220000', 'Tiền mặt', '2024-12-03 12:17:44.639979'),
('984539', 'LSBNK1WRFU', 'FNAB-9142', '35135b319ce3', '180000', 'Chuyển khoản', '2024-11-04 16:32:14.852482'),
('9fcee7', 'AZSUNOKEI7', 'OTEV-8532', '3859d26cd9a5', '150000', 'Tiền mặt', '2024-12-03 13:13:38.855058'),
('c81d2e', 'WERGFCXZSR', 'AEHM-0653', '06549ea58afd', '80000', 'Tiền mặt', '2024-10-19 13:26:00.331494'),
('e46e29', 'QMCGSNER3T', 'ONSY-2465', '57b7541814ed', '120000', 'Tiền mặt', '2024-12-14 08:35:50.172062');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rpos_products`
--

CREATE TABLE `rpos_products` (
  `prod_id` varchar(200) NOT NULL,
  `prod_code` varchar(200) NOT NULL,
  `prod_name` varchar(200) NOT NULL,
  `prod_img` varchar(200) NOT NULL,
  `prod_desc` longtext NOT NULL,
  `prod_price` varchar(200) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rpos_products`
--

INSERT INTO `rpos_products` (`prod_id`, `prod_code`, `prod_name`, `prod_img`, `prod_desc`, `prod_price`, `created_at`) VALUES
('06dc36c1be', 'FCWU-5762', 'Bánh mì bít tết phô mai', 'cheesestk.jpg', 'Bánh mì bít tết phô mai là một loại bánh sandwich làm từ các lát thịt bò mỏng và phô mai tan chảy trong ổ bánh mì dài. Đây là một món ăn nhanh nổi tiếng có nguồn gốc từ thành phố Philadelphia, bang Pennsylvania, Mỹ.', '70000', '2024-12-03 04:02:47.738370'),
('0c4b5c0604', 'JRZN-9518', 'Mỳ Ý sốt bò bằm', 'spaghetti_bolognese.jpg', 'Mỳ Ý sốt bò bằm gồm có mì Ý (sợi dài) và sốt ragù kiểu Ý (sốt thịt) làm từ thịt bò bằm, thịt xông khói và cà chua, ăn kèm với phô mai Parmesan. Đây là một trong những món mì phổ biến nhất ngoài nước Ý.', '150000', '2024-12-03 03:43:27.610897'),
('14c7b6370e', 'QZHM-0391', 'Bánh mì Reuben', 'reubensandwich.jpg', 'Bánh mì Reuben là một loại bánh sandwich nướng kiểu Bắc Mỹ, bao gồm thịt bò muối, phô mai Thụy Sĩ, dưa bắp cải và sốt Nga hoặc sốt Thousand Island, nướng giữa hai lát bánh mì lúa mạch đen. Mặc dù liên quan đến các tiệm ăn phong cách kosher, nhưng nó không phải là món kosher do kết hợp thịt và phô mai.', '80000', '2024-12-03 03:58:04.069144'),
('1e0fa41eee', 'ICFU-1406', 'Bánh mì kiểu tàu ngầm', 'submarine_sndwh.jpg', 'Bánh mì kiểu tàu ngầm, thường được gọi là sub, hoagie, hero, Italian, grinder, wedge, hoặc spuckie, là một loại bánh sandwich nóng hoặc lạnh của Mỹ được làm từ ổ bánh mì dài chia đôi và nhồi thịt, phô mai, rau và gia vị.', '80000', '2024-12-03 03:55:23.020144'),
('2b976e49a0', 'CEWV-9438', 'Hamburger phô mai', 'cheeseburgers.jpg', 'Hamburger phô mai là món hamburger được phủ phô mai. Truyền thống, lát phô mai được đặt lên miếng thịt ngay trước khi phục vụ, để phô mai có thể tan chảy. Hamburger phô mai có thể có nhiều biến thể về cấu trúc, thành phần và cách chế biến.', '30000', '2024-12-03 03:45:47.282634'),
('2fdec9bdfb', 'UJAK-9614', 'Jambalaya', 'Jambalaya.jpg', 'Jambalaya là một món cơm kiểu Creole và Cajun của Mỹ, chịu ảnh hưởng từ Pháp, Châu Phi và Tây Ban Nha, chủ yếu bao gồm thịt và rau trộn với cơm.', '90000', '2024-12-03 03:48:49.593618'),
('31dfcc94cf', 'SYQP-3710', 'Cánh gà Buffalo', 'buffalo_wings.jpg', 'Cánh gà Buffalo là một món ăn kiểu Mỹ làm từ phần cánh gà không tẩm bột, thường được chiên giòn và sau đó nhúng vào nước sốt làm từ giấm, ớt cayenne và bơ tan chảy trước khi phục vụ.', '110000', '2024-12-03 03:51:09.829079'),
('3adfdee116', 'HIPF-5346', 'Enchiladas', 'enchiladas.jpg', 'Enchilada là một món ăn Mexico làm từ bánh ngô cuộn quanh nhân và phủ sốt mặn. Enchiladas có thể được nhồi nhiều nguyên liệu khác nhau, bao gồm thịt, phô mai, đậu, khoai tây, rau, hoặc các kết hợp khác.', '70000', '2024-12-03 05:52:26.427554'),
('3d19e0bf27', 'EMBH-6714', 'Chili Cincinnati', 'cincinnatichili.jpg', 'Chili Cincinnati là một loại sốt thịt có hương vị Địa Trung Hải, được sử dụng làm topping cho mì spaghetti hoặc bánh mì kẹp. Món ăn này được phát triển bởi các nhà hàng của người nhập cư vào những năm 1920.', '90000', '2024-12-03 05:57:39.265554'),
('4e68e0dd49', 'QLKW-0914', 'Caramel Macchiato', '', 'Sữa nóng, cà phê espresso và caramel; còn gì hấp dẫn hơn? Hương vị này là lựa chọn yêu thích của những người yêu cà phê bởi sự kết hợp táo bạo giữa caramel ngọt ngào và vị cà phê mạnh mẽ.', '40000', '2024-12-03 01:55:51.237667'),
('5d66c79953', 'GOEW-9248', 'Phô mai cục', 'cheesecurd.jpg', 'Phô mai cục là những miếng phô mai ướt được làm đông kết, có thể ăn riêng hoặc dùng trong các món ăn chế biến sẵn. Món này phổ biến ở Quebec (Canada) với món poutine, cũng như ở miền đông bắc, trung tây, miền núi và tây bắc Thái Bình Dương của Mỹ, đặc biệt ở Wisconsin và Minnesota.', '60000', '2024-12-03 04:22:25.639690'),
('826e6f687f', 'AYFW-2683', 'Pizza Margherita', 'margherita-pizza0.jpg', 'Pizza Margherita, như người Ý gọi, là một món pizza đơn giản đến từ Naples. Pizza Margherita chuẩn chỉnh có vỏ bánh phồng rộp, sốt cà chua nghiền San Marzano, phô mai mozzarella tươi và lá húng quế, thêm chút dầu olive và muối.', '120000', '2024-12-03 01:02:57.213354'),
('97972e8d63', 'CVWJ-6492', 'Cà phê Ireland', 'irishcoffee.jpg', 'Cà phê Ireland là một loại đồ uống có cồn kết hợp giữa rượu whiskey Ireland, cà phê nóng và đường, khuấy đều, và phủ kem lên trên. Cà phê được uống qua lớp kem.', '40000', '2024-12-03 06:08:19.157649'),
('a419f2ef1c', 'EPNX-3728', 'Gà viên chiên', 'chicnuggets.jpeg', 'Gà viên chiên là sản phẩm thực phẩm làm từ miếng thịt gà đã được rút xương, sau đó tẩm bột hoặc phủ bột rồi chiên hoặc nướng. Món này được phát minh vào những năm 1950 và trở thành món ăn nhanh phổ biến, cũng như được bán đông lạnh rộng rãi để sử dụng tại nhà.', '50000', '2024-12-03 05:44:07.749371'),
('a5931158fe', 'ELQN-5204', 'Thịt lợn xé', 'pulledprk.jpeg', 'Thịt lợn xé là món ăn BBQ của Mỹ, cụ thể là món ăn miền Nam, làm từ thịt vai lợn được nướng chậm trên than củi; các biến thể trong nhà có thể dùng nồi hầm chậm. Thịt sau đó được xé bằng tay và trộn với sốt.', '80000', '2024-12-03 06:04:12.191403'),
('b2f9c250fd', 'XNWR-2768', 'Bánh dâu rabarbar', 'rhuharbpie.jpg', 'Bánh rabarbar là một loại bánh có nhân rabarbar. Đây là món bánh phổ biến ở Anh, nơi cây rabarbar được trồng từ thế kỷ 17, và phần cuống lá đã được ăn từ thế kỷ 18. Ngoài rabarbar cắt nhỏ, bánh gần như luôn chứa một lượng lớn đường để cân bằng vị chua gắt của cây.', '70000', '2024-12-03 06:06:28.235333'),
('bd200ef837', 'HEIY-6034', 'Cà phê Thổ Nhĩ Kỳ', 'turkshcoffee.jpg', 'Cà phê Thổ Nhĩ Kỳ là một phong cách pha cà phê sử dụng ấm cezve với cà phê xay cực mịn, không lọc.', '80000', '2024-12-03 06:09:50.234898'),
('cff0cb495a', 'ZOBW-2640', 'Cà phê Americano', '', 'Nhiều đồ uống làm từ espresso thường sử dụng sữa, nhưng không phải cà phê Americano. Đồ uống này sử dụng espresso, nhưng được pha loãng với nước nóng thay vì sữa, tạo ra một thức uống cà phê.', '30000', '2024-12-03 01:56:18.824990'),
('d57cd89073', 'ZGQW-9480', 'Bò bít tết chiên kiểu miền quê', 'country_fried_stk.jpg', 'Bò bít tết chiên kiểu miền quê, còn được gọi là bít tết gà rán, là món ăn kiểu Mỹ gồm một miếng thịt bò tẩm bột gia vị và chiên ngập dầu hoặc chiên áp chảo. Đây là món ăn phổ biến ở miền Nam nước Mỹ.', '100000', '2024-12-03 04:00:05.523519'),
('d9aed17627', 'FIKD-9703', 'Bánh cua', 'crabcakes.jpg', 'Bánh cua là một loại bánh làm từ thịt cua và các nguyên liệu khác như vụn bánh mì, mayonnaise, mù tạt, trứng và gia vị. Bánh được xào, nướng, áp chảo, chiên ngập dầu hoặc nướng lửa trên.', '16000', '2024-12-03 05:54:52.120847'),
('e2195f8190', 'HKCR-2178', 'Mì Carbonara', 'carbonaraimgre.jpg', 'Carbonara là một món mì của Ý đến từ Rome, làm từ trứng, phô mai cứng, thịt heo muối và tiêu đen. Món ăn này được đặt tên và hoàn thiện như hiện nay vào giữa thế kỷ 20. Phô mai thường dùng là Pecorino Romano, Parmigiano-Reggiano, hoặc kết hợp cả hai.', '160000', '2024-12-03 03:23:06.266420'),
('e2af35d095', 'IDLC-7819', 'Pizza Pepperoni', 'peperopizza.jpg', 'Pizza pepperoni là một loại pizza của Mỹ, phủ pepperoni – một loại xúc xích cay được làm từ thịt lợn và thịt bò xông khói, được ướp với ớt bột hoặc tiêu cay. Pepperoni cắt lát mỏng là một trong những loại topping pizza phổ biến nhất ở Mỹ.', '70000', '2024-12-03 05:49:01.017677'),
('e769e274a3', 'AHRW-3894', 'Frappuccino', 'frappuccino.jpg', 'Frappuccino là một dòng đồ uống đá xay được Starbucks bán. Nó bao gồm cơ sở là cà phê hoặc kem, xay nhuyễn với đá và các nguyên liệu như siro hương liệu, thường được phủ kem tươi và gia vị.', '30000', '2024-12-03 06:11:30.109467'),
('ec18c5a4f0', 'PQFV-7049', 'Xúc xích chiên bột', '', 'Corn dog là một loại xúc xích xiên que được nhúng trong lớp bột ngô dày và chiên ngập dầu. Món này có nguồn gốc từ Mỹ và thường xuất hiện trong ẩm thực Mỹ.', '40000', '2024-12-22 10:46:33.346697'),
('f4ce3927bf', 'EAHD-1980', 'Bánh mì kẹp xúc xích', '', 'Bánh mì kẹp xúc xích là món ăn gồm xúc xích được nướng hoặc hấp, kẹp trong ổ bánh mì chia đôi. Từ \"hot dog\" cũng dùng để chỉ xúc xích trong món ăn này. Loại xúc xích thường dùng là wiener hoặc frankfurter.', '40000', '2024-12-22 10:46:41.616917'),
('f9c2770a32', 'YXLA-2603', 'Sữa lắc kem', 'milkshake.jpeg', 'Sữa lắc kem là một loại sữa lắc được làm từ kem, sữa, và các hương liệu khác, đánh bông đến khi mịn và sánh đặc. Món này có thể được thêm các nguyên liệu như siro, trái cây, hoặc sô-cô-la để tạo ra nhiều hương vị hấp dẫn. Sữa lắc thường được dùng kèm kem tươi và trang trí bằng trái cây hoặc bánh kẹo nhỏ, mang đến một món đồ uống ngọt ngào và thơm ngon.', '80000', '2024-12-03 01:54:02.727645');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rpos_staff`
--

CREATE TABLE `rpos_staff` (
  `staff_id` int(20) NOT NULL,
  `staff_name` varchar(200) NOT NULL,
  `staff_number` varchar(200) NOT NULL,
  `staff_email` varchar(200) NOT NULL,
  `staff_password` varchar(200) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rpos_staff`
--

INSERT INTO `rpos_staff` (`staff_id`, `staff_name`, `staff_number`, `staff_email`, `staff_password`, `created_at`) VALUES
(2, 'quyen', 'QEUY-9042', 'cashier@gmail.com', 'quyen', '2024-12-22 10:41:26.471617');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `rpos_admin`
--
ALTER TABLE `rpos_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `rpos_customers`
--
ALTER TABLE `rpos_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `rpos_orders`
--
ALTER TABLE `rpos_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `CustomerOrder` (`customer_id`),
  ADD KEY `ProductOrder` (`prod_id`);

--
-- Chỉ mục cho bảng `rpos_payments`
--
ALTER TABLE `rpos_payments`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `order` (`order_code`);

--
-- Chỉ mục cho bảng `rpos_products`
--
ALTER TABLE `rpos_products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Chỉ mục cho bảng `rpos_staff`
--
ALTER TABLE `rpos_staff`
  ADD PRIMARY KEY (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
