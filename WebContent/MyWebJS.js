function jian() {
	//rows 集合返回表格中所有行
	//获取到表格中的所有行
	var lo = document.getElementById("customers").rows.length;
	if(lo < 17) {
		var x = document.getElementById("customers");
		var trx = document.createElement("tr");
		var td1 = document.createElement("td");
		var td2 = document.createElement("td");
		var td3 = document.createElement("td");
		var td4 = document.createElement("td");
		var td5 = document.createElement("td");
		td1.innerHTML = lo - 1;
		td2.innerHTML = "null";
		td3.innerHTML = "null";
		td4.innerHTML = "null";
		td5.innerHTML = "null"
		trx.appendChild(td1);
		trx.appendChild(td2);
		trx.appendChild(td3);
		trx.appendChild(td4);
		trx.appendChild(td5);
		x.appendChild(trx);
	}
	//查询所有td标签,组成数组
	var td = document.getElementsByTagName("td"); 
	//循环绑定点击事件
	for(var i = 0; i < td.length; i++) {
		td[i].ondblclick = function() {
			sr();
		}
	}
}

function jie() {
	var lo = document.getElementById("customers").rows.length;
	if(lo > 3) {
		//获取table下的所有子节点
		var nodes = document.getElementById("customers").childNodes[0].childNodes;
		document.getElementById("customers").deleteRow(nodes.length - 1);
	} else {
		alert("至少保留一个员工!!")
	}

}

function sr() {
	// 通过event.srcElement 获取激活事件的对象 td
	var td = event.srcElement;
	//获取到td里面的内容
	var str = td.innerText;
	td.innerText = " ";
	//新建input标签
	var txt = document.createElement("input");
	txt.type = "text";
	txt.width = "25px";
	txt.id = "txts";
	txt.value = str;
	txt.onblur = function() {
		//获取到input标签
		var inp = document.getElementById("txts");
		var ss = inp.value;
		td.removeChild(inp);
		td.innerHTML = ss;
	}
	td.appendChild(txt);
	document.getElementById("txts").focus();
}