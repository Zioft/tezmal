-- convert Laravel migrations to raw SQL scripts --

-- migration:2014_10_12_100000_create_password_resets_table --
create table `password_resets` (
  `email` varchar(255) not null, 
  `token` varchar(255) not null, 
  `created_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `password_resets` 
add 
  index `password_resets_email_index`(`email`);

-- migration:2019_08_19_000000_create_failed_jobs_table --
create table `failed_jobs` (
  `id` bigint unsigned not null auto_increment primary key, 
  `uuid` varchar(255) not null, 
  `connection` text not null, 
  `queue` text not null, 
  `payload` longtext not null, 
  `exception` longtext not null, 
  `failed_at` timestamp default CURRENT_TIMESTAMP not null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `failed_jobs` 
add 
  unique `failed_jobs_uuid_unique`(`uuid`);

-- migration:2020_10_21_170025_create_countries_table --
create table `countries` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `iso3` varchar(255) null, 
  `iso2` varchar(255) null, 
  `phonecode` varchar(255) null, 
  `capital` varchar(255) null, 
  `currency` varchar(255) null, 
  `native` varchar(255) null, 
  `emoji` varchar(255) null, 
  `emojiU` varchar(255) null, 
  `flag` tinyint(1) not null default '1', 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

-- migration:2020_10_21_170436_create_states_table --
create table `states` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `country_id` bigint unsigned not null, 
  `iso2` varchar(255) null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `states` 
add 
  constraint `states_country_id_foreign` foreign key (`country_id`) references `countries` (`id`) on delete cascade;

-- migration:2020_10_21_170752_create_cities_table --
create table `cities` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `state_id` bigint unsigned not null, 
  `country_id` bigint unsigned not null, 
  `latitude` decimal(10, 8) not null, 
  `longitude` decimal(10, 8) not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `cities` 
add 
  constraint `cities_state_id_foreign` foreign key (`state_id`) references `states` (`id`) on delete cascade;
alter table 
  `cities` 
add 
  constraint `cities_country_id_foreign` foreign key (`country_id`) references `countries` (`id`) on delete cascade;

-- migration:2020_10_21_174128_create_images_table --
create table `images` (
  `id` bigint unsigned not null auto_increment primary key, 
  `imageable_id` bigint unsigned not null, 
  `imageable_type` varchar(255) not null, 
  `path` text not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

-- migration:2020_10_21_175135_create_user_statuses_table --
create table `user_statuses` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

-- migration:2020_10_21_175136_create_users_table --
create table `users` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `email` varchar(255) not null, 
  `password` varchar(255) not null, 
  `country_id` bigint unsigned not null, 
  `state_id` bigint unsigned not null, 
  `city_id` bigint unsigned not null, 
  `address` text not null, 
  `postal_code` int not null, 
  `contact_no` int not null, 
  `date_of_birth` date null, 
  `user_status_id` bigint unsigned null, 
  `remember_token` varchar(100) null, 
  `email_verified_at` timestamp null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `users` 
add 
  constraint `users_country_id_foreign` foreign key (`country_id`) references `countries` (`id`) on delete cascade;
alter table 
  `users` 
add 
  constraint `users_state_id_foreign` foreign key (`state_id`) references `states` (`id`) on delete cascade;
alter table 
  `users` 
add 
  constraint `users_city_id_foreign` foreign key (`city_id`) references `cities` (`id`) on delete cascade;
alter table 
  `users` 
add 
  constraint `users_user_status_id_foreign` foreign key (`user_status_id`) references `user_statuses` (`id`) on delete cascade;
alter table 
  `users` 
add 
  unique `users_email_unique`(`email`);

-- migration:2020_10_21_182215_create_permission_tables --
create table `permissions` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `guard_name` varchar(255) not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
create table `roles` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `guard_name` varchar(255) not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
create table `model_has_permissions` (
  `permission_id` bigint unsigned not null, 
  `model_type` varchar(255) not null, 
  `model_id` bigint unsigned not null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `model_has_permissions` 
add 
  index `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`);
alter table 
  `model_has_permissions` 
add 
  constraint `model_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade;
alter table 
  `model_has_permissions` 
add 
  primary key `model_has_permissions_permission_model_type_primary`(
    `permission_id`, `model_id`, `model_type`
  );
create table `model_has_roles` (
  `role_id` bigint unsigned not null, 
  `model_type` varchar(255) not null, 
  `model_id` bigint unsigned not null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `model_has_roles` 
add 
  index `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`);
alter table 
  `model_has_roles` 
add 
  constraint `model_has_roles_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade;
alter table 
  `model_has_roles` 
add 
  primary key `model_has_roles_role_model_type_primary`(
    `role_id`, `model_id`, `model_type`
  );
create table `role_has_permissions` (
  `permission_id` bigint unsigned not null, 
  `role_id` bigint unsigned not null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `role_has_permissions` 
add 
  constraint `role_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade;
alter table 
  `role_has_permissions` 
add 
  constraint `role_has_permissions_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade;
alter table 
  `role_has_permissions` 
add 
  primary key `role_has_permissions_permission_id_role_id_primary`(`permission_id`, `role_id`);

-- migration:2020_10_21_183701_create_categories_table --
create table `categories` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `user_id` bigint unsigned not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `categories` 
add 
  constraint `categories_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;

-- migration:2020_10_21_183945_create_sub_categories_table --
create table `sub_categories` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `user_id` bigint unsigned not null, 
  `category_id` bigint unsigned not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `sub_categories` 
add 
  constraint `sub_categories_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;
alter table 
  `sub_categories` 
add 
  constraint `sub_categories_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade;

-- migration:2020_10_21_184448_create_brands_table --
create table `brands` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `user_id` bigint unsigned not null, 
  `category_id` bigint unsigned not null, 
  `sub_category_id` bigint unsigned not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `brands` 
add 
  constraint `brands_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;
alter table 
  `brands` 
add 
  constraint `brands_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade;
alter table 
  `brands` 
add 
  constraint `brands_sub_category_id_foreign` foreign key (`sub_category_id`) references `sub_categories` (`id`) on delete cascade;

-- migration:2020_10_21_185402_create_product_sizes_table --
create table `product_sizes` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `user_id` bigint unsigned not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `product_sizes` 
add 
  constraint `product_sizes_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;

-- migration:2020_10_21_190838_create_product_colors_table --
create table `product_colors` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

-- migration:2020_10_21_191105_create_product_statuses_table --
create table `product_statuses` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

-- migration:2020_10_21_191106_create_products_table --
create table `products` (
  `id` bigint unsigned not null auto_increment primary key, 
  `title` text not null, 
  `quantity` int not null, 
  `sku` varchar(255) not null, 
  `width` double(8, 2) not null, 
  `height` double(8, 2) not null, 
  `weight` double(8, 2) not null, 
  `depth` double(8, 2) not null, 
  `short_description` text null, 
  `long_description` text null, 
  `features` text null, 
  `contains` text null, 
  `user_id` bigint unsigned not null, 
  `category_id` bigint unsigned not null, 
  `sub_category_id` bigint unsigned not null, 
  `brand_id` bigint unsigned not null, 
  `product_status_id` bigint unsigned null, 
  `is_approved` tinyint(1) not null default '0', 
  `is_featured` tinyint(1) not null default '0', 
  `is_package` tinyint(1) not null default '0', 
  `package_size` int null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `products` 
add 
  constraint `products_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;
alter table 
  `products` 
add 
  constraint `products_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade;
alter table 
  `products` 
add 
  constraint `products_sub_category_id_foreign` foreign key (`sub_category_id`) references `sub_categories` (`id`) on delete cascade;
alter table 
  `products` 
add 
  constraint `products_brand_id_foreign` foreign key (`brand_id`) references `brands` (`id`) on delete cascade;
alter table 
  `products` 
add 
  constraint `products_product_status_id_foreign` foreign key (`product_status_id`) references `product_statuses` (`id`) on delete cascade;

-- migration:2020_10_21_193844_create_product_size_table --
create table `product_size` (
  `id` bigint unsigned not null auto_increment primary key, 
  `product_id` bigint unsigned not null, 
  `product_size_id` bigint unsigned not null, 
  `created_at` timestamp null, `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `product_size` 
add 
  constraint `product_size_product_id_foreign` foreign key (`product_id`) references `products` (`id`) on delete cascade;
alter table 
  `product_size` 
add 
  constraint `product_size_product_size_id_foreign` foreign key (`product_size_id`) references `product_sizes` (`id`) on delete cascade;

-- migration:2020_10_21_194943_create_color_product_table --
create table `color_product` (
  `id` bigint unsigned not null auto_increment primary key, 
  `product_id` bigint unsigned not null, 
  `product_color_id` bigint unsigned not null, 
  `created_at` timestamp null, `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `color_product` 
add 
  constraint `color_product_product_id_foreign` foreign key (`product_id`) references `products` (`id`) on delete cascade;
alter table 
  `color_product` 
add 
  constraint `color_product_product_color_id_foreign` foreign key (`product_color_id`) references `product_colors` (`id`) on delete cascade;

-- migration:2020_10_22_134723_create_courier_charges_table --
create table `courier_charges` (
  `id` bigint unsigned not null auto_increment primary key, 
  `charges` double not null, `city_id` bigint unsigned not null, 
  `created_at` timestamp null, `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `courier_charges` 
add 
  constraint `courier_charges_city_id_foreign` foreign key (`city_id`) references `cities` (`id`) on delete cascade;

-- migration:2020_10_22_135448_create_order_statuses_table --
create table `order_statuses` (
  `id` bigint unsigned not null auto_increment primary key, 
  `name` varchar(255) not null, 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';

-- migration:2020_10_22_135449_create_orders_table --
create table `orders` (
  `id` bigint unsigned not null auto_increment primary key, 
  `user_id` bigint unsigned not null, 
  `vendor_id` bigint unsigned not null, 
  `total_amount` double not null, 
  `courier_charge_id` bigint unsigned not null, 
  `order_status_id` bigint unsigned not null, 
  `order_status_reason` text null, 
  `has_shipping_detail` tinyint(1) not null default '0', 
  `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `orders` 
add 
  constraint `orders_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;
alter table 
  `orders` 
add 
  constraint `orders_vendor_id_foreign` foreign key (`vendor_id`) references `users` (`id`) on delete cascade;
alter table 
  `orders` 
add 
  constraint `orders_courier_charge_id_foreign` foreign key (`courier_charge_id`) references `courier_charges` (`id`) on delete cascade;
alter table 
  `orders` 
add 
  constraint `orders_order_status_id_foreign` foreign key (`order_status_id`) references `order_statuses` (`id`) on delete cascade;

-- migration:2020_10_22_140808_create_order_product_table --
create table `order_product` (
  `id` bigint unsigned not null auto_increment primary key, 
  `product_id` bigint unsigned not null, 
  `order_id` bigint unsigned not null, 
  `created_at` timestamp null, `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `order_product` 
add 
  constraint `order_product_product_id_foreign` foreign key (`product_id`) references `products` (`id`) on delete cascade;
alter table 
  `order_product` 
add 
  constraint `order_product_order_id_foreign` foreign key (`order_id`) references `orders` (`id`) on delete cascade;

-- migration:2020_10_22_142626_create_shipping_details_table --
create table `shipping_details` (
  `id` bigint unsigned not null auto_increment primary key, 
  `user_id` bigint unsigned not null, 
  `country_id` bigint unsigned not null, 
  `state_id` bigint unsigned not null, 
  `city_id` bigint unsigned not null, 
  `address` text not null, `postal_code` int not null, 
  `contact_no` int not null, `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `shipping_details` 
add 
  constraint `shipping_details_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;
alter table 
  `shipping_details` 
add 
  constraint `shipping_details_country_id_foreign` foreign key (`country_id`) references `countries` (`id`) on delete cascade;
alter table 
  `shipping_details` 
add 
  constraint `shipping_details_state_id_foreign` foreign key (`state_id`) references `states` (`id`) on delete cascade;
alter table 
  `shipping_details` 
add 
  constraint `shipping_details_city_id_foreign` foreign key (`city_id`) references `cities` (`id`) on delete cascade;

-- migration:2020_10_22_144402_create_wishlists_table --
create table `wishlists` (
  `id` bigint unsigned not null auto_increment primary key, 
  `user_id` bigint unsigned not null, 
  `product_id` bigint unsigned not null, 
  `created_at` timestamp null, `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `wishlists` 
add 
  constraint `wishlists_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;
alter table 
  `wishlists` 
add 
  constraint `wishlists_product_id_foreign` foreign key (`product_id`) references `products` (`id`) on delete cascade;

-- migration:2020_10_22_150848_create_testimonials_table --
create table `testimonials` (
  `id` bigint unsigned not null auto_increment primary key, 
  `user_id` bigint unsigned not null, 
  `vendor_id` bigint unsigned not null, 
  `comment` text not null, `created_at` timestamp null, 
  `updated_at` timestamp null
) default character set utf8mb4 collate 'utf8mb4_unicode_ci';
alter table 
  `testimonials` 
add 
  constraint `testimonials_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade;
alter table 
  `testimonials` 
add 
  constraint `testimonials_vendor_id_foreign` foreign key (`vendor_id`) references `vendors` (`id`) on delete cascade;
