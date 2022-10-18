function showComments(id){
    
    if ($("#tweet"+id).hasClass("comments-section-none")){
        $("#tweet"+id).removeClass("comments-section-none")
        $("#tweet"+id).addClass("comments-section-visible")
    }else{
        $("#tweet"+id).removeClass("comments-section-visible")
        $("#tweet"+id).addClass("comments-section-none")
    }
}