
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