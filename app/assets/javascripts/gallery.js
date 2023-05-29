$(document).ready(function() {
  $('.image-gallery img').on('click', function() {
    var $this = $(this);
    var $gallery = $this.closest('.image-gallery');
    var $images = $gallery.find('img');
    var currentIndex = $images.index($this);

    // Create a modal or any other method to display the image
    // and provide navigation buttons

    // Example: Create a modal using Bootstrap's modal component
    var modalHtml = '<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">';
    modalHtml += '<div class="modal-dialog modal-dialog-centered" role="document">';
    modalHtml += '<div class="modal-content">';
    modalHtml += '<div class="modal-body">';
    modalHtml += '<img src="' + $this.attr('src') + '" class="img-fluid" alt="' + $this.attr('alt') + '">';
    modalHtml += '</div>';
    modalHtml += '<div class="modal-footer">';
    modalHtml += '<button type="button" class="btn btn-secondary prev-image">Previous</button>';
    modalHtml += '<button type="button" class="btn btn-secondary next-image">Next</button>';
    modalHtml += '</div>';
    modalHtml += '</div>';
    modalHtml += '</div>';
    modalHtml += '</div>';
    $('body').append(modalHtml);

    // Handle click events for navigation buttons
    $('#imageModal .prev-image').on('click', function() {
      currentIndex--;
      if (currentIndex < 0) {
        currentIndex = $images.length - 1;
      }
      $modalBody.find('img').attr('src', $images.eq(currentIndex).attr('src'));
    });

    $('#imageModal .next-image').on('click', function() {
      currentIndex++;
      if (currentIndex >= $images.length) {
        currentIndex = 0;
      }
      $modalBody.find('img').attr('src', $images.eq(currentIndex).attr('src'));
    });

    // Show the modal
    $('#imageModal').modal('show');
  });
});
