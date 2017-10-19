// $(function(){
//   function buildHTML(comment){
//     var html = `<h4>${comment.user_name}</h4>
//                 <p>${comment.text}</p>
//                 <a href=${comment.prototype_id}, method: :post>編集</a>
//                `
//     return html;
//   }
//   $('#new_comment').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var href = window.location.href + '/comments'
//     $.ajax({
//       url: href,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.proto_comments').append(html)
//       $('.textbox').val('')
//     })
//     .fail(function(){
//       alert('error');
//     })
//   })
// });

// $(function(){
//   function buildHTML(comment){
//     var html = `<h4>${comment.user.name}</h4>
//                 <p>${comment.text}</p>
//                `
//     return html;
//   }
//   $('#new_comment').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action')
//     $.ajax({
//       url: url,
//       type: 'POST',
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.medie-body').append(html)
//       $('.text-box').val('')
//     })
//     .fail(function(){
//       alert('error');
//     })
//   })
// });
