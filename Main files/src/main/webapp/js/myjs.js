function doLike(pid,uid)
{

    // console.log(pid+","+uid)

    const d={
        pid: pid,
        uid: uid,
        operation: 'like'
    }

    $.ajax({
        url: "Like_servlet",
        data: d,
        success: function (data,textStatus,jqXHR){
            console.log(data);
            let c = $(".like-counter").html();

            if (data.trim() == 'true')
            {
                c++;
                $('.like-counter').html(c);
            }else if(data.trim() =='false'){
                c--;
                $('.like-counter').html(c);
            }
        },
        error: function (jqXHR,textStatus,errorThrown){
            console.log(data);
        }
    })

}


$('.scrollToTop').on('click', function(event){
    event.preventDefault();
    $('html, body').stop().animate({scrollTop: $('.beginning').offset().top}, 500);
});


$('.scrollToTop_profile').on('click', function(event){
    event.preventDefault();
    $('html, body').stop().animate({scrollTop_profile: $('.beginning').offset().top}, 500);
});