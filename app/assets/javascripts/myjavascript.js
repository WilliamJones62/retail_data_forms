  $(document).ready(function() {

    $('.mytable').DataTable({
      scrollY: "400px",
      scrollCollapse: true,
      paging: false,
      autoWidth: true,
      responsive: true,
      retrieve: true,
      buttons: [
        'print'
      ]
    });

  });
