<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	function maxLengthCheck(maxSize, lineSize, obj, remainObj){ 
	 var temp;
	 var f = obj.value.length;
	 var msglen = parseInt(maxSize);
	 var tmpstr = "";
	 var enter = 0;
	 var strlen;

	 if (f == 0)//���� ���� byte �� ���� �ֱ�
	 {  
	  if (remainObj != null)//null �ɼ��� �ƴ� �� �� �����ش�.
	  {
	   remainObj.value = msglen;
	  }  
	 }
	 else{
	  for(k = 0; k < f ; k++){
	   temp = obj.value.charAt(k);

	   if(temp =="\n"){
	    enter++;
	   }
	   if(escape(temp).length > 4)
	    msglen -= 2;
	   else
	    msglen--;
	   
	   if(msglen < 0){
	    alert("�� ���� "+(maxSize*2)+"�� �ѱ� "+maxSize+"�� ���� ���� �� �ֽ��ϴ�.");
	    obj.value = tmpstr;
	    break;
	   }
	   else if (lineSize != null & enter > parseInt(lineSize))// lineSize �ɼ��� nulldl �ƴ� ���� ���
	   {
	    alert("���μ� "+lineSize+"������ ���� �� �����ϴ�.")
	    enter = 0;
	    strlen = tmpstr.length -1;
	    obj.value = tmpstr.substring(0, strlen);
	    break;
	   }
	   else{
	    if (remainObj != null)
	    {
	     remainObj.value = msglen;
	    }      
	    tmpstr += temp;
	   }
	  }  
	 }
	} 
</script>
	 



</head>
<body>
 <textarea name="intro" checkNull="������ �Ұ����� �Է��ϼ���" rows="5" style="width:99%;" onChange="javascript:maxLengthCheck('100', null, this, remain_intro);" onKeyup="javascript:maxLengthCheck('100', null, this, remain_intro);"></textarea>
�ر��ڴ� �ִ� 4000�� ������ �Է��̰����մϴ�                                               �������ڼ���<input type="text" size="8" name="remain_intro" value="100">



</body>
</html>