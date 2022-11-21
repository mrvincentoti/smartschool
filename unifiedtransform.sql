-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2022 at 11:46 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unifiedtransform`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_settings`
--

CREATE TABLE `academic_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'section',
  `marks_submission_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_settings`
--

INSERT INTO `academic_settings` (`id`, `attendance_type`, `marks_submission_status`, `created_at`, `updated_at`) VALUES
(1, 'section', 'on', '2022-02-21 10:40:03', '2022-04-20 13:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_teachers`
--

CREATE TABLE `assigned_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_teachers`
--

INSERT INTO `assigned_teachers` (`id`, `teacher_id`, `semester_id`, `class_id`, `section_id`, `course_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, 2, 1, 1, '2022-04-20 12:49:52', '2022-04-20 12:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `assignment_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignment_file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `section_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `student_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_type`, `class_id`, `semester_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Intro to Anatomy I', 'Core', 2, 1, 1, '2022-04-20 12:36:58', '2022-04-20 12:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `exam_name`, `start_date`, `end_date`, `class_id`, `course_id`, `semester_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'First Semester Exam', '2022-04-20 14:44:00', '2022-05-20 14:46:00', 2, 1, 1, 1, '2022-04-20 12:44:31', '2022-04-20 12:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `exam_rules`
--

CREATE TABLE `exam_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_marks` double(8,2) NOT NULL,
  `pass_marks` double(8,2) NOT NULL,
  `marks_distribution_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_rules`
--

INSERT INTO `exam_rules` (`id`, `total_marks`, `pass_marks`, `marks_distribution_note`, `exam_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 60.00, 45.00, 'Written 70', 1, 1, '2022-04-20 12:45:28', '2022-04-20 12:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_marks`
--

CREATE TABLE `final_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `calculated_marks` double(8,2) NOT NULL DEFAULT 0.00,
  `final_marks` double(8,2) NOT NULL DEFAULT 0.00,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `final_marks`
--

INSERT INTO `final_marks` (`id`, `calculated_marks`, `final_marks`, `note`, `student_id`, `class_id`, `section_id`, `course_id`, `semester_id`, `session_id`, `created_at`, `updated_at`) VALUES
(2, 80.00, 80.00, 'written exams', 4, 2, 2, 1, 1, 1, '2022-04-20 13:20:05', '2022-04-20 13:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `grade_rules`
--

CREATE TABLE `grade_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `point` double(8,2) NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` double(8,2) NOT NULL,
  `end_at` double(8,2) NOT NULL,
  `grading_system_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grade_rules`
--

INSERT INTO `grade_rules` (`id`, `point`, `grade`, `start_at`, `end_at`, `grading_system_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 5.00, 'A+', 90.00, 100.00, 1, 1, '2022-04-20 12:46:52', '2022-04-20 12:46:52'),
(2, 4.00, 'B', 60.00, 80.00, 1, 1, '2022-04-20 12:47:09', '2022-04-20 12:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `grading_systems`
--

CREATE TABLE `grading_systems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grading_systems`
--

INSERT INTO `grading_systems` (`id`, `system_name`, `class_id`, `semester_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'My Grade System', 2, 1, 1, '2022-04-20 12:46:26', '2022-04-20 12:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `marks` double(8,2) NOT NULL DEFAULT 0.00,
  `student_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `exam_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `marks`, `student_id`, `class_id`, `section_id`, `course_id`, `exam_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 80.00, 4, 2, 2, 1, 1, 1, '2022-04-20 13:04:44', '2022-04-20 13:19:20'),
(2, 40.00, 4, 2, 2, 1, 2, 1, '2022-04-20 13:04:44', '2022-04-20 13:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_08_14_063609_create_permission_tables', 1),
(5, '2021_08_29_082638_create_school_sessions_table', 1),
(6, '2021_08_29_082900_create_semesters_table', 1),
(7, '2021_08_29_082956_create_school_classes_table', 1),
(8, '2021_08_29_083021_create_sections_table', 1),
(9, '2021_08_29_083216_create_courses_table', 1),
(10, '2021_08_29_083346_create_academic_settings_table', 1),
(11, '2021_08_29_083429_create_promotions_table', 1),
(12, '2021_08_29_083504_create_exam_rules_table', 1),
(13, '2021_08_29_083523_create_grade_rules_table', 1),
(14, '2021_08_29_083603_create_marks_table', 1),
(15, '2021_08_29_083628_create_exams_table', 1),
(16, '2021_08_29_083730_create_student_parent_infos_table', 1),
(17, '2021_08_29_083742_create_student_academic_infos_table', 1),
(18, '2021_08_29_083934_create_attendances_table', 1),
(19, '2021_08_29_084019_create_notices_table', 1),
(20, '2021_08_29_084030_create_events_table', 1),
(21, '2021_08_29_084041_create_syllabi_table', 1),
(22, '2021_08_29_084056_create_routines_table', 1),
(23, '2021_10_07_134023_create_assigned_teachers_table', 1),
(24, '2021_10_09_061039_create_grading_systems_table', 1),
(25, '2021_10_16_123559_create_final_marks_table', 1),
(26, '2021_11_26_040801_create_assignments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 3),
(7, 'App\\Models\\User', 4),
(8, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 1),
(10, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 2),
(11, 'App\\Models\\User', 3),
(11, 'App\\Models\\User', 4),
(12, 'App\\Models\\User', 1),
(13, 'App\\Models\\User', 1),
(14, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 2),
(15, 'App\\Models\\User', 3),
(15, 'App\\Models\\User', 4),
(16, 'App\\Models\\User', 1),
(17, 'App\\Models\\User', 1),
(18, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 2),
(19, 'App\\Models\\User', 3),
(19, 'App\\Models\\User', 4),
(20, 'App\\Models\\User', 1),
(21, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 3),
(23, 'App\\Models\\User', 1),
(23, 'App\\Models\\User', 2),
(23, 'App\\Models\\User', 3),
(23, 'App\\Models\\User', 4),
(25, 'App\\Models\\User', 1),
(25, 'App\\Models\\User', 3),
(26, 'App\\Models\\User', 1),
(26, 'App\\Models\\User', 3),
(27, 'App\\Models\\User', 1),
(27, 'App\\Models\\User', 3),
(28, 'App\\Models\\User', 1),
(28, 'App\\Models\\User', 3),
(30, 'App\\Models\\User', 1),
(31, 'App\\Models\\User', 1),
(32, 'App\\Models\\User', 1),
(33, 'App\\Models\\User', 1),
(34, 'App\\Models\\User', 1),
(35, 'App\\Models\\User', 1),
(36, 'App\\Models\\User', 1),
(37, 'App\\Models\\User', 1),
(38, 'App\\Models\\User', 1),
(38, 'App\\Models\\User', 3),
(39, 'App\\Models\\User', 1),
(39, 'App\\Models\\User', 2),
(39, 'App\\Models\\User', 3),
(39, 'App\\Models\\User', 4),
(40, 'App\\Models\\User', 1),
(41, 'App\\Models\\User', 2),
(41, 'App\\Models\\User', 4),
(42, 'App\\Models\\User', 3),
(43, 'App\\Models\\User', 1),
(43, 'App\\Models\\User', 2),
(43, 'App\\Models\\User', 3),
(43, 'App\\Models\\User', 4),
(44, 'App\\Models\\User', 3),
(45, 'App\\Models\\User', 1),
(45, 'App\\Models\\User', 2),
(45, 'App\\Models\\User', 4),
(46, 'App\\Models\\User', 1),
(47, 'App\\Models\\User', 1),
(49, 'App\\Models\\User', 1),
(50, 'App\\Models\\User', 1),
(51, 'App\\Models\\User', 1),
(52, 'App\\Models\\User', 1),
(53, 'App\\Models\\User', 1),
(54, 'App\\Models\\User', 1),
(55, 'App\\Models\\User', 1),
(56, 'App\\Models\\User', 1),
(57, 'App\\Models\\User', 1),
(58, 'App\\Models\\User', 1),
(59, 'App\\Models\\User', 1),
(60, 'App\\Models\\User', 1),
(61, 'App\\Models\\User', 1),
(62, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create users', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(2, 'view users', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(3, 'edit users', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(4, 'delete users', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(5, 'promote students', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(6, 'create notices', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(7, 'view notices', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(8, 'edit notices', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(9, 'delete notices', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(10, 'create events', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(11, 'view events', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(12, 'edit events', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(13, 'delete events', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(14, 'create syllabi', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(15, 'view syllabi', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(16, 'edit syllabi', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(17, 'delete syllabi', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(18, 'create routines', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(19, 'view routines', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(20, 'edit routines', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(21, 'delete routines', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(22, 'create exams', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(23, 'view exams', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(24, 'delete exams', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(25, 'create exams rule', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(26, 'view exams rule', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(27, 'edit exams rule', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(28, 'delete exams rule', 'web', '2022-02-21 10:40:03', '2022-02-21 10:40:03'),
(29, 'view exams history', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(30, 'create grading systems', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(31, 'view grading systems', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(32, 'edit grading systems', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(33, 'delete grading systems', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(34, 'create grading systems rule', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(35, 'view grading systems rule', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(36, 'edit grading systems rule', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(37, 'delete grading systems rule', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(38, 'take attendances', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(39, 'view attendances', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(40, 'update attendances type', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(41, 'submit assignments', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(42, 'create assignments', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(43, 'view assignments', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(44, 'save marks', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(45, 'view marks', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(46, 'create school sessions', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(47, 'create semesters', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(48, 'view semesters', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(49, 'edit semesters', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(50, 'assign teachers', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(51, 'create courses', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(52, 'view courses', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(53, 'edit courses', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(54, 'view academic settings', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(55, 'update marks submission window', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(56, 'update browse by session', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(57, 'create classes', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(58, 'view classes', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(59, 'edit classes', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(60, 'create sections', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(61, 'view sections', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(62, 'edit sections', 'web', '2022-02-21 10:40:04', '2022-02-21 10:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `id_card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `student_id`, `class_id`, `section_id`, `session_id`, `id_card_number`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 1, '2022-1-1-1', '2022-04-20 07:54:55', '2022-04-20 07:54:55'),
(2, 4, 2, 2, 1, '2022-1-1-1', '2022-04-20 13:02:52', '2022-04-20 13:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routines`
--

CREATE TABLE `routines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weekday` int(11) NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_classes`
--

CREATE TABLE `school_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_classes`
--

INSERT INTO `school_classes` (`id`, `class_name`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Computer Science', 1, '2022-04-20 07:49:51', '2022-04-20 07:49:51'),
(2, 'Medicine & Surgery', 1, '2022-04-20 12:36:41', '2022-04-20 12:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `school_sessions`
--

CREATE TABLE `school_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_sessions`
--

INSERT INTO `school_sessions` (`id`, `session_name`, `created_at`, `updated_at`) VALUES
(1, '2021-2022', '2022-04-20 07:49:16', '2022-04-20 07:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `room_no`, `class_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Section B', 'Section A', 1, 1, '2022-04-20 07:52:10', '2022-04-20 07:52:10'),
(2, 'Section A', '101', 2, 1, '2022-04-20 12:49:33', '2022-04-20 12:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semester_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `semester_name`, `start_date`, `end_date`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'First Semester', '2022-04-20', '2022-06-16', 1, '2022-04-20 07:50:21', '2022-04-20 07:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `student_academic_infos`
--

CREATE TABLE `student_academic_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `board_reg_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_academic_infos`
--

INSERT INTO `student_academic_infos` (`id`, `board_reg_no`, `student_id`, `created_at`, `updated_at`) VALUES
(1, '1234567890', 2, '2022-04-20 07:54:55', '2022-04-20 07:54:55'),
(2, '12345678900', 4, '2022-04-20 13:02:52', '2022-04-20 13:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `student_parent_infos`
--

CREATE TABLE `student_parent_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_parent_infos`
--

INSERT INTO `student_parent_infos` (`id`, `student_id`, `father_name`, `father_phone`, `mother_name`, `mother_phone`, `parent_address`, `created_at`, `updated_at`) VALUES
(1, 2, 'Vincent', '90989878987', 'Amen', '08098767656', 'Testing', '2022-04-20 07:54:55', '2022-04-20 07:54:55'),
(2, 4, 'Vincent', '90989878987', 'Amen', '08098767656', 'Testing', '2022-04-20 13:02:52', '2022-04-20 13:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `syllabi`
--

CREATE TABLE `syllabi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `syllabus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `syllabus_file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `syllabi`
--

INSERT INTO `syllabi` (`id`, `syllabus_name`, `syllabus_file_path`, `class_id`, `course_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 'Testing', 'syllabi/zhnxNZv1tZ67AhxeupZgGn9EQvclBeJz92Ec2c7B.pdf', 2, 1, 1, '2022-04-20 12:48:12', '2022-04-20 12:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `gender`, `nationality`, `phone`, `address`, `address2`, `city`, `zip`, `photo`, `birthday`, `blood_type`, `religion`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hasib', 'Mahmud', 'admin@ut.com', 'Male', 'Bangladeshi', 'Ex: 325 43657 7554', '568, Dhaka', 'Same', 'Dhaka', '32545', NULL, NULL, NULL, NULL, 'admin', '2022-02-21 10:40:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xNrfwhpJXLF9ZU7j2XMCHUt4qEU6lengwSVwt4rowK8Zzc2nxd3YO0RW4cOU', '2022-02-21 10:40:04', '2022-02-21 10:40:04'),
(2, 'Vincent', 'Oti', 'vinny@smartschool.com', 'Male', 'Nigeria', '09098787675', 'Testing street', 'test', 'Abuja', '90000234', '/photos/1650444895SN2KNx9zVs.png', '2022-04-21', 'A+', 'Islam', 'student', NULL, '$2y$10$pshcvexjmx77HpS83zEA9uiQkEqShcCoT9KdadxEeS5d4BXDP.7ty', NULL, '2022-04-20 07:54:55', '2022-04-20 07:54:55'),
(3, 'Sadeek', 'Sadeek', 'sa@demo.com', 'Male', 'Nigeria', '08035401606', '3 Gwani Street, Wuse Zone 4, FCT. Abuja', 'Testing', 'Abuja', '90000123', '/photos/16504621122udLHFNgYo.png', NULL, NULL, NULL, 'teacher', NULL, '$2y$10$hoIEA6oHA3CzmCzCQqSNH.z4GJaTT33/TivCUp/eAB8wuSM/rAENu', NULL, '2022-04-20 12:41:52', '2022-04-20 12:41:52'),
(4, 'Vincent', 'Oti', 'admin1@ut.com', 'Male', 'Nigeria', '09098787675', 'Testing street', 'test', 'Abuja', '90000234', '/photos/1650463372PRBjXI4E98.png', '2022-04-21', 'A+', 'Islam', 'student', NULL, '$2y$10$2DLyKoO9sjrP87atIU9DaesRwhRlBUG8LYrmHD/oN32Hg5F3k8NYK', NULL, '2022-04-20 13:02:52', '2022-04-20 13:02:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_settings`
--
ALTER TABLE `academic_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_teachers`
--
ALTER TABLE `assigned_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_rules`
--
ALTER TABLE `exam_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `final_marks`
--
ALTER TABLE `final_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade_rules`
--
ALTER TABLE `grade_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grading_systems`
--
ALTER TABLE `grading_systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `routines`
--
ALTER TABLE `routines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_classes`
--
ALTER TABLE `school_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_sessions`
--
ALTER TABLE `school_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_academic_infos`
--
ALTER TABLE `student_academic_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_parent_infos`
--
ALTER TABLE `student_parent_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syllabi`
--
ALTER TABLE `syllabi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_settings`
--
ALTER TABLE `academic_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assigned_teachers`
--
ALTER TABLE `assigned_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_rules`
--
ALTER TABLE `exam_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `final_marks`
--
ALTER TABLE `final_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grade_rules`
--
ALTER TABLE `grade_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grading_systems`
--
ALTER TABLE `grading_systems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routines`
--
ALTER TABLE `routines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_classes`
--
ALTER TABLE `school_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `school_sessions`
--
ALTER TABLE `school_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_academic_infos`
--
ALTER TABLE `student_academic_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_parent_infos`
--
ALTER TABLE `student_parent_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `syllabi`
--
ALTER TABLE `syllabi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
