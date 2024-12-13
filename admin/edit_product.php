<?php
// ket noi db
include 'db_connect.php';
// lay thong tin san pham can sua thong qua ID truyền qua get resquest
$qry = $conn->query("SELECT * FROM products where id = ".$_GET['id'])->fetch_array();
//tạo các biến PHP tương ứng với các cột trong bảng
// tên cột là key của mảng, value là giá trị của cột
foreach($qry as $k => $v){
	$$k = $v;
}
//gọi trang new_product.php để hiển thị form sửa sản phẩm
include 'new_product.php';
?>