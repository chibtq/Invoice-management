<div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-body">
			<form action="" id="manage-category">

        <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="" class="control-label">Tên danh mục</label>
							<input type="text" class="form-control form-control-sm" name="name" value="<?php echo isset($name) ? $name : '' ?>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label for="" class="control-label">Mô tả</label>
							<textarea name="description" id="" cols="30" rows="10" class="summernote form-control">
								<?php echo isset($description) ? $description : '' ?>
							</textarea>
						</div>
					</div>
				</div>
    </form>
    	</div>
    	<div class="card-footer border-top border-info">
    		<div class="d-flex w-100 justify-content-center align-items-center">
    			<button class="btn btn-flat  bg-gradient-primary mx-2" form="manage-category">Lưu</button>
    			<button class="btn btn-flat bg-gradient-secondary mx-2" type="button">Hủy</button>
    		</div>
    	</div>
	</div>
</div>
<!-- script khi submit form: xử lí form id =manage-category -->

<script>
	$('#manage-category').submit(function(e){
		e.preventDefault()
		start_load()
		// gửi dữ liệu form qua ajax request, dữ liệu form được lấy bằng new FormData($(this)[0])
		$.ajax({
			url:'ajax.php?action=save_category',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp == 1){
					alert_toast('Data successfully saved',"success");
					setTimeout(function(){
						location.href = 'index.php?page=category_list'
					},2000)
				}
			}
		})
	})
</script>