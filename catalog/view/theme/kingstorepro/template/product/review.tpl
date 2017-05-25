<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author"><b><?php echo $review['author']; ?></b> <span><?php echo $review['date_added']; ?></span></div>
  <div class="rating"><i class="fa fa-star<?php if($review['rating'] >= 1) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($review['rating'] >= 2) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($review['rating'] >= 3) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($review['rating'] >= 4) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($review['rating'] >= 5) { echo ' active'; } ?>"></i></div>
  <div class="text"><?php echo $review['text']; ?></div>
</div>
<?php } ?>
<div class="row pagination-results">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<?php } else { ?>
	<p style="padding-bottom: 10px"><?php echo $text_no_reviews; ?></p>
<?php } ?>
