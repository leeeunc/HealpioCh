window.onload = function(){

    let user_btn = document.querySelector('#user_btn');
    
    user_btn.addEventListener('click', () => {
        var click = document.getElementById("user_options");
        if(click.style.display === "none"){
            click.style.display = "block";
    
        }else{
            click.style.display = "none";
    
        }
    })
    
    user_btn.addEventListener('blur', () => {
        const blur = document.getElementById("user_options");
        setTimeout(() => {
            blur.style.display = 'none';
          }, 200);
      });


      let message_btn = document.querySelector('#message_btn');
    
      message_btn.addEventListener('click', () => {
          var click = document.getElementById("message_options");
          if(click.style.display === "none"){
              click.style.display = "block";
      
          }else{
              click.style.display = "none";
      
          }
      })
      
      message_btn.addEventListener('blur', () => {
          const blur = document.getElementById("message_options");
          setTimeout(() => {
              blur.style.display = 'none';
            }, 200);
        });
      
}

function go_recv(){
	let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'nickname');
    obj.setAttribute('value', document.querySelector('#nickname').value);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/message/list_recv');
    f.setAttribute("target", "targetName");
    document.body.appendChild(f);
    
    window.open('', "targetName", "width=500, height=570");
    
    f.submit();
}

function go_send(){
	let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'nickname');
    obj.setAttribute('value', document.querySelector('#nickname').value);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/message/list_send');
    f.setAttribute("target", "targetName");
    document.body.appendChild(f);
    
    window.open('', "targetName", "width=500, height=570");
    
    f.submit();
}