<!-- Modal -->
<div class="modal fade" id="bookAddModal" tabindex="-1" role="dialog" aria-labelledby="bookAddModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title book-modal-title">ADD BOOK</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
			</div>
			<div class="modal-body">
				<form role="form" id="bookAddForm" action="/book" method="POST">
					<h5 class="form-subtitle">Author</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>Name</label>
									<input type="text" class="form-control" id="authorName" name="bookDetails.author.name" placeholder="Enter author name" autocomplete="off"> </div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>Pen Name</label>
									<input type="text" class="form-control" id="authorPenName" name="bookDetails.author.penName" placeholder="Enter author pen name" autocomplete="off"> </div>
							</div>
						</div>
					</div>
					<hr>
					<h5 class="form-subtitle">Book</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>Name</label>
									<input type="text" class="form-control" id="name" name="bookDetails.name" placeholder="Enter book name" autocomplete="off"> </div>
								<div class="form-group">
									<label>Category</label>
									<input type="text" class="form-control" id="category" name="bookDetails.category" placeholder="Enter book category" autocomplete="off"> </div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>Language</label>
									<input type="text" class="form-control" id="language" name="bookDetails.language" placeholder="Enter book language" autocomplete="off"> </div>
								<div class="form-group">
									<label>Publication</label>
									<input type="text" class="form-control" id="publication" name="bookDetails.publication" placeholder="Enter publication" autocomplete="off"> </div>
							</div>
						</div>
					</div>
					<hr>
					<h5 class="form-subtitle">Details</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>Book id's</label>
									<input type="text" class="form-control" id="bookId" name="bookIds" placeholder="Enter book id's separated by commas" autocomplete="off"> </div>
								<div class="form-group">
									<label>Rack</label>
									<input type="text" class="form-control" id="rack" name="rack" placeholder="Enter rack" autocomplete="off"> </div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>Contributed By</label>
									<input type="text" class="form-control" id="contributed" name="contributedBy" placeholder="Enter contributed by" autocomplete="off"> </div>
								<div class="form-group">
									<label>Purchased Date</label>
									<input type="text" class="form-control" id="purchased" name="purchasedDate" placeholder="Enter purchased date" autocomplete="off"> </div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>Price</label>
									<input type="text" class="form-control" id="price" name="price" placeholder="Enter price" autocomplete="off"> </div>
							</div>
						</div>
					</div>
					<div class="col-12">
						<input type="submit" class="btn btn-primary btn-block" id="addBook" value="Add" /> </div>
				</form>
			</div>
		</div>
	</div>
</div>