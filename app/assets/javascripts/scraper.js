$('#images').on("click", function(){
  // alert("i'm getting here");
  $.ajax({
    type: "GET",
    url: "/images",
    dataType: "json"
  }).done(function(data){
    console.log(data);
    // debugger;
    for( var i = 0; i < data.length; i++) {
      var imgTag = $('<img>');
      imgTag.attr("src", data[i]);
      $( document.body ).append( imgTag );
    }
  });
});
$('#links').on("click", function(){
  $.ajax({
    type: "GET",
    url: "/hrefs",
    dataType: "json"
  }).done(function(data){
    console.log(data);
    for( var i = 0; i < data.length; i++) {
      // console.log("getting here");
      var aTag = $("<a>", {
        name: "link",
        href: data[i],
        text: "link " + i
      }).appendTo('body');
      // aTag.attr("href", data[i]);
      // aTag.textContent = "link";
      // $( document.body ).append( aTag );
      console.log(aTag);
    }
  });
});