$(window).on("resize", function(event){
    $(".header-container-blog").each(function(){
        var img_height = $(this).find(".img-blog").first().height();
        if (img_height < 200) {
            $(this).find("h1.blog-title").first().css("font-size", "20px")
            $(this).find("p.blog-title").first().css("font-size", "12px")
            $(this).find("h3.blog-title").first().css("font-size", "20px")
            $(this).find("h3.blog-title").first().css("margin", "0px 0px 10px 0px")
        } else {
            $(this).find("h1.blog-title").first().css("font-size", "calc(1.375rem + 1.5vw)")
            $(this).find("p.blog-title").first().css("font-size", "calc(0.7rem + 0.5vw)")
            $(this).find("h3.blog-title").first().css("margin", "0px 0px 20px 0px")
        }
    })
    
});

$(window).resize();