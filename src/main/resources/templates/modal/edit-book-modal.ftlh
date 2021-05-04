<!-- Modal -->
<div class="modal fade" id="bookEditModal" tabindex="-1" role="dialog" aria-labelledby="bookAddModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title book-modal-title">EDIT BOOK</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
			</div>
			<div class="modal-body">
				<form role="form" id="bookEditForm" action="/book" method="POST">
					<h5 class="form-subtitle">Author</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>Name</label>
									<input type="text" class="form-control" id="authorNameEdit" name="bookDetails.author.name" placeholder="Enter author name" autocomplete="off"> </div>
							</div>
							<input type="hidden" id="authorIdEdit" name="bookDetails.author.id" value="">
							<div class="col-6">
								<div class="form-group">
									<label>Pen Name</label>
									<input type="text" class="form-control" id="authorPenNameEdit" name="bookDetails.author.penName" placeholder="Enter author pen name" autocomplete="off"> </div>
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
									<input type="text" class="form-control" id="nameEdit" name="bookDetails.name" placeholder="Enter book name" autocomplete="off"> </div>
								<div class="form-group">
									<label>Category</label>
									<input type="text" class="form-control" id="categoryEdit" name="bookDetails.category" placeholder="Enter book category" autocomplete="off"> </div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>Language</label>
									<input type="text" class="form-control" id="languageEdit" name="bookDetails.language" placeholder="Enter book language" autocomplete="off"> </div>
								<div class="form-group">
									<label>Publication</label>
									<input type="text" class="form-control" id="publicationEdit" name="bookDetails.publication" placeholder="Enter publication" autocomplete="off">
									<input type="hidden" id="bookDetailIdEdit" name="bookDetails.id"> </div>
							</div>
						</div>
					</div>
					<hr>
					<h5 class="form-subtitle">Details</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>Book id</label>
									<input type="text" class="form-control" id="bookIdEdit" name="bookId" placeholder="Enter book id" autocomplete="off"> </div>
								<div class="form-group">
									<label>Rack</label>
									<input type="text" class="form-control" id="rackEdit" name="rack" placeholder="Enter rack" autocomplete="off"> </div>
							</div>
							<div class="col-6">
								<div class="form-group">
									<label>Contributed By</label>
									<input type="text" class="form-control" id="contributedByEdit" name="contributedBy" placeholder="Enter contributed by" autocomplete="off"> </div>
								<div class="form-group">
									<label>Purchased Date</label>
									<input type="text" class="form-control" id="purchasedDateEdit" name="purchasedDate" placeholder="Enter purchased date" autocomplete="off"> </div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label>Price</label>
									<input type="text" class="form-control" id="priceEdit" name="price" placeholder="Enter price" autocomplete="off"> </div>
							</div>
						</div>
					</div>
					<div class="col-12">
						<input type="submit" class="btn btn-primary btn-block" id="editBook" value="Edit" /> </div>
				</form>
			</div>
		</div>
	</div>
</div>