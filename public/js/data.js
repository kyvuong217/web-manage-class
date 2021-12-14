// $(document).on('click', 'ul li', function(){
//     $(this).addClass('active').siblings().removeClass('active');
// })
window.addEventListener('load', function() {

    $(".middle-list >li>a[href='" + location.pathname + "']").parent().addClass("active").each(function() {

        $(".middle-list >li>a[href='" + $(this).attr("href") + "']").parent().addClass("active")
        $(this).addClass('active').siblings().removeClass('active');
    });

}) 


