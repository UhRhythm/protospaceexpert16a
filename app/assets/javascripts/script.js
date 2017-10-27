$(document).on('turbolinks:load',function(){
  function buildHTML(comments){
    if (comments.user_avatar != null)
      var user_avatar = `<img alt="64x64", src="", style="width: 64px; height: 64px;", "data-src"="holder.js/64x64", "data-holder"="{&quot;rendered&quot;:&quot;true&quot;}", class="media-object">`
    var html = `
      <div id="comments">
        <div class="media">
          <div class="media-left">
            <a href="/users/83"></a>
              ${user_avatar}</div>
          <div class="media-body", id="comments-review" data-id"${comments.id}">
            <h4 class="media-heading#top-aligned-media">${comments.user_name}</h4>
            <p>${comments.text}</p>
            <a href=${comments.prototype_id}, ${comments.id}>編集</a>
            <a data-method="delete" href="/prototypes/${comments.prototype_id}/comments/${comments.id}">削除</a>
          </div>
        </div>
      </div>
               `
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + "/comments"
    $.ajax({
      url: href,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data, status, xhr) {
      if (xhr.status === 200) {
        var html = buildHTML(data);
        var input = $('#comment_text').val();
        if(input === "") {
          alert("コメントを入力して下さい")
          return;
        }
      $('.col-md-8').append(html);
      $('#comment_text').val('');
      $('html,body').animate({scrollTop: $('body')[0].scrollHeight}, 'slow');
      } else {
        console.log(xhr.getResponseHeader('Location'));
      }
    })
    .fail(function(){
      alert('以下のエラーが考えられます。\n1.コメントが入力できていない\n2.ログインできていない。');
    })
  })
});

