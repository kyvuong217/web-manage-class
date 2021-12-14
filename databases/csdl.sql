-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 24, 2021 lúc 11:34 AM
-- Phiên bản máy phục vụ: 10.4.16-MariaDB
-- Phiên bản PHP: 7.4.12


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nlcn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classroom`
--

CREATE TABLE `classroom` (
  `cid` int(10) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `size` int(50) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `description` varchar(200) NOT NULL,
  `tid` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classroom`
--

INSERT INTO `classroom` (`cid`, `cname`, `size`, `date_start`, `date_end`, `status`, `description`, `tid`) VALUES
(1, 'Anh Văn Căn Bản', 45, '2021-11-26', '2022-01-26', 1, 'Lớp học anh văn cho học sinh mới', 'TC01'),
(2, 'Lập Trình Căn Bản', 50, '2021-10-17', '2021-12-17', 1, 'Lớp học lập trình nhập môn', 'TC02'),
(3, 'Lập Trình .Net', 45, '2021-12-04', '2021-11-17', 1, 'Lớp học về lập trình .Net', 'TC03'),
(4, 'Lập Trình Nodejs', 50, '2021-09-17', '2021-11-17', 1, 'Lớp học về lập trình .Net', 'TC04'),
(5, 'Công Nghệ Web', 50, '2021-08-17', '2021-10-17', 1, 'Lớp học về lập trình Web', 'TC05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(5) NOT NULL,
  `c_content` varchar(200) NOT NULL,
  `c_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `sid` char(10) DEFAULT NULL,
  `nid` int(10) NOT NULL,
  `tid` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `c_content`, `c_time`, `sid`, `nid`, `tid`) VALUES
(1, 'Hi', '2021-11-06 15:06:51', 'B1876541', 1, NULL),
(2, 'Hello', '2021-11-07 01:32:01', 'B1876542', 2, NULL),
(3, 'Hi', '2021-11-06 15:06:51', 'B1876543', 3, NULL),
(4, 'Hello', '2021-11-07 01:32:01', 'B1876544', 4, NULL),
(5, 'Hi', '2021-11-06 15:06:51', 'B1876545', 5, NULL),
(6, 'Hello em', '2021-11-07 02:53:33', NULL, 1, 'TC01'),
(7, 'Hello em', '2021-11-07 02:54:01', NULL, 2, 'TC02'),
(8, 'Hello em', '2021-11-07 02:53:33', NULL, 3, 'TC03'),
(9, 'Hello em', '2021-11-07 02:54:01', NULL, 4, 'TC04'),
(10, 'Hello em', '2021-11-07 02:53:33', NULL, 5, 'TC05');
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `nid` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `time` date NOT NULL,
  `title` char(30) DEFAULT NULL,
  `tid` char(10) DEFAULT NULL,
  `cid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`nid`, `content`, `time`, `title`, `tid`, `cid`) VALUES
