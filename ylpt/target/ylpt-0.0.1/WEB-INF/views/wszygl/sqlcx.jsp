<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
  <script type="text/javascript"
  src="<c:url value="/static/commons/js/echarts/echarts-liquidfill.js"/>"></script>
<!DOCTYPE html>
<html>
<head>
<title>SQL语句查询</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>

<script type="text/javascript"> 


jQuery(function(){  
      //使用id选择器;例如:tab对象->tr->td对象.  
     $("#jtystj2   td").each(function(i){  
          //获取td当前对象的文本,如果长度大于25;  
          if($(this).text().length>6){  
                 //给td设置title属性,并且设置td的完整值.给title属性.  
     $(this).attr("title",$(this).text());  
                 //获取td的值,进行截取。赋值给text变量保存.  
     var text=$(this).text().substring(0,6)+"...";  
                 //重新为td赋值;  
                 $(this).text(text);  
          }  
       });  
  }); 


  function  sqlxc(){  
    
    $.ajax({
        url: "${ctx}/sqlcx/sqlyjcx.json?p_sqlbk="+$("#sqlbk").val(),
         datatype:"json",
        context: document.body, 
        success: function(data){
          
          var nodes=eval(data);
           var hh= JSON.stringify(nodes);
           var xx=JSON.parse(hh);
            var fianl=xx.sqlList; 
            var list1=xx.list1;
            var list2=xx.list2;
            var $tbl = $("#jtystj");
            $tbl.empty();
            var $tb2 = $("#sql2");
            $tb2.empty();
            
             
               for (var i=0;i<list1.length;i++) { 
                  $tbl.append( '<td  nowrap="nowrap" style="width: 250px;">'
                        
                     +list1[i].key 
                         
                        +'</td>'  
                        
                       );
                  
                  
                 
                
               }           
           
             
               for (var j=0;j<list2.length;j++) { 
            	   
            	  
		    		 if((j)%list1.length==0){
		    			 
		    			 $tbl.append('<tbody> <tr>'); 
		    		 }
		    	     $tbl.append(   '<td style="width: 60%;">'
		    	     +'<span style="color: #0088A8; font-weight: bold; ">'
		    	     +list2[j].value
		    	     +'</span>'
		    	     +'</td>'
		    	    );
		    	     if((j)%list1.length==0){
		    	    	 $tbl.append('</tbody> </tr>');
		    		 }
                          
            }
  }
}); 
   
    }
 
</script>
<style type="text/css">
.comments {
 width:100%;/*自动适应父布局宽度*/
 overflow:auto;
 word-break:break-all;
}
</style>
</head>
<body style="background: #F9F9F9;overflow:scroll;" >
  <div class="layui-form-item">
    <div class="layui-input-block"style="margin-left: 1169px;    margin-top: 29px;">
      <button class="layui-btn" onclick="sqlxc();">SQL语句查询</button>
    </div>
  </div>
  <div style="margin-left: 10px;">
    SQL语句查询表框：
    <textarea class="comments" rows="10" cols="10" id="sqlbk"></textarea>
  </div>

   <div style="width: 100%; background: #FFFFFF; margin: 25px auto;">
    <table id="jtystj" class="layui-table" lay-filter="querytable"
      style="margin: -10px;">
       
      </table>
     
  </div>
   <div style="width: 100%; background: #FFFFFF; ">
    <table class="table quick-detail" id="sql2">
				 
			</table>
     
  </div>

</body>
 
</html>