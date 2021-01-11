function tableScrollFixed(id){

  var scrollBox=$(id);


  scrollBox.perfectScrollbar({
      suppressScrollX:true
  });

  var func=function () {

      var fixedHeader=scrollBox.find('.fixed-header-table');

      var tableElem=scrollBox.children('.table-data').clone();

      fixedHeader.html("");

      fixedHeader.empty().append(tableElem);

      fixedHeader.find('thead').find('th').each(function(){
          $(this).css({
              width:$(this).width()
          });
      });

      fixedHeader.find('tbody').hide();

      scrollBox.off('scroll');

      scrollBox.on('scroll',function(){
          fixedHeader.css({
              top:$(this).scrollTop()
          })
      });

  };

  func();

  $(window).resize(function(){
      func();
  });

  }