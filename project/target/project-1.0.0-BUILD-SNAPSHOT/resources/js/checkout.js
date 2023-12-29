/**
 * 
 */
function checkAll(){
	let isChecked = document.getElementById("checkAll").checked;
	
	let chks = document.getElementsByName("chk");
	
	for(i=0;i<chks.length;i++){
		chks[i].checked = isChecked;
	}
}
function prodDel(){
	let chks = document.getElementsByName("chk");
	
	let pnumStr = "";
	let separator = false;
	for(i=0; i<chks.length; i++){
		if(chks[i].checked){
			if(separator){
				pnumStr = pnumStr +"/";
			}
			pnumStr = pnumStr + chks[i].value;
			separator = true;
		}
	}
	if(!pnumStr){
		alert("삭제할 제품을 체크하세요.");
		return;
	}
	document.checkForm.delPnums.value=pnumStr;
	
	let res = confirm("삭제 하시겠습니까?");
	if(res){
		document.checkForm.submit();
	}
}
function usePoint(obj,point,price){
	let pointElem = document.getElementById("point");
	let tot_amount = document.getElementById("cartTotPrice")
	
	if(obj.checked){
		pointElem.value = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		if((price-point)<0){
			alert("포인트는 최대 " + price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 까지 사용하실 수 있습니다");
		}else{
		tot_amount.innerText = (price-point).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	}
	else{
		pointElem.value = "";
		tot_amount.innerText = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
}
function removeChar(e){
	e.target.value = e.target.value.replace(/[^0-9]/g, '');
}

function selPayment(){
	let payArr = document.getElementsByName("payment");
	
	for(let i = 0; i<payArr.length; i++){
		if(payArr[i].checked){
			document.getElementById(payArr[i].value).style.display="block";
		}else{
			document.getElementById(payArr[i].value).style.display = "none";
		}
	}
}

