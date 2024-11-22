CREATE DATABASE 'erponetest';
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE TABLE `admins` (
`id` int(10) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`phone` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`dob` date DEFAULT NULL,
`doj` date DEFAULT NULL,
`role_id` int(11) NOT NULL,
`password` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`createdBy` int(11) NOT NULL DEFAULT 0,
`status` tinyint(1) NOT NULL DEFAULT 1,
`remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `branches` (
`id` bigint(20) UNSIGNED NOT NULL,
`company_id` int(11) DEFAULT NULL,
`is_active` tinyint(1) DEFAULT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_type_id` int(11) DEFAULT NULL,
`address1` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`address2` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`pin` int(11) DEFAULT NULL,
`geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`email_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`contact_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`mobile_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`upi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`ifsc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
`state_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `branch_types` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `categories` (
`id` bigint(20) UNSIGNED NOT NULL,
`category` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `companies` (
`id` bigint(20) UNSIGNED NOT NULL,
`vendorid` int(11) NOT NULL,
`companycode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`companylogo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`companyname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`companytype` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`industry_types_id` int(11) NOT NULL,
`companyemail` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`companyphone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`companypancard` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gstno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`pincode` int(11) DEFAULT NULL,
`currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`web_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`start_date` date DEFAULT NULL,
`expired_date` date DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`register_at` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
`address1` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`address2` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `countries` (
`id` bigint(20) UNSIGNED NOT NULL,
`country_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`country_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `credit_notes_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`creditnoteid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`returnId` int(11) NOT NULL DEFAULT 0,
`amount_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`credit_amount` double(8,2) NOT NULL DEFAULT 0.00,
`invoice_Id` int(11) NOT NULL DEFAULT 0,
`invoice_amount` double NOT NULL DEFAULT 0,
`total_credit_amount` double(8,2) NOT NULL DEFAULT 0.00,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`tally_processing_flag` int(11) NOT NULL DEFAULT 0,
`tally_created_by` int(11) NOT NULL DEFAULT 0,
`tally_created_at` timestamp NULL DEFAULT NULL,
`credit_method` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`debit_amount` double(15,2) NOT NULL DEFAULT 0.00,
`debit_flag` int(11) NOT NULL DEFAULT 0,
`return_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cash or invoice ',
`tally_credit_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `currencies` (
`id` bigint(20) UNSIGNED NOT NULL,
`currency_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`currency_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `dayattendance_images` (
`id` bigint(20) UNSIGNED NOT NULL,
`dayattendance_id` int(11) NOT NULL DEFAULT 0,
`image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`punch` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `day_attendances` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`attence` timestamp NULL DEFAULT NULL,
`punch` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`createAPI` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`time_taken` time NOT NULL DEFAULT '00:00:00',
`kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`reference` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`punch_active` int(11) NOT NULL DEFAULT 0,
`attence_status` int(11) NOT NULL DEFAULT 0,
`logout_attence` timestamp NULL DEFAULT NULL,
`logout_punch` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`logout_latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`logout_longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`fcm_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`login_route_id` int(11) NOT NULL DEFAULT 0,
`logout_route_id` int(11) NOT NULL DEFAULT 0,
`travel_mode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`travel_mode_id` int(11) NOT NULL DEFAULT 0,
`start_odometer_reading` double(15,2) NOT NULL DEFAULT 0.00,
`end_odometer_reading` double(15,2) NOT NULL DEFAULT 0.00,
`odometer_kilometer` double(15,2) NOT NULL DEFAULT 0.00,
`travel_kilometer` double(15,2) NOT NULL DEFAULT 0.00,
`manual_kilometer` double(15,2) NOT NULL DEFAULT 0.00,
`manual_kilometer_updated_by` int(11) NOT NULL DEFAULT 0,
`manual_kilometer_updated_at` timestamp NULL DEFAULT NULL,
`public_transport_amount` double(15,2) NOT NULL DEFAULT 0.00,
`public_transport_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`day_allowance` double(15,2) NOT NULL DEFAULT 0.00,
`travel_allowance` double(15,2) NOT NULL DEFAULT 0.00,
`total_travel_allowance` double(15,2) NOT NULL DEFAULT 0.00,
`total_allowance` double(15,2) NOT NULL DEFAULT 0.00,
`user_day_report_id` int(11) NOT NULL DEFAULT 0,
`other_expense` double(15,2) NOT NULL DEFAULT 0.00,
`total_odometer_allowance` double(15,2) NOT NULL DEFAULT 0.00,
`distance` double(15,2) NOT NULL DEFAULT 0.00,
`is_accurate` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `districts` (
`id` bigint(20) UNSIGNED NOT NULL,
`state_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`district_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `domains` (
`id` int(10) UNSIGNED NOT NULL,
`domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`tenant_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `estimate_purchaseorders` (
`id` bigint(20) UNSIGNED NOT NULL,
`po_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`logo_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_gst_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gross_total_amount` double(15,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`gst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra_amount` double(15,2) NOT NULL DEFAULT 0.00,
`freight_amount` double(15,2) NOT NULL DEFAULT 0.00,
`packaging_amount` double(15,2) NOT NULL DEFAULT 0.00,
`packaging_gst` double(15,2) NOT NULL DEFAULT 0.00,
`payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_paid_amount` double(15,2) NOT NULL DEFAULT 0.00,
`approval_by` int(11) NOT NULL DEFAULT 0,
`is_approved` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_at` timestamp NULL DEFAULT NULL,
`soconvert_by` int(11) NOT NULL DEFAULT 0,
`soconvert_at` timestamp NULL DEFAULT NULL,
`is_soconvert` int(11) NOT NULL DEFAULT 0,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`orderdate` timestamp NULL DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1-retailer,2-m&d',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`sgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`igst_amount` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `estimate_purchaseorder_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`po_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`product_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`sku_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`hsn_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`preferred_product` tinyint(1) NOT NULL DEFAULT 0,
`brand` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`minimum_reorder_quantity` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`product_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`inventory_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`units_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`category_id` int(11) NOT NULL,
`category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`sub_category_id` int(11) NOT NULL,
`sub_category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`cost_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cost_price` double(15,2) NOT NULL DEFAULT 0.00,
`discount` double(15,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`gst` double(15,2) NOT NULL DEFAULT 0.00,
`gst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_gst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cess_extra_price` double(15,2) NOT NULL DEFAULT 0.00,
`tax_amt` double(15,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(15,2) NOT NULL DEFAULT 0.00,
`sales_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sales_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_amt` double(15,2) NOT NULL DEFAULT 0.00,
`value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`quantity` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`salesType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`returnId` int(11) NOT NULL DEFAULT 0,
`return_details_id` int(11) NOT NULL DEFAULT 0,
`retailer_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount_type` int(11) NOT NULL DEFAULT 1,
`onboard_discount_type` int(11) NOT NULL DEFAULT 0,
`onboard_discount` double(15,2) NOT NULL DEFAULT 0.00,
`onboard_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`product_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`onboard_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_igst_price` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `estimate_purchaseorder_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`pId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderdate` date DEFAULT NULL,
`invoiceno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`reference` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`orderby` int(11) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0 COMMENT '1-pending,2-approval,3-reject,4-branch assigned,5-user assigned,6-dispatch,7-payment,8-cancel,9-invoice,10-delivery,11-return',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `estimate_salesorders` (
`id` bigint(20) UNSIGNED NOT NULL,
`so_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_id` int(11) NOT NULL,
`retailer_company` text COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_gstno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_pincode` int(11) NOT NULL,
`retailer_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_upi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_ifsc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_id` int(11) NOT NULL,
`vendor_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`logo_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_gst_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gross_total_amount` double(15,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`gst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra_amount` double(15,2) NOT NULL DEFAULT 0.00,
`payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_paid_amount` double(15,2) NOT NULL DEFAULT 0.00,
`is_approved` int(11) NOT NULL DEFAULT 0,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_at` timestamp NULL DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`orderdate` timestamp NULL DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1-retailer,2-m&d',
`ordertakenBy` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RETAILER',
`created_by` int(11) NOT NULL DEFAULT 0,
`route_id` int(11) NOT NULL DEFAULT 0,
`retailer_onboard` tinyint(1) NOT NULL DEFAULT 1,
`soconvert_by` int(11) NOT NULL DEFAULT 0,
`soconvert_at` timestamp NULL DEFAULT NULL,
`is_soconvert` int(11) NOT NULL DEFAULT 0,
`ordermail_flag` int(11) NOT NULL DEFAULT 1,
`branch` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`retailer_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`taxable_value` double(15,2) NOT NULL DEFAULT 0.00,
`sgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`igst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`vendor_state_id` int(11) NOT NULL DEFAULT 0,
`retailer_state_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `estimate_salesorder_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`so_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`product_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`sku_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`hsn_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`preferred_product` tinyint(1) NOT NULL DEFAULT 0,
`brand` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`minimum_reorder_quantity` int(11) DEFAULT NULL,
`product_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`inventory_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`units_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`category_id` int(11) NOT NULL,
`category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`sub_category_id` int(11) NOT NULL,
`sub_category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`cost_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cost_price` double(15,2) NOT NULL DEFAULT 0.00,
`discount` double(15,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`gst` double(15,2) NOT NULL DEFAULT 0.00,
`gst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_gst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cess_extra_price` double(15,2) NOT NULL DEFAULT 0.00,
`tax_amt` double(15,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(15,2) NOT NULL DEFAULT 0.00,
`sales_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sales_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_amt` double(15,2) NOT NULL DEFAULT 0.00,
`value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`quantity` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` tinyint(1) NOT NULL DEFAULT 0,
`salesType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`returnId` int(11) NOT NULL DEFAULT 0,
`return_details_id` int(11) NOT NULL DEFAULT 0,
`retailer_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount_type` int(11) NOT NULL DEFAULT 1,
`onboard_discount_type` int(11) NOT NULL DEFAULT 0,
`onboard_discount` double(15,2) NOT NULL DEFAULT 0.00,
`onboard_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`product_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`unit_of_measurement` double(15,2) NOT NULL DEFAULT 1.00,
`varient_values` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`onboard_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`single_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`taxable_value` double(15,2) NOT NULL DEFAULT 0.00,
`product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`total_retailer_discount_amount` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `estimate_salesorder_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`sId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`invoiceno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`orderdate` date DEFAULT NULL,
`orderby` int(11) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0 COMMENT '1-pending,2-approval,3-reject,4-assigned,5-dispatched,6-return,7-payment',
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `excelretailers` (
`id` bigint(20) UNSIGNED NOT NULL,
`excelid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`gstno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`industry_type` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`address1` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`address2` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`pincode` int(11) NOT NULL,
`branch` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`route` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`upi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`ifsc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tenant_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` int(11) NOT NULL DEFAULT 0,
`error_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`edit_retailer_id` int(11) NOT NULL DEFAULT 0,
`edit_row` int(11) NOT NULL DEFAULT 0,
`referrence` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`category` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`subcategory` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`credit_days` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`payment_mode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `excel_products` (
`id` bigint(20) UNSIGNED NOT NULL,
`productid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`excelid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`product_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`sku_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`hsn_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`preferred_product` tinyint(1) NOT NULL DEFAULT 0,
`brand` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`inventory_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`categorie` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`subcategorie` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`unit` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`value` double(8,2) NOT NULL DEFAULT 0.00,
`cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`discount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst` double(8,2) NOT NULL DEFAULT 0.00,
`gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`minimum_reorder_quantity` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`product_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` tinyint(1) NOT NULL DEFAULT 1,
`error_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`unit_of_measurement` double(15,2) NOT NULL DEFAULT 1.00,
`varient_values` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `failed_jobs` (
`id` bigint(20) UNSIGNED NOT NULL,
`uuid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
`queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
`payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
`exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
`failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `industry_types` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `inventor_types` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `invoice_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`so_id` int(11) NOT NULL,
`invoiceno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`invoice_date` date DEFAULT NULL,
`dispatch_date` timestamp NULL DEFAULT NULL,
`creditamount` double(8,2) NOT NULL DEFAULT 0.00,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`due_date` date DEFAULT NULL,
`deliverydate` date DEFAULT NULL,
`freight_amount` double(8,2) NOT NULL DEFAULT 0.00,
`packaging_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gross_total_amount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst_amount` double(8,2) NOT NULL DEFAULT 0.00,
`packing_gst_amount` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_amount` double(8,2) NOT NULL DEFAULT 0.00,
`payable_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_payable_amount` double(8,2) NOT NULL DEFAULT 0.00,
`branch` int(11) NOT NULL DEFAULT 0,
`branch_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_officetype` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_conductnumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_upi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_ifsc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`user` int(11) NOT NULL DEFAULT 0,
`executive_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`executive_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`executive_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`executive_user_role` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`payment_terms` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`irn_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`eway_bill` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_at` timestamp NULL DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`total_paid_amount` double(8,2) NOT NULL DEFAULT 0.00,
`paid_flag` int(11) NOT NULL DEFAULT 0,
`email_flag` int(11) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 1,
`client_id` int(11) NOT NULL DEFAULT 0,
`clientType` int(11) NOT NULL DEFAULT 1 COMMENT '1-retailer,2-m&d',
`reference` varchar(299) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`invoice_link` varchar(299) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`sales_deliverydate` timestamp NULL DEFAULT NULL,
`invoice_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_sales_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`voucher_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`voucher_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`voucher_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`ledger` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`ledger_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`narration` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_processing_flag` int(11) NOT NULL DEFAULT 0,
`tally_created_by` int(11) NOT NULL DEFAULT 0,
`tally_created_at` timestamp NULL DEFAULT NULL,
`tally_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_route_id` int(11) NOT NULL DEFAULT 1,
`sgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`igst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`taxable_value` double(15,2) NOT NULL DEFAULT 0.00,
`vehicle_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`other_details` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`route_ordertaken_by` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `invoice_product_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`so_id` int(11) NOT NULL,
`so_details_id` int(11) NOT NULL,
`inv_id` int(11) NOT NULL,
`cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`quantity` int(11) NOT NULL,
`total_cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`discount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst` double(8,2) NOT NULL DEFAULT 0.00,
`gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 1,
`return_date` timestamp NULL DEFAULT NULL,
`return_by` int(11) NOT NULL DEFAULT 0,
`return_at` int(11) NOT NULL DEFAULT 0,
`return_type` int(11) NOT NULL DEFAULT 0,
`return_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`retailer_discount` double(8,2) NOT NULL DEFAULT 0.00,
`retailer_discount_type` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`onboard_discount_type` int(11) NOT NULL DEFAULT 0,
`onboard_discount` double(8,2) NOT NULL DEFAULT 0.00,
`onboard_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`totel_return_quantity` int(11) NOT NULL DEFAULT 0,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`onboard_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`single_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_route_id` int(11) NOT NULL DEFAULT 1,
`sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`total_retailer_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`taxable_value` double(15,2) NOT NULL DEFAULT 0.00,
`product_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `invoice_product_returns` (
`id` bigint(20) UNSIGNED NOT NULL,
`so_id` int(11) NOT NULL,
`so_details_id` int(11) NOT NULL,
`inv_id` int(11) NOT NULL,
`inv_product_id` int(11) NOT NULL,
`cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`quantity` int(11) NOT NULL,
`total_cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`discount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst` double(8,2) NOT NULL DEFAULT 0.00,
`gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0,
`reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`return_at` timestamp NULL DEFAULT NULL,
`return_by` int(11) NOT NULL DEFAULT 0,
`return_type` int(11) NOT NULL DEFAULT 0 COMMENT 'invoice or invoice product list',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `invoice_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`inv_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`status` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `jobs` (
`id` bigint(20) UNSIGNED NOT NULL,
`queue` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
`attempts` tinyint(3) UNSIGNED NOT NULL,
`reserved_at` int(10) UNSIGNED DEFAULT NULL,
`available_at` int(10) UNSIGNED NOT NULL,
`created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `main_permissions` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `migrations` (
`id` int(10) UNSIGNED NOT NULL,
`migration` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `notification_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`notification_type` varchar(270) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`title` varchar(270) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`response` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status_type` varchar(270) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`targeturl` varchar(270) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `oauth_access_tokens` (
`id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
`user_id` bigint(20) UNSIGNED DEFAULT NULL,
`client_id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`revoked` tinyint(1) NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `oauth_auth_codes` (
`id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
`user_id` bigint(20) UNSIGNED NOT NULL,
`client_id` bigint(20) UNSIGNED NOT NULL,
`scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`revoked` tinyint(1) NOT NULL,
`expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `oauth_clients` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` bigint(20) UNSIGNED DEFAULT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`provider` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
`personal_access_client` tinyint(1) NOT NULL,
`password_client` tinyint(1) NOT NULL,
`revoked` tinyint(1) NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `oauth_personal_access_clients` (
`id` bigint(20) UNSIGNED NOT NULL,
`client_id` bigint(20) UNSIGNED NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `oauth_refresh_tokens` (
`id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
`access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
`revoked` tinyint(1) NOT NULL,
`expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `office_types` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `old_track_attendances` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`attence` timestamp NULL DEFAULT NULL,
`punch` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
`task_id` int(11) NOT NULL DEFAULT 0,
`kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`createAPI` timestamp NULL DEFAULT NULL,
`time_taken` time NOT NULL DEFAULT '00:00:00',
`reference` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `order_takens` (
`id` bigint(20) UNSIGNED NOT NULL,
`order_takens_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `otp_verfications` (
`id` bigint(20) UNSIGNED NOT NULL,
`mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`user_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`otp` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`details` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` int(11) NOT NULL,
`expiry_at` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`otp_sent_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-for sms 2 for voice call 3 for email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `password_resets` (
`email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`token` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `payments` (
`id` bigint(20) UNSIGNED NOT NULL,
`payment_receiptnumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`payment_receipt` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`receipt_date` date DEFAULT NULL,
`payment_method` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`dd_cheque_account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`dd_cheque_account_date` date DEFAULT NULL,
`dd_cheque_account_issue_date` date DEFAULT NULL,
`payment_comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`payment_amount` double(8,2) DEFAULT NULL,
`ifsc_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`paid_date` date DEFAULT NULL,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`total_invoice_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_current_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_already_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_balance_due` double(8,2) NOT NULL DEFAULT 0.00,
`office_id` int(11) NOT NULL DEFAULT 0,
`office_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_gst_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_webaddress` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_client_id` int(11) NOT NULL DEFAULT 0,
`bill_companyname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_gst_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bill_webaddress` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`user` int(11) NOT NULL DEFAULT 0,
`executive_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`executive_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`executive_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`executive_user_role` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch` int(11) NOT NULL DEFAULT 0,
`branch_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_officetype` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_conductnumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_upi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`branch_ifsc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) DEFAULT NULL,
`cancelType` int(11) NOT NULL DEFAULT 0 COMMENT 'Cancel or return',
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`clientType` int(11) NOT NULL DEFAULT 1 COMMENT '1-retailer,2-m&d',
`created_by` int(11) NOT NULL DEFAULT 0,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`is_approved` int(11) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0 COMMENT '1-approved,2-cancelled,0-unapproved,3-Rejected',
`paymentType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`reference` varchar(299) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`payment_link` varchar(299) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`paid_at` timestamp NULL DEFAULT NULL,
`paid_by` int(11) NOT NULL DEFAULT 0,
`tally_processing_flag` int(11) NOT NULL DEFAULT 0,
`tally_created_by` int(11) NOT NULL DEFAULT 0,
`tally_created_at` timestamp NULL DEFAULT NULL,
`voucher_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`voucher_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`voucher_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`dr_ledger_group` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`dr_ledger` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`dr_ledger_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cr_ledger_group` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cr_ledger` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cr_ledger_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`narration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_receipt_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`credit_amount` double(15,2) NOT NULL DEFAULT 0.00,
`creditnote_id` int(11) NOT NULL DEFAULT 0,
`creditnoteid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_route_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `payment_datails` (
`id` bigint(20) UNSIGNED NOT NULL,
`payment_id` int(11) NOT NULL DEFAULT 0,
`invoice_id` int(11) NOT NULL DEFAULT 0,
`invoice_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`invoice_date` date DEFAULT NULL,
`payment_due_date` date DEFAULT NULL,
`clientType` int(11) NOT NULL DEFAULT 1 COMMENT '1-retailer,2-m&d',
`invoice_amount` double(8,2) NOT NULL DEFAULT 0.00,
`current_paid_amount` double(8,2) NOT NULL DEFAULT 0.00,
`already_paid_amount` double(8,2) NOT NULL DEFAULT 0.00,
`balance_due` double(8,2) NOT NULL DEFAULT 0.00,
`total_paid_amount` double(8,2) NOT NULL DEFAULT 0.00,
`paid_date` date DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) DEFAULT NULL,
`cancelType` int(11) NOT NULL DEFAULT 0 COMMENT 'Cancel or return',
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` int(11) NOT NULL DEFAULT 0 COMMENT '1-active,2-cancel,0-unactive,3-return',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`payment_method` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_receipt_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_processing_flag` int(11) NOT NULL DEFAULT 0,
`tally_created_by` int(11) NOT NULL DEFAULT 0,
`tally_created_at` timestamp NULL DEFAULT NULL,
`tally_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`credit_amount` double(15,2) NOT NULL DEFAULT 0.00,
`creditnote_id` int(11) NOT NULL DEFAULT 0,
`creditnoteid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `payment_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`payment_id` int(11) NOT NULL DEFAULT 0,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `permissions` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`display_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`main_id` int(11) NOT NULL DEFAULT 0,
`sub_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `permission_role` (
`permission_id` bigint(20) UNSIGNED NOT NULL,
`role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `products` (
`id` bigint(20) UNSIGNED NOT NULL,
`product_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
`productid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`sku_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`hsn_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`preferred_product` tinyint(1) NOT NULL DEFAULT 0,
`brand` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`inventory_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`listed_product` tinyint(1) NOT NULL,
`categorie_id` int(11) NOT NULL,
`subcategorie_id` int(11) NOT NULL,
`unit` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`value` double(8,2) NOT NULL DEFAULT 0.00,
`cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`discount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst` double(8,2) NOT NULL DEFAULT 0.00,
`gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`minimum_reorder_quantity` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`onboard` int(11) NOT NULL DEFAULT 0 COMMENT '0 for myproduct,1 for onboard,2 for nonboard',
`product_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 1,
`created_by` int(11) NOT NULL DEFAULT 0,
`deleted_by` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
`tally_item_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_item_closing_stock` int(11) NOT NULL DEFAULT 0,
`product_stock` int(11) NOT NULL DEFAULT 0,
`unit_of_measurement` double(15,2) NOT NULL DEFAULT 1.00,
`varient_values` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `product_returns` (
`id` bigint(20) UNSIGNED NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`returnid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`returndate` timestamp NULL DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gross_total_amount` double(15,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`gst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra_amount` double(15,2) NOT NULL DEFAULT 0.00,
`payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_paid_amount` double(15,2) NOT NULL DEFAULT 0.00,
`returnType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Replace and return',
`vendor_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0,
`paid_flag` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `product_return_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`returnid` int(11) NOT NULL,
`soid` int(11) NOT NULL,
`sodetailsid` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`quantity` int(11) NOT NULL,
`cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`discount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst` double(8,2) NOT NULL DEFAULT 0.00,
`gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_amt` double(8,2) NOT NULL DEFAULT 0.00,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0,
`retailer_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`retailer_discount` double(8,2) NOT NULL DEFAULT 0.00,
`retailer_discount_type` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`onboard_discount_type` int(11) NOT NULL DEFAULT 0,
`onboard_discount` double(8,2) NOT NULL DEFAULT 0.00,
`onboard_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`onboard_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_route_id` int(11) NOT NULL DEFAULT 1,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`taxable_value` double(15,2) NOT NULL DEFAULT 0.00,
`product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`total_retailer_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`single_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`approval_by` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `product_stocks` (
`id` bigint(20) UNSIGNED NOT NULL,
`product_id` int(11) NOT NULL DEFAULT 0,
`in_stock` int(11) NOT NULL DEFAULT 0,
`order_stock` int(11) NOT NULL DEFAULT 0,
`closing_stock` int(11) NOT NULL DEFAULT 0,
`order_id` int(11) NOT NULL DEFAULT 0,
`sales_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`stock_active` int(11) NOT NULL DEFAULT 1,
`product_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `promotion_banner_images` (
`id` bigint(20) UNSIGNED NOT NULL,
`promotion_id` int(11) NOT NULL DEFAULT 0,
`image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status_active` int(11) NOT NULL DEFAULT 0,
`updated_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`image_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `promotion_client_histories` (
`id` bigint(20) UNSIGNED NOT NULL,
`promotion_client_list_id` int(11) NOT NULL DEFAULT 0,
`promotion_id` int(11) NOT NULL DEFAULT 0,
`client_id` int(11) NOT NULL DEFAULT 0,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `promotion_client_lists` (
`id` bigint(20) UNSIGNED NOT NULL,
`encrypt_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`promotion_id` int(11) NOT NULL DEFAULT 0,
`client_id` int(11) NOT NULL DEFAULT 0,
`status_active` int(11) NOT NULL DEFAULT 0,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`updated_by` int(11) NOT NULL DEFAULT 0,
`updated_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`history_count` int(11) NOT NULL DEFAULT 0,
`is_promotion_completed` int(11) NOT NULL DEFAULT 0 COMMENT '1-for completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `promotion_histories` (
`id` bigint(20) UNSIGNED NOT NULL,
`promotion_id` int(11) NOT NULL DEFAULT 0,
`client_id` int(11) NOT NULL DEFAULT 0,
`promotion_client_list_id` int(11) NOT NULL DEFAULT 0,
`image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`comments_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-clinet,2-user',
`created_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-imageupload,2-comments',
`created_by` int(11) NOT NULL DEFAULT 0,
`client_show` int(11) NOT NULL DEFAULT 0 COMMENT '1-show ',
`created_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status_active` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `promotion_lists` (
`id` bigint(20) UNSIGNED NOT NULL,
`promotion_encrypt_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`promotionid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`promotion_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`promotion_title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`updated_by` int(11) NOT NULL DEFAULT 0,
`updated_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status_active` int(11) NOT NULL DEFAULT 0,
`promotion_completed` int(11) NOT NULL DEFAULT 0 COMMENT '1-for completed,2 No',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `promotion_unread_messages` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`message_id` int(11) NOT NULL DEFAULT 0,
`unread_count` int(11) NOT NULL DEFAULT 0,
`client_show` int(11) NOT NULL DEFAULT 0,
`comments_type` int(11) NOT NULL DEFAULT 1,
`promotion_id` int(11) NOT NULL DEFAULT 0,
`promotion_client_id` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `purchaseorders` (
`id` bigint(20) UNSIGNED NOT NULL,
`po_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`logo_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_gst_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gross_total_amount` double(15,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`gst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra_amount` double(15,2) NOT NULL DEFAULT 0.00,
`freight_amount` double(15,2) NOT NULL DEFAULT 0.00,
`packaging_amount` double(15,2) NOT NULL DEFAULT 0.00,
`packaging_gst` double(15,2) NOT NULL DEFAULT 0.00,
`payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_paid_amount` double(15,2) NOT NULL DEFAULT 0.00,
`approval_by` int(11) NOT NULL DEFAULT 0,
`is_approved` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_at` timestamp NULL DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`paid_flag` int(11) NOT NULL DEFAULT 0,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0,
`orderdate` timestamp NULL DEFAULT NULL,
`deliverydate` timestamp NULL DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1-retailer,2-m&d',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`retailer_unique` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`estimate_order` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`estimate_so_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`estimate_id` int(11) NOT NULL DEFAULT 0,
`retailer_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`sgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`igst_amount` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `purchaseorder_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`po_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`product_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`sku_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`hsn_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`preferred_product` tinyint(1) NOT NULL DEFAULT 0,
`brand` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`minimum_reorder_quantity` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`product_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`inventory_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`units_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`category_id` int(11) NOT NULL,
`category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`sub_category_id` int(11) NOT NULL,
`sub_category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`cost_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cost_price` double(15,2) NOT NULL DEFAULT 0.00,
`discount` double(15,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`gst` double(15,2) NOT NULL DEFAULT 0.00,
`gst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_gst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(15,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cess_extra_price` double(15,2) NOT NULL DEFAULT 0.00,
`tax_amt` double(15,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(15,2) NOT NULL DEFAULT 0.00,
`sales_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sales_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_amt` double(15,2) NOT NULL DEFAULT 0.00,
`value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`quantity` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`salesType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`returnId` int(11) NOT NULL DEFAULT 0,
`return_details_id` int(11) NOT NULL DEFAULT 0,
`retailer_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount_type` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`onboard_discount_type` int(11) NOT NULL DEFAULT 0,
`onboard_discount` double(8,2) NOT NULL DEFAULT 0.00,
`onboard_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`product_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`onboard_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_igst_price` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `purchaseorder_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`pId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderdate` date DEFAULT NULL,
`invoiceno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`reference` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`orderby` int(11) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0 COMMENT '1-pending,2-approval,3-reject,4-branch assigned,5-user assigned,6-dispatch,7-payment,8-cancel,9-invoice,10-delivery,11-return',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `purchase_payments` (
`id` bigint(20) UNSIGNED NOT NULL,
`payment_receipt` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`receipt_date` date DEFAULT NULL,
`total_invoice_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_current_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_already_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_balance_due` double(15,2) NOT NULL DEFAULT 0.00,
`office_id` int(11) NOT NULL DEFAULT 0,
`bill_client_id` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `rejected_reasons` (
`id` bigint(20) UNSIGNED NOT NULL,
`description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `renewal_histories` (
`id` bigint(20) UNSIGNED NOT NULL,
`vendor_id` int(11) NOT NULL DEFAULT 0,
`start_date` date DEFAULT NULL,
`end_date` date DEFAULT NULL,
`duration_month` int(11) NOT NULL DEFAULT 0,
`gst` int(11) NOT NULL DEFAULT 0,
`maintanance_license_cost` double(8,2) DEFAULT NULL,
`paid_amount` double(8,2) DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`receipt_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailers` (
`id` bigint(20) UNSIGNED NOT NULL,
`companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`gstno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailerId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`pincode` int(11) NOT NULL,
`doj` date NOT NULL,
`companytype` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`officetype` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`device_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`device_version` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status` int(11) NOT NULL DEFAULT 0,
`login_at` timestamp NULL DEFAULT NULL,
`login_count` int(11) NOT NULL DEFAULT 0,
`login_status` tinyint(1) NOT NULL DEFAULT 0,
`login_password_errorcount` int(11) NOT NULL DEFAULT 0,
`geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`office_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`address1` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`address2` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`upi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`ifsc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`session_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailerType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendorType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendorId` int(11) NOT NULL DEFAULT 0,
`email_cron` int(11) NOT NULL DEFAULT 0,
`referrence_password` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state_id` int(11) NOT NULL DEFAULT 0,
`map_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_activites` (
`id` bigint(20) UNSIGNED NOT NULL,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`reference_id` int(11) NOT NULL DEFAULT 0,
`so_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`total_payable_amount` double(15,2) NOT NULL DEFAULT 0.00,
`task_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_cash_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`retailer_cash_payment_id` int(11) NOT NULL DEFAULT 0,
`payment_receipt` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`receipt_date` date DEFAULT NULL,
`payment_method` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`paid_amount` double(15,2) NOT NULL DEFAULT 0.00,
`paid_date` date DEFAULT NULL,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`vendor_id` int(11) NOT NULL DEFAULT 0,
`created_by` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_cash_payments` (
`id` bigint(20) UNSIGNED NOT NULL,
`payment_receiptnumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`payment_receipt` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`receipt_date` date DEFAULT NULL,
`payment_method` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`paid_amount` double(15,2) NOT NULL DEFAULT 0.00,
`paid_date` date DEFAULT NULL,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_payment_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`tally_processing_flag` int(11) NOT NULL DEFAULT 0,
`tally_created_by` int(11) NOT NULL DEFAULT 0,
`tally_created_at` timestamp NULL DEFAULT NULL,
`tally_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_categories` (
`id` bigint(20) UNSIGNED NOT NULL,
`category` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_industries` (
`id` bigint(20) UNSIGNED NOT NULL,
`industry_types_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`active` tinyint(1) NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_outstandings` (
`id` bigint(20) UNSIGNED NOT NULL,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`RetailerName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`invoiceno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`invoice_date` date DEFAULT NULL,
`DueDate` date DEFAULT NULL,
`pending_amount` double(15,2) NOT NULL DEFAULT 0.00,
`active` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_product_discounts` (
`id` bigint(20) UNSIGNED NOT NULL,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`product_id` int(11) NOT NULL DEFAULT 0,
`discount_type` int(11) NOT NULL DEFAULT 0,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`status` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_subcategories` (
`id` bigint(20) UNSIGNED NOT NULL,
`categorie_id` int(11) DEFAULT NULL,
`subcategory` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_vendors` (
`id` bigint(20) UNSIGNED NOT NULL,
`retailer_id` int(11) NOT NULL,
`vendor_id` int(11) NOT NULL,
`request_at` timestamp NULL DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) DEFAULT NULL,
`approval_at` timestamp NULL DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`like` tinyint(1) NOT NULL DEFAULT 0,
`status` tinyint(1) NOT NULL DEFAULT 0,
`resent` int(11) NOT NULL,
`request_givenby` int(11) NOT NULL COMMENT '1 for retailer 2 for vendor ',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`vendor_active` int(11) NOT NULL DEFAULT 0,
`branch` int(11) NOT NULL DEFAULT 0,
`route_id` int(11) NOT NULL DEFAULT 0,
`route_orderby` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `retailer_vendor_notifies` (
`id` bigint(20) UNSIGNED NOT NULL,
`retailer_id` int(11) NOT NULL,
`vendor_id` int(11) NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `return_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`return_id` int(11) NOT NULL,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `roles` (
`id` bigint(20) UNSIGNED NOT NULL,
`role_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`role_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`display_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `role_user` (
`role_id` bigint(20) UNSIGNED NOT NULL,
`user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `routes` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `route_task_allocates` (
`id` bigint(20) UNSIGNED NOT NULL,
`route_id` int(11) NOT NULL DEFAULT 0,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`task_date` date DEFAULT NULL,
`task_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`user_id` int(11) NOT NULL DEFAULT 0,
`attence_user_id` int(11) NOT NULL DEFAULT 0,
`attence` timestamp NULL DEFAULT NULL,
`reference_id` int(11) NOT NULL DEFAULT 0,
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`task_order` int(11) NOT NULL DEFAULT 0,
`task_allocates_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ASSIGNED',
`time_taken` time NOT NULL DEFAULT '00:00:00',
`map_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`reminder_at` timestamp NULL DEFAULT NULL,
`notification_cron` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `route_user_allocates` (
`id` bigint(20) UNSIGNED NOT NULL,
`route_id` int(11) NOT NULL,
`user_id` int(11) NOT NULL,
`status` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`updated_by` int(11) NOT NULL DEFAULT 0,
`updated_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `salesorders` (
`id` bigint(20) UNSIGNED NOT NULL,
`so_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_id` int(11) NOT NULL,
`retailer_company` text COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_gstno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_pincode` int(11) NOT NULL,
`retailer_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_bank_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_account_number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_account_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_upi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_ifsc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_id` int(11) NOT NULL,
`vendor_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`logo_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_gst_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_currency` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_address2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_pincode` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`vendor_geo_tag` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`freight_amount` double(8,2) NOT NULL DEFAULT 0.00,
`packaging_amount` double(8,2) NOT NULL DEFAULT 0.00,
`packaging_gst` double(8,2) NOT NULL DEFAULT 0.00,
`gross_total_amount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst_amount` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_amount` double(8,2) NOT NULL DEFAULT 0.00,
`payable_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_payable_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_paid_amount` double(8,2) NOT NULL DEFAULT 0.00,
`is_approved` int(11) NOT NULL DEFAULT 0,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_at` timestamp NULL DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0,
`paid_flag` int(11) NOT NULL DEFAULT 0,
`orderdate` timestamp NULL DEFAULT NULL,
`deliverydate` timestamp NULL DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1-retailer,2-m&d',
`ordertakenBy` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RETAILER',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`created_by` int(11) NOT NULL DEFAULT 0,
`route_id` int(11) NOT NULL DEFAULT 0,
`retailer_onboard` tinyint(1) NOT NULL DEFAULT 1,
`delivery_flag` int(11) NOT NULL DEFAULT 0,
`ordermail_flag` int(11) NOT NULL DEFAULT 1,
`branch` int(11) NOT NULL DEFAULT 0,
`tally_processing_flag` int(11) NOT NULL DEFAULT 0,
`tally_created_by` int(11) NOT NULL DEFAULT 0,
`tally_created_at` timestamp NULL DEFAULT NULL,
`voucher_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`voucher_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`voucher_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`ledger` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`ledger_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`narration` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`retailer_unique` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`estimate_order` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`estimate_so_no` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`estimate_id` int(11) NOT NULL DEFAULT 0,
`retailer_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`user_route_id` int(11) NOT NULL DEFAULT 1,
`route_ordertaken_by` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`sgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`igst_amount` double(15,2) NOT NULL DEFAULT 0.00,
`taxable_value` double(15,2) NOT NULL DEFAULT 0.00,
`vendor_state_id` int(11) NOT NULL DEFAULT 0,
`retailer_state_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `salesorder_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`so_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendor_id` int(11) NOT NULL,
`retailer_id` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`product_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`sku_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`hsn_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`preferred_product` tinyint(1) NOT NULL DEFAULT 0,
`brand` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`minimum_reorder_quantity` int(11) DEFAULT NULL,
`product_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`inventory_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`units_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`category_id` int(11) NOT NULL,
`category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`sub_category_id` int(11) NOT NULL,
`sub_category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_cost_price` double(8,2) NOT NULL DEFAULT 0.00,
`discount` double(8,2) NOT NULL DEFAULT 0.00,
`discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`total_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`gst` double(8,2) NOT NULL DEFAULT 0.00,
`gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_gst_price` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra` double(8,2) NOT NULL DEFAULT 0.00,
`cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_cess_extra_price` double(8,2) NOT NULL DEFAULT 0.00,
`tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`total_tax_amt` double(8,2) NOT NULL DEFAULT 0.00,
`sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_sales_price` double(8,2) NOT NULL DEFAULT 0.00,
`total_amt` double(8,2) NOT NULL DEFAULT 0.00,
`value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`quantity` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`cancel_at` int(11) NOT NULL DEFAULT 0,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`status` tinyint(1) NOT NULL DEFAULT 0,
`salesType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`returnId` int(11) NOT NULL DEFAULT 0,
`return_details_id` int(11) NOT NULL DEFAULT 0,
`retailer_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`retailer_discount` double(8,2) NOT NULL DEFAULT 0.00,
`retailer_discount_type` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`onboard_discount_type` int(11) NOT NULL DEFAULT 0,
`onboard_discount` double(8,2) NOT NULL DEFAULT 0.00,
`onboard_discount_amount` double(8,2) NOT NULL DEFAULT 0.00,
`tally_item_code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`product_unique_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`user_route_id` int(11) NOT NULL DEFAULT 1,
`retailer_route_id` int(11) NOT NULL DEFAULT 1,
`unit_of_measurement` double(15,2) NOT NULL DEFAULT 1.00,
`varient_values` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`onboard_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`total_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`retailer_discount_value` double(15,2) NOT NULL DEFAULT 0.00,
`total_retailer_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`single_product_discount_amount` double(15,2) NOT NULL DEFAULT 0.00,
`sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_sgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_cgst_price` double(15,2) NOT NULL DEFAULT 0.00,
`total_igst_price` double(15,2) NOT NULL DEFAULT 0.00,
`taxable_value` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `salesorder_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`sId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`orderid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`invoiceno` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) NOT NULL DEFAULT 0,
`approval_at` timestamp NULL DEFAULT NULL,
`orderdate` date DEFAULT NULL,
`orderby` int(11) NOT NULL DEFAULT 0,
`status` int(11) NOT NULL DEFAULT 0 COMMENT '1-pending,2-approval,3-reject,4-assigned,5-dispatched,6-return,7-payment',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`clientType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `service_tickets` (
`id` bigint(20) UNSIGNED NOT NULL,
`ticketid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`retailer_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`route_id` int(11) NOT NULL DEFAULT 0,
`purpose_id` int(11) NOT NULL DEFAULT 0,
`purpose_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_status_id` int(11) DEFAULT NULL,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`ticket_date` date DEFAULT NULL,
`description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`comments_show` int(11) NOT NULL DEFAULT 0,
`rating_task_completed` int(11) NOT NULL DEFAULT 0 COMMENT '1-for Submit rate,2 No',
`rating_created_by` int(11) NOT NULL DEFAULT 0,
`rating_created_flag` int(11) NOT NULL DEFAULT 0 COMMENT '1-admin,2-web',
`rating_date` timestamp NULL DEFAULT NULL,
`star_rating` int(11) NOT NULL DEFAULT 0,
`rating_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`updated_by` int(11) NOT NULL DEFAULT 0,
`updated_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status_active` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`charges` double(15,2) NOT NULL DEFAULT 0.00,
`gst_percentage` double(15,2) NOT NULL DEFAULT 0.00,
`total_price` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `service_ticket_histories` (
`id` bigint(20) UNSIGNED NOT NULL,
`service_tickets_id` int(11) NOT NULL DEFAULT 0,
`retailer_id` int(11) NOT NULL DEFAULT 0,
`assiged_user_id` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`image_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`comments_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-retailer,2-user',
`created_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-imageupload,2-comments,3-Status update,4-employe updated,5-For All edit',
`created_by` int(11) NOT NULL DEFAULT 0,
`created_username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`status_active` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`client_show` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `service_ticket_purposes` (
`id` bigint(20) UNSIGNED NOT NULL,
`purpose_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`order_list` int(11) NOT NULL DEFAULT 1,
`active` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `service_ticket_statuses` (
`id` bigint(20) UNSIGNED NOT NULL,
`status_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`order_list` int(11) NOT NULL DEFAULT 1,
`active` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `service_ticket_unread_messages` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`message_id` int(11) NOT NULL DEFAULT 0,
`unread_count` int(11) NOT NULL DEFAULT 0,
`client_show` int(11) NOT NULL DEFAULT 0,
`comments_type` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`service_tickets_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `standalone_retailers` (
`id` bigint(20) UNSIGNED NOT NULL,
`companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`doj` date NOT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_by` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `standalone_retailer_products` (
`id` bigint(20) UNSIGNED NOT NULL,
`standalone_retailer_id` int(11) NOT NULL,
`product_id` int(11) NOT NULL,
`existing_quantity` double(8,2) NOT NULL DEFAULT 0.00,
`new_quantity` double(8,2) NOT NULL DEFAULT 0.00,
`sales` double(8,2) NOT NULL DEFAULT 0.00,
`status` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `states` (
`id` bigint(20) UNSIGNED NOT NULL,
`country_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `subscriptions` (
`id` bigint(20) UNSIGNED NOT NULL,
`duration_month` int(11) NOT NULL DEFAULT 0,
`maintanance_license_cost` double(8,2) NOT NULL DEFAULT 0.00,
`retailer_license_cost` double(8,2) NOT NULL DEFAULT 0.00,
`gst` int(11) NOT NULL DEFAULT 0,
`status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FREE',
`active` tinyint(1) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `sub_categories` (
`id` bigint(20) UNSIGNED NOT NULL,
`categorie_id` int(11) DEFAULT NULL,
`subcategory` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `tally_processing_lists` (
`id` bigint(20) UNSIGNED NOT NULL,
`type_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`type_count` int(11) NOT NULL DEFAULT 0,
`active_status` int(11) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `tasks` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `task_details` (
`id` bigint(20) UNSIGNED NOT NULL,
`invoice_id` int(11) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`cancel_date` timestamp NULL DEFAULT NULL,
`cancel_by` int(11) NOT NULL DEFAULT 0,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`task_id` int(11) NOT NULL DEFAULT 0,
`delivery_date` timestamp NULL DEFAULT NULL,
`description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `tenants` (
`id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `tenantusers` (
`id` bigint(20) UNSIGNED NOT NULL,
`username` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `track_attendances` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`attence` timestamp NULL DEFAULT NULL,
`task_id` int(11) NOT NULL DEFAULT 0,
`kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`createAPI` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`punch` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
`time_taken` time NOT NULL DEFAULT '00:00:00',
`reference` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`battery_life` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gps_datetime` timestamp NULL DEFAULT NULL,
`accuracy` double(8,2) NOT NULL DEFAULT 0.00,
`altitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`floor` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`speed` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`speed_accuracy` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`is_mocked` tinyint(1) NOT NULL DEFAULT 0,
`gps_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gps_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`internet_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`punch_active` int(11) NOT NULL DEFAULT 0,
`attence_status` int(11) NOT NULL DEFAULT 0,
`event_id` bigint(20) NOT NULL DEFAULT 0,
`fcm_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`kilometer_status` tinyint(1) NOT NULL DEFAULT 0,
`session_id` bigint(20) NOT NULL DEFAULT 0,
`cron_force_logout` int(11) NOT NULL DEFAULT 0 COMMENT 'manual logout =1,cron logout =2 cron update logout=3',
`route_id` int(11) NOT NULL DEFAULT 0,
`distance` double(15,2) NOT NULL DEFAULT 0.00,
`is_accurate` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `track_attendance_backups` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`attence` timestamp NULL DEFAULT NULL,
`task_id` int(11) NOT NULL DEFAULT 0,
`kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`createAPI` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`punch` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
`time_taken` time NOT NULL DEFAULT '00:00:00',
`reference` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`battery_life` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gps_datetime` timestamp NULL DEFAULT NULL,
`accuracy` double(8,2) NOT NULL DEFAULT 0.00,
`altitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`floor` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`speed` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`speed_accuracy` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`is_mocked` tinyint(1) NOT NULL DEFAULT 0,
`gps_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gps_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`internet_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`punch_active` int(11) NOT NULL DEFAULT 0,
`attence_status` int(11) NOT NULL DEFAULT 0,
`event_id` bigint(20) NOT NULL DEFAULT 0,
`fcm_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`kilometer_status` tinyint(1) NOT NULL DEFAULT 0,
`session_id` bigint(20) NOT NULL DEFAULT 0,
`cron_force_logout` int(11) NOT NULL DEFAULT 0 COMMENT 'manual logout =1,cron logout =2 cron update logout=3',
`route_id` int(11) NOT NULL DEFAULT 0,
`distance` double(15,2) NOT NULL DEFAULT 0.00,
`is_accurate` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `track_attendance_backups1` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`attence` timestamp NULL DEFAULT NULL,
`task_id` int(11) NOT NULL DEFAULT 0,
`kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`createAPI` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`punch` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
`time_taken` time NOT NULL DEFAULT '00:00:00',
`reference` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`battery_life` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gps_datetime` timestamp NULL DEFAULT NULL,
`accuracy` double(8,2) NOT NULL DEFAULT 0.00,
`altitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`floor` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`heading` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`speed` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`speed_accuracy` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`is_mocked` tinyint(1) NOT NULL DEFAULT 0,
`gps_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gps_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`internet_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`punch_active` int(11) NOT NULL DEFAULT 0,
`attence_status` int(11) NOT NULL DEFAULT 0,
`event_id` bigint(20) NOT NULL DEFAULT 0,
`fcm_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`kilometer_status` tinyint(1) NOT NULL DEFAULT 0,
`session_id` bigint(20) NOT NULL DEFAULT 0,
`cron_force_logout` int(11) DEFAULT 0,
`route_id` int(11) DEFAULT 0,
`distance` double(15,2) NOT NULL DEFAULT 0.00,
`is_accurate` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `track_listeners` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL DEFAULT 0,
`attence` timestamp NULL DEFAULT NULL,
`punch` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
`reference` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`app_state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`gps_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`createAPI` timestamp NULL DEFAULT NULL,
`time_taken` time NOT NULL DEFAULT '00:00:00',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`foregroundServiceRunning` tinyint(1) NOT NULL DEFAULT 0,
`canDrawOverlay` tinyint(1) NOT NULL DEFAULT 0,
`BatteryOptimization` tinyint(1) NOT NULL DEFAULT 0,
`locationServiceEnabled` tinyint(1) NOT NULL DEFAULT 0,
`batteryPercentage` double(8,2) NOT NULL DEFAULT 0.00,
`locationPermissionStatus` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`user_active` tinyint(1) NOT NULL DEFAULT 0,
`login_attence` timestamp NULL DEFAULT NULL,
`logout_attence` timestamp NULL DEFAULT NULL,
`latitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`longitude` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `travel_mode_allowances` (
`id` bigint(20) UNSIGNED NOT NULL,
`role_id` int(11) NOT NULL DEFAULT 0,
`two_wheeler` double(15,2) NOT NULL DEFAULT 0.00,
`four_wheeler` double(15,2) NOT NULL DEFAULT 0.00,
`public_transport` double(15,2) NOT NULL DEFAULT 0.00,
`other_transport1` double(15,2) NOT NULL DEFAULT 0.00,
`other_transport2` double(15,2) NOT NULL DEFAULT 0.00,
`day_allowance` double(15,2) NOT NULL DEFAULT 0.00,
`active` int(11) NOT NULL DEFAULT 1,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`other_expense` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `units` (
`id` bigint(20) UNSIGNED NOT NULL,
`name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `users` (
`id` bigint(20) UNSIGNED NOT NULL,
`companyname` text COLLATE utf8mb4_unicode_ci NOT NULL,
`companylogo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`companyurl` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`vendorId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`gstno` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`companyemail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`username` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`mobilenumber` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`useremail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`address1` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`address2` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`landmark` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`state` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`district` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`pincode` int(11) NOT NULL,
`companytype` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`industry_types_id` bigint(20) UNSIGNED NOT NULL,
`password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
`doj` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
`expirydate` timestamp NULL DEFAULT NULL,
`active` tinyint(1) NOT NULL DEFAULT 0,
`approval_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`approval_by` int(11) DEFAULT NULL,
`approval_at` timestamp NULL DEFAULT NULL,
`rejected_by` int(11) DEFAULT NULL,
`rejected_at` timestamp NULL DEFAULT NULL,
`subscritionId` int(11) NOT NULL DEFAULT 0,
`paymentId` int(11) NOT NULL DEFAULT 0,
`device_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`device_version` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`email_verified_at` timestamp NULL DEFAULT NULL,
`login_at` timestamp NULL DEFAULT NULL,
`login_count` int(11) NOT NULL DEFAULT 0,
`remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
`vendor_active` int(11) NOT NULL DEFAULT 0,
`vendor_delete` int(11) NOT NULL DEFAULT 0,
`state_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `user_day_reports` (
`id` bigint(20) UNSIGNED NOT NULL,
`user_id` int(11) NOT NULL,
`date_report` date DEFAULT NULL,
`time_taken` time NOT NULL DEFAULT '00:00:00',
`kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`travel_allowance` double(8,2) NOT NULL DEFAULT 0.00,
`day_allowance` double(8,2) NOT NULL DEFAULT 0.00,
`total_travel_allowance` double(8,2) NOT NULL DEFAULT 0.00,
`total_allowance` double(8,2) NOT NULL DEFAULT 0.00,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`first_attence` timestamp NULL DEFAULT NULL,
`last_attence` timestamp NULL DEFAULT NULL,
`manual_kilometer` double(8,2) NOT NULL DEFAULT 0.00,
`created_by` int(11) NOT NULL DEFAULT 0,
`updated_date` timestamp NULL DEFAULT NULL,
`logout_attence` timestamp NULL DEFAULT NULL,
`route_id` int(11) NOT NULL DEFAULT 0,
`odometer_kilometer` double(15,2) NOT NULL DEFAULT 0.00,
`other_expense` double(15,2) NOT NULL DEFAULT 0.00,
`total_odometer_allowance` double(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `admins`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `admins_email_unique` (`email`),
ADD UNIQUE KEY `admins_phone_unique` (`phone`);
ALTER TABLE `branches`
ADD PRIMARY KEY (`id`),
ADD KEY `branches_company_id_index` (`company_id`),
ADD KEY `branches_is_active_index` (`is_active`),
ADD KEY `branches_company_id_is_active_index` (`company_id`,`is_active`);
ALTER TABLE `branch_types`
ADD PRIMARY KEY (`id`);
ALTER TABLE `categories`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `categories_category_unique` (`category`);
ALTER TABLE `companies`
ADD PRIMARY KEY (`id`);
ALTER TABLE `countries`
ADD PRIMARY KEY (`id`);
ALTER TABLE `credit_notes_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `currencies`
ADD PRIMARY KEY (`id`);
ALTER TABLE `dayattendance_images`
ADD PRIMARY KEY (`id`);
ALTER TABLE `day_attendances`
ADD PRIMARY KEY (`id`);
ALTER TABLE `districts`
ADD PRIMARY KEY (`id`);
ALTER TABLE `domains`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `domains_domain_unique` (`domain`),
ADD KEY `domains_tenant_id_foreign` (`tenant_id`);
ALTER TABLE `estimate_purchaseorders`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `estimate_purchaseorders_po_no_unique` (`po_no`);
ALTER TABLE `estimate_purchaseorder_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `estimate_purchaseorder_statuses`
ADD PRIMARY KEY (`id`);
ALTER TABLE `estimate_salesorders`
ADD PRIMARY KEY (`id`);
ALTER TABLE `estimate_salesorder_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `estimate_salesorder_statuses`
ADD PRIMARY KEY (`id`);
ALTER TABLE `excelretailers`
ADD PRIMARY KEY (`id`);
ALTER TABLE `excel_products`
ADD PRIMARY KEY (`id`);
ALTER TABLE `failed_jobs`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);
ALTER TABLE `industry_types`
ADD PRIMARY KEY (`id`);
ALTER TABLE `inventor_types`
ADD PRIMARY KEY (`id`);
ALTER TABLE `invoice_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `invoice_product_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `invoice_product_returns`
ADD PRIMARY KEY (`id`);
ALTER TABLE `invoice_statuses`
ADD PRIMARY KEY (`id`);
ALTER TABLE `jobs`
ADD PRIMARY KEY (`id`),
ADD KEY `jobs_queue_index` (`queue`);
ALTER TABLE `main_permissions`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `main_permissions_name_unique` (`name`);
ALTER TABLE `migrations`
ADD PRIMARY KEY (`id`);
ALTER TABLE `notification_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `oauth_access_tokens`
ADD PRIMARY KEY (`id`),
ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);
ALTER TABLE `oauth_auth_codes`
ADD PRIMARY KEY (`id`),
ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);
ALTER TABLE `oauth_clients`
ADD PRIMARY KEY (`id`),
ADD KEY `oauth_clients_user_id_index` (`user_id`);
ALTER TABLE `oauth_personal_access_clients`
ADD PRIMARY KEY (`id`);
ALTER TABLE `oauth_refresh_tokens`
ADD PRIMARY KEY (`id`),
ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);
ALTER TABLE `office_types`
ADD PRIMARY KEY (`id`);
ALTER TABLE `old_track_attendances`
ADD PRIMARY KEY (`id`);
ALTER TABLE `order_takens`
ADD PRIMARY KEY (`id`);
ALTER TABLE `otp_verfications`
ADD PRIMARY KEY (`id`);
ALTER TABLE `password_resets`
ADD KEY `password_resets_email_index` (`email`);
ALTER TABLE `payments`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `payments_payment_receiptnumber_unique` (`payment_receiptnumber`),
ADD UNIQUE KEY `payments_payment_receipt_unique` (`payment_receipt`);
ALTER TABLE `payment_datails`
ADD PRIMARY KEY (`id`);
ALTER TABLE `payment_statuses`
ADD PRIMARY KEY (`id`);
ALTER TABLE `permissions`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `permissions_name_unique` (`name`);
ALTER TABLE `permission_role`
ADD PRIMARY KEY (`permission_id`,`role_id`),
ADD KEY `permission_role_role_id_foreign` (`role_id`);
ALTER TABLE `products`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `products_productid_unique` (`productid`);
ALTER TABLE `product_returns`
ADD PRIMARY KEY (`id`);
ALTER TABLE `product_return_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `product_stocks`
ADD PRIMARY KEY (`id`);
ALTER TABLE `promotion_banner_images`
ADD PRIMARY KEY (`id`);
ALTER TABLE `promotion_client_histories`
ADD PRIMARY KEY (`id`);
ALTER TABLE `promotion_client_lists`
ADD PRIMARY KEY (`id`);
ALTER TABLE `promotion_histories`
ADD PRIMARY KEY (`id`);
ALTER TABLE `promotion_lists`
ADD PRIMARY KEY (`id`);
ALTER TABLE `promotion_unread_messages`
ADD PRIMARY KEY (`id`);
ALTER TABLE `purchaseorders`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `purchaseorders_po_no_unique` (`po_no`);
ALTER TABLE `purchaseorder_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `purchaseorder_statuses`
ADD PRIMARY KEY (`id`);
ALTER TABLE `purchase_payments`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `purchase_payments_payment_receipt_unique` (`payment_receipt`);
ALTER TABLE `rejected_reasons`
ADD PRIMARY KEY (`id`);
ALTER TABLE `renewal_histories`
ADD PRIMARY KEY (`id`),
ADD KEY `renewal_histories_start_date_index` (`start_date`),
ADD KEY `renewal_histories_end_date_index` (`end_date`);
ALTER TABLE `retailers`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `retailers_retailerid_unique` (`retailerId`),
ADD UNIQUE KEY `retailers_mobilenumber_unique` (`mobilenumber`),
ADD UNIQUE KEY `retailers_email_unique` (`email`),
ADD KEY `retailers_email_index` (`email`),
ADD KEY `retailers_mobilenumber_index` (`mobilenumber`),
ADD KEY `retailers_password_index` (`password`),
ADD KEY `retailers_username_index` (`username`);
ALTER TABLE `retailer_activites`
ADD PRIMARY KEY (`id`);
ALTER TABLE `retailer_cash_details`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `retailer_cash_details_payment_receipt_unique` (`payment_receipt`);
ALTER TABLE `retailer_cash_payments`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `retailer_cash_payments_payment_receiptnumber_unique` (`payment_receiptnumber`),
ADD UNIQUE KEY `retailer_cash_payments_payment_receipt_unique` (`payment_receipt`);
ALTER TABLE `retailer_categories`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `retailer_categories_category_unique` (`category`);
ALTER TABLE `retailer_industries`
ADD PRIMARY KEY (`id`);
ALTER TABLE `retailer_outstandings`
ADD PRIMARY KEY (`id`);
ALTER TABLE `retailer_product_discounts`
ADD PRIMARY KEY (`id`);
ALTER TABLE `retailer_subcategories`
ADD PRIMARY KEY (`id`),
ADD KEY `retailer_subcategories_categorie_id_index` (`categorie_id`),
ADD KEY `retailer_subcategories_active_index` (`active`);
ALTER TABLE `retailer_vendors`
ADD PRIMARY KEY (`id`);
ALTER TABLE `retailer_vendor_notifies`
ADD PRIMARY KEY (`id`);
ALTER TABLE `return_statuses`
ADD PRIMARY KEY (`id`);
ALTER TABLE `roles`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `roles_name_unique` (`name`),
ADD KEY `roles_active_index` (`active`),
ADD KEY `roles_role_code_index` (`role_code`),
ADD KEY `roles_role_name_index` (`role_name`);
ALTER TABLE `role_user`
ADD PRIMARY KEY (`user_id`,`role_id`),
ADD KEY `role_user_role_id_foreign` (`role_id`);
ALTER TABLE `routes`
ADD PRIMARY KEY (`id`);
ALTER TABLE `route_task_allocates`
ADD PRIMARY KEY (`id`);
ALTER TABLE `route_user_allocates`
ADD PRIMARY KEY (`id`);
ALTER TABLE `salesorders`
ADD PRIMARY KEY (`id`);
ALTER TABLE `salesorder_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `salesorder_statuses`
ADD PRIMARY KEY (`id`);
ALTER TABLE `service_tickets`
ADD PRIMARY KEY (`id`);
ALTER TABLE `service_ticket_histories`
ADD PRIMARY KEY (`id`);
ALTER TABLE `service_ticket_purposes`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `service_ticket_purposes_purpose_name_unique` (`purpose_name`);
ALTER TABLE `service_ticket_statuses`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `service_ticket_statuses_status_name_unique` (`status_name`);
ALTER TABLE `service_ticket_unread_messages`
ADD PRIMARY KEY (`id`);
ALTER TABLE `standalone_retailers`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `standalone_retailers_mobilenumber_unique` (`mobilenumber`),
ADD UNIQUE KEY `standalone_retailers_email_unique` (`email`);
ALTER TABLE `standalone_retailer_products`
ADD PRIMARY KEY (`id`);
ALTER TABLE `states`
ADD PRIMARY KEY (`id`);
ALTER TABLE `subscriptions`
ADD PRIMARY KEY (`id`);
ALTER TABLE `sub_categories`
ADD PRIMARY KEY (`id`),
ADD KEY `sub_categories_categorie_id_index` (`categorie_id`),
ADD KEY `sub_categories_active_index` (`active`);
ALTER TABLE `tally_processing_lists`
ADD PRIMARY KEY (`id`);
ALTER TABLE `tasks`
ADD PRIMARY KEY (`id`);
ALTER TABLE `task_details`
ADD PRIMARY KEY (`id`);
ALTER TABLE `tenants`
ADD PRIMARY KEY (`id`);
ALTER TABLE `tenantusers`
ADD PRIMARY KEY (`id`);
ALTER TABLE `track_attendances`
ADD PRIMARY KEY (`id`);
ALTER TABLE `track_attendance_backups`
ADD PRIMARY KEY (`id`);
ALTER TABLE `track_attendance_backups1`
ADD PRIMARY KEY (`id`);
ALTER TABLE `track_listeners`
ADD PRIMARY KEY (`id`);
ALTER TABLE `travel_mode_allowances`
ADD PRIMARY KEY (`id`);
ALTER TABLE `units`
ADD PRIMARY KEY (`id`);
ALTER TABLE `users`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `users_companyurl_unique` (`companyurl`),
ADD UNIQUE KEY `users_vendorid_unique` (`vendorId`),
ADD UNIQUE KEY `users_gstno_unique` (`gstno`),
ADD UNIQUE KEY `users_companyemail_unique` (`companyemail`),
ADD UNIQUE KEY `users_mobilenumber_unique` (`mobilenumber`),
ADD KEY `users_approval_at_index` (`approval_at`),
ADD KEY `users_approval_by_index` (`approval_by`),
ADD KEY `users_companyemail_index` (`companyemail`),
ADD KEY `users_mobilenumber_index` (`mobilenumber`),
ADD KEY `users_password_index` (`password`),
ADD KEY `users_username_index` (`username`),
ADD KEY `users_industry_types_id_foreign` (`industry_types_id`);
ALTER TABLE `user_day_reports`
ADD PRIMARY KEY (`id`);
ALTER TABLE `admins`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `branches`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `branch_types`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `categories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `companies`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `countries`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `credit_notes_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
ALTER TABLE `currencies`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `dayattendance_images`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
ALTER TABLE `day_attendances`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=622;
ALTER TABLE `districts`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
ALTER TABLE `domains`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
ALTER TABLE `estimate_purchaseorders`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
ALTER TABLE `estimate_purchaseorder_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;
ALTER TABLE `estimate_purchaseorder_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;
ALTER TABLE `estimate_salesorders`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
ALTER TABLE `estimate_salesorder_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
ALTER TABLE `estimate_salesorder_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
ALTER TABLE `excelretailers`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1719;
ALTER TABLE `excel_products`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
ALTER TABLE `failed_jobs`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `industry_types`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
ALTER TABLE `inventor_types`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `invoice_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
ALTER TABLE `invoice_product_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
ALTER TABLE `invoice_product_returns`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `invoice_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
ALTER TABLE `jobs`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;
ALTER TABLE `main_permissions`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
ALTER TABLE `migrations`
MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
ALTER TABLE `notification_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1888;
ALTER TABLE `oauth_clients`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
ALTER TABLE `oauth_personal_access_clients`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
ALTER TABLE `office_types`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `old_track_attendances`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `order_takens`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `otp_verfications`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
ALTER TABLE `payments`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
ALTER TABLE `payment_datails`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
ALTER TABLE `payment_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
ALTER TABLE `permissions`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
ALTER TABLE `products`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
ALTER TABLE `product_returns`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;
ALTER TABLE `product_return_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
ALTER TABLE `product_stocks`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `promotion_banner_images`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
ALTER TABLE `promotion_client_histories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
ALTER TABLE `promotion_client_lists`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
ALTER TABLE `promotion_histories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `promotion_lists`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `promotion_unread_messages`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
ALTER TABLE `purchaseorders`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1302;
ALTER TABLE `purchaseorder_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2067;
ALTER TABLE `purchaseorder_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3101;
ALTER TABLE `purchase_payments`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=629;
ALTER TABLE `rejected_reasons`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `renewal_histories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
ALTER TABLE `retailers`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;
ALTER TABLE `retailer_activites`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
ALTER TABLE `retailer_cash_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
ALTER TABLE `retailer_cash_payments`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
ALTER TABLE `retailer_categories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `retailer_industries`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2365;
ALTER TABLE `retailer_outstandings`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `retailer_product_discounts`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;
ALTER TABLE `retailer_subcategories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `retailer_vendors`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=623;
ALTER TABLE `retailer_vendor_notifies`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `return_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
ALTER TABLE `roles`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `routes`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `route_task_allocates`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;
ALTER TABLE `route_user_allocates`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
ALTER TABLE `salesorders`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;
ALTER TABLE `salesorder_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
ALTER TABLE `salesorder_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;
ALTER TABLE `service_tickets`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
ALTER TABLE `service_ticket_histories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;
ALTER TABLE `service_ticket_purposes`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `service_ticket_statuses`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `service_ticket_unread_messages`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2626;
ALTER TABLE `standalone_retailers`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `standalone_retailer_products`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `states`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
ALTER TABLE `subscriptions`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `sub_categories`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `tally_processing_lists`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
ALTER TABLE `tasks`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `task_details`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
ALTER TABLE `tenantusers`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `track_attendances`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148181;
ALTER TABLE `track_attendance_backups`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148181;
ALTER TABLE `track_attendance_backups1`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31701;
ALTER TABLE `track_listeners`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=872;
ALTER TABLE `travel_mode_allowances`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
ALTER TABLE `units`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
ALTER TABLE `users`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
ALTER TABLE `user_day_reports`
MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6995;
ALTER TABLE `domains`
ADD CONSTRAINT `domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `permission_role`
ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `role_user`
ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `users`
ADD CONSTRAINT `users_industry_types_id_foreign` FOREIGN KEY (`industry_types_id`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
