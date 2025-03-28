<?php include 'db_connect.php' ?>
<div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-body">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th class="text-center">Ngày đặt</th>
						<th class="text-center">Mã đơn</th>
						<th class="text-center">Địa chỉ</th>
						<th class="text-center">Trạng thái</th>
						<th class="text-center">Tùy chọn</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
					$query = $conn->query("SELECT o.*,concat(u.lastname,', ',u.firstname,' ',u.middlename) as name FROM orders o inner join users u on u.id = o.user_id order by unix_timestamp(o.date_created)");
					while($row= $query->fetch_assoc()):
					?>
					<tr>
						<td class="text-center"><?php echo $i++ ?></td>
						<td class=""><?php echo date("M d, Y",strtotime($row['date_created'])) ?></td>
						<td class=""><?php echo $row['ref_id'] ?></td>
						<td class=""><?php echo $row['delivery_address'] ?></td>
						<td class="text-center">
							<?php if($row['status'] == 0): ?>
								<span class="badge badge-secondary">Chờ lấy hàng</span>
							<?php elseif($row['status'] == 1): ?>
								<span class="badge badge-primary">Đã lấy hàng</span>
							<?php elseif($row['status'] == 2): ?>
								<span class="badge badge-info">Đã gửi</span>
							<?php elseif($row['status'] == 3): ?>
								<span class="badge badge-success">Đã giao</span>
							<?php else: ?>
								<span class="badge badge-danger">Hủy</span>
							<?php endif; ?>
						</td>
						<td class="text-center">
	                         <div class="btn-group">
		                        <a href="javascript:void(0)" class="btn btn-primary btn-flat update_order" data-id="<?php echo $row['id'] ?>" data-code="<?php echo $row['ref_id'] ?>">
		                          <i class="fas fa-edit"></i>
		                        </a>
		                         <a href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" data-code="<?php echo $row['ref_id'] ?>" class="btn btn-info btn-flat view_order">
		                          <i class="fas fa-eye"></i>
								</a>
		                        <button type="button" class="btn btn-danger btn-flat delete_order" data-id="<?php echo $row['id'] ?>">
		                          <i class="fas fa-trash"></i>
		                        </button>
	                      </div>
					</tr>
					<?php endwhile; ?>
				</tbody>
				
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('table').dataTable()
		$('.view_order').click(function(){
			uni_modal("Order "+$(this).attr('data-code'),"view_order.php?id="+$(this).attr('data-id'),"large")
		})
		$('.update_order').click(function(){
			uni_modal("Update Order "+$(this).attr('data-code')+' Status',"manage_order.php?id="+$(this).attr('data-id'))
		})
		$('.delete_order').click(function(){
		_conf("Are you sure to delete this order?","delete_order",[$(this).attr('data-id')])
		})
	})
	function delete_order($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_order',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>