(1, 'Khai giảng lớp anh văn văn bản', '2021-11-26', NULL, 'TC01', 1),
(2, 'Khai giảng lớp lập trình căn bản', '2021-10-17', NULL, 'TC02', 2),
(3, 'Khai giảng lớp lập trình .Net', '2021-12-04', Null, 'TC03', 3),
(4, 'Khai giảng lớp lập trình Nodejs', '2021-09-17', NULL, 'TC04', 4),
(5, 'Khai giảng lớp lập trình Web', '2021-08-17', '#ThayAn', 'TC05', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `semester`
--

CREATE TABLE `semester` (
  `sm_id` int(2) NOT NULL,
  `sm_name` varchar(30) NOT NULL,
  `sm_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `semester`
--

INSERT INTO `semester` (`sm_id`, `sm_name`, `sm_year`) VALUES
(1, 'hk1', 2021),
(2, 'hk2', 2021),
(3, 'hk3', 2021);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statistics`
--

CREATE TABLE `statistics` (
  `id` int(10) NOT NULL,
  `sid` char(10) NOT NULL,
  `tbtl` float NOT NULL,
  `trainpoint` int(3) NOT NULL,
  `pre_tbhk` float DEFAULT NULL,
  `tbhk` float NOT NULL,
  `sm_id` int(2) NOT NULL,
  `cid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `statistics`
--

INSERT INTO `statistics` (`id`, `sid`, `tbtl`, `trainpoint`, `pre_tbhk`, `tbhk`, `sm_id`, `cid`) VALUES
(1, 'B1876541', 1.9, 60, 3.2, 3.7, 2, 1),
(2, 'B1876542', 100, 100, 100, 100, 2, 2),
(3, 'B1876543', 1.9, 60, 3.2, 3.7, 2, 3),
(4, 'B1876544', 100, 100, 100, 100, 2, 4),
(5, 'B1876545', 5, 85, 2.5, 3.7, 2, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `sid` char(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` char(11) NOT NULL,
  `workplace` varchar(20) NOT NULL,
  `cid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`sid`, `image`, `name`, `dob`, `email`, `password`, `phone`, `workplace`, `cid`) VALUES
('B1876541', '', 'Student 01', '2000-09-17', 'student01@gmail.com', '123456', '0818952539', 'Đại học Cần Thơ', 1),
('B1876542', '', 'Student 02', '2000-07-21', 'student01@gmail.com', '123456', '0818952539', 'Đại học Cần Thơ', 2),
('B1876543', '', 'Student 03', '2000-09-17', 'student01@gmail.com', '123456', '', '', 3),
('B1876544', '', 'Student 04', '2000-07-21', 'student01@gmail.com', '123456', '0818952539', 'Đại học Cần Thơ', 4),
('B1876545', '', 'Student 05', '2000-09-17', 'student01@gmail.com', '123456', '0818952539', 'Đại học Cần Thơ', 5);
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sub_info`
--

CREATE TABLE `sub_info` (
  `pid` int(10) NOT NULL,
  `p_name` varchar(20) DEFAULT NULL,
  `p_job` varchar(20) NOT NULL,
  `p_phone` char(11) NOT NULL,
  `sid` char(10) DEFAULT NULL,
  `p_email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sub_info`
--

INSERT INTO `sub_info` (`pid`, `p_name`, `p_job`, `p_phone`, `sid`, `p_email`) VALUES
(1, 'Parent 01', 'Business', '0818952539', 'B1876541', 'parent01@gmail.com'),
(2, 'Parent 02', 'Business', '0818952539', 'B1876542', 'parent01@gmail.com'),
(3, 'Parent 03', 'Business', '0818952539', 'B1876543', 'parent01@gmail.com'),
(4, 'Parent 04', 'Business', '0818952536', 'B1876544', 'parent01@gmail.com'),
(5, 'Parent 05', 'Business', '0845474783', 'B1876545', 'parent01@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher`
--

CREATE TABLE `teacher` (
  `tid` char(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `phone` char(11) DEFAULT NULL,
  `workplace` varchar(255) NOT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `teacher`
--

INSERT INTO `teacher` (`tid`, `email`, `password`, `name`, `dob`, `phone`, `workplace`, `img`) VALUES
('TC01', 'teacher01@gmail.com', '123456', 'Teacher 01', '2000-09-17', '0818952538', 'Đại học Cần Thơ', 'aa'),
('TC02', 'teacher02@gmail.com', '123456', 'Teacher 02', '2000-07-21', '0818952538', 'Đại học Cần Thơ', 'aa'),
('TC03', 'teacher03@gmail.com', '123456', 'Teacher 03', '2000-09-17', '0818952538', 'Đại học Cần Thơ', 'aa'),
('TC04', 'teacher04@gmail.com', '123456', 'Teacher 04', '2000-07-21', '0818952538', 'Đại học Cần Thơ', 'aa'),
('TC05', 'teacher05@gmail.com', '123456', 'Teacher 05', '2000-09-17', '0818952538', 'Đại học Cần Thơ', 'aa');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_ibfk_2` (`sid`),
  ADD KEY `nid` (`nid`),
  ADD KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`nid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sm_id`);

--
-- Chỉ mục cho bảng `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sm_id` (`sm_id`),
  ADD KEY `statistics_ibfk_1` (`sid`),
  ADD KEY `cid` (`cid`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `cid` (`cid`);

--
-- Chỉ mục cho bảng `sub_info`
--
ALTER TABLE `sub_info`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `sid` (`sid`);

--
-- Chỉ mục cho bảng `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `classroom`
--
ALTER TABLE `classroom`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `nid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT cho bảng `semester`
--
ALTER TABLE `semester`
  MODIFY `sm_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `sub_info`
--
ALTER TABLE `sub_info`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `classroom`
--
ALTER TABLE `classroom`
  ADD CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`nid`) REFERENCES `news` (`nid`),
  ADD CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `classroom` (`cid`),
  ADD CONSTRAINT `news_ibfk_3` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`);

--
-- Các ràng buộc cho bảng `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `statistics_ibfk_2` FOREIGN KEY (`sm_id`) REFERENCES `semester` (`sm_id`),
  ADD CONSTRAINT `statistics_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `classroom` (`cid`);

--
-- Các ràng buộc cho bảng `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `classroom` (`cid`);

--
-- Các ràng buộc cho bảng `sub_info`
--
ALTER TABLE `sub_info`
  ADD CONSTRAINT `sub_info_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
