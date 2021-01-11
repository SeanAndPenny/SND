<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>健康档案调阅日志</title>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="<c:url value="/static/commons/js/echarts/echarts.js"/>"></script>
<script type="text/javascript">
function chart01(id,moth,values){
	var myChart=echarts.init(document.getElementById(id));
	var option = {
		    xAxis: {
		        type: 'category',
		        data: moth
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: values,
		        type: 'line'
		    }]
		};
	  myChart.setOption(option);
}


var yljg;
function getData(){
	
	yljg=$("#yljgdm").val();
        layui.use(['table','layer','laydate'] , function(){
            var table = layui.table;
            var laydate=layui.laydate;
            laydate.render({ 
            	  elem: '#startdate' 
            		  ,type: 'month'
            });
            laydate.render({ 
          	  elem: '#enddate' 
          		,type: 'month'
          });
            table.render({
                elem:'#querytable',
                url: '${ctx}/jkdlLog/queryList',
                method:'post',
                where:{p_yljgdm:$("#yljgdm").val(),p_startdate:$("#startdate").val(),p_enddate:$("#enddate").val(),p_ywlx:$("#ywlx").val()},          
                cols: [[
                    {field: 'days', title: '月份', width: '20%'},
                    {field: 'zsum', title: '使用次数', width: '20%'},
                    {field: 'ck', title: '查询次数', width: '15%'},
                    {field: 'dy', title: '调阅次数', width: '15%'},
                    {field: 'tabid', title: '操作',width: '30%', toolbar: '#toolbar'}
                     ]],
                height: '300',
                page: {
                    layout:['count','pre','page','next','skip','limit'],
                    groups:5,
                    first:'首页',
                    last:'尾页',
                    limit:10,
                    limits:[5,10,20]
                },done: function(res, curr, count){
                	var month=new Array();
                	var zsum=new Array();
                	 var nodes=eval(res.data);
 		    		var hh= JSON.stringify(nodes);
 		    		 var xx=JSON.parse(hh);
 		    		
                	for (var i=0;i<xx.length;i++)
                	{
                		month[i]=xx[i].days;
                		zsum[i]=xx[i].zsum;
                	}
                	
                	chart01('map',month,zsum);
                }
            });
        //监听工具条
            table.on('tool(querytab)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
				if (layEvent === 'detail') {
					if(yljg==""||yljg==undefined){
						layer.open({
	        		        type: 2
	        		        ,title: false //不显示标题栏
	        		        ,closeBtn: true
	        		        ,skin: 'demo-class'
	        		        ,area: ['1000px', '530px']
	        		        ,shade: 0.8
	        		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	        		        ,moveType: 1 //拖拽模式，0或者1
	        		        ,content:'${ctx}/jkdlLog/showOne?s_days='+data.days
	        	//			,content:"<div class='wrap' style='margin: 20px'><table class='box' border='0' cellpadding='0' cellspacing='0'	width='100%' height='100%'>	<tbody><tr><td class='main' valign='top'><div class='page'><div name='realcontent' id='us'>	<div class='title'>常见问题解答</div>	<div class='content'><p>	<b>1、机构管理问题</b></p><p>	A、	人力资源库中所有机构信息来源于国家卫生统计信息直报系统的后台接口，如发现有遗漏机构或机构信息不完整的，请至卫统系统内进行新增和修改工作；人力资源库只以卫统后台接口数据为准，所有针对卫统系统内机构的操作，在正常情况下都是隔日更新至人力资源库。<br>	B、	卫统直报系统内新增机构同步到人力资源管理系统中，默认会给所属行政区划的区县管理员、市级管理员、省级管理员分配权限，如新增机构后隔日仍无法看到对应机构（人力资源管理系统中的“机构信息”模块查询），请对应区县管理员单独联系我们处理，特殊问题需要反馈给卫统的厂商进行解决。<br>	C、	目前以卫统直报系统中机构类型为准则，除卫生监督类型机构、诊所、卫生所（卫生室）、医务室、中小学卫生保健所、村卫生室以外，其他机构均可以开启账户。<br>	D、	新增机构进入人力资源库后，可以开启的机构请区县管理员到“账户管理”——“所辖机构管理员”菜单中选择对应机构，点击新增管理员为其开启账号。<br>	E、	诊所、卫生所、医务室、村卫生室等基层单位，我们依据卫统原始代报关系进行维护；原代报单位负责管理对应人员，如无代报单位，由所属区县管理员进行管理，对于个别特殊机构有疑问的，请联系省人事处郭威老师、省卫统信息中心薛成兵主任进行确认，我们根据人事、卫统反馈进行权限调整。<br>	F、	对于部队医院、医学会等特殊单位，无法在卫生统计直报系统中新建同时有需要在人力资源管理系统中使用的，请联系省人事处、省卫统信息中心领导进行确认，我们根据领导反馈内容收集机构信息进行特殊处理。<br>	G、 <font color='red'>管理系统中组织机构代码为旧版的，现在已用社会信用代码，是不是要修改？</font><font color='blue'>目前来说我们人力资源库里的机构信息都是以卫统直报系统为准作为展示，也是方便大家做查看，如果对于数据展示觉得不合理的话可以去做修改，但是对于人员使用来说这个组织机构代码并无影响。</font></p><br><p>	<b>2、人员管理问题</b></p><p>A、	人力资源库中人员信息来源于卫统直报系统、卫生监督系统（医师执业注册）、基层处（好医生）、人事处（职称考试）等多个途径，为了保证数据的全面性、唯一性做了一些清洗、整合工作，所以系统内会有一部分已经退休人员、多身份人员等等；<br>B、	整个系统设计中人员的归属主要依靠机构体现，例如某个管理员能看到某个机构信息，那他一定可以看到这个机构下属的人员，看不到的人员或是归属在其他机构、或是被注销、或是尚未录入本系统；<br>C、	发现机构内缺少人员时，请首先尝试在“注销人员认领”中通过身份证或姓名进行检索，发现目标人员时直接认领（注意：以往人员输入不是很规范的情况下，身份证最后一位的大小写可能错误），在“注销人员认领”模块无法找到的人员在人力资源管理模块中直接新增，如该人员已经存在系统中，新增时候系统会给予提示目前人员所处机构；<br>D、	如发现相关人员并没有在正确的机构，一种方式可以通过原单位进行离岗，正确单位进行认领来切换单位；第二种方式可由机构管理员或区县管理员系统内发起“系统申诉”－“机构变更申诉”，最后由区县管理员确认无误审核通过后，系统会每日夜间自动处理；<br>E、	为保证人力资源库个人身份信息的唯一识别，姓名、身份证件类型、身份证件号码、性别不允许任何人修改，发现错误后个人可以在档案页面发起申诉，由机构管理员或区县管理员通过“个人申诉管理”确认无误审核通过后，系统会每日夜间自动处理；<br>F、	部分业务数据由权威系统对接获得，如人事处的职称信息、医政处的执业注册信息，不允许进行手动修改。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于通过人事处对接获得职称数据，发现错误时可由机构管理员或区县管理员通过“系统申诉”－“职称变更申诉”提交变更请求，省人事处确认无误后，系统会每日夜间自动处理；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;医生、护士的执业信息（资格证书编号、执业证书编号、执业地点、执业注册时间、执业类别、执业范围等信息）通过医师执业注册系统每日对接更新，目前不开放任何修正入口，个人可以修改国家医师注册系统中信息，之后由国家接口同步到人力资源管理系统中，医政处目前也在和国家沟通进行一次全面同步。<br>G、	某些信息个人没法填写，但由于系统要求必填而无法提交，此类信息请区县管理员统一向省人事处反馈，得到确认后我们会对系统进行更新，解除不必要的填写要求；<br>H、	目前系统内各类数据标准选项都是经过各处室讨论，以国标、省标为依据确定的标准选项，如发现遗漏或不合适的选项内容，请区县管理员统一向省人事处反馈，得到确认后我们会对系统进行更新。</p><br><p>	<b>3、账户管理问题</b></p><p>	A、	所有机构账户可由所在区县管理员进行创建、编辑、密码重置等操作（在“账户管理”－“所辖机构管理员”中操作）。<br>	B、	所有个人账户可由所在单位或区县进行创建、编辑、注销、密码重置、信息同步等操作（在“账户管理”－“个人账户管理”中操作）；单位可对机构内人员进行一键账号生成。<br>	C、	区县管理员可在“账户管理”－“行政区划账户管理”内维护管理员信息；机构管理员可在“账户管理”－“管理员信息维护”内维护管理员信息；个人可以在档案页面修改密码。</br>	D、	初始状态下省、市、区县都有账户，2016年7月29日下发的机构账户和区县管理员新创建的机构账户都需要进行激活操作，在此之前都为“待启用”状态，由机构管理员激活后为“已启用”状态；个人账户系统初始时都不存在，区县、机构可以批量生成账户，生成后为“待启用”状态，由个人激活后为“已启用”状态；所有账户连续错误登录状态将被置为“锁定”状态，需由上级管理员解锁或者重置密码方可重新登录。</br>	E、 <font color='red'>身份证已修改，但是个人账户管理里面依旧是错误的身份证号码？</font><font color='blue'>最初创建个人账号时是以身份证为初始登录名，个人在激活过程中可能改变登录名，或者个人通过申诉修改了身份证（此操作不改变登录名和密码），后面管理员可以通过“账户管理”－“个人账号管理”中同步操作将个人最新身份证号同步为登录名。</font></br>	F、 <font color='red'>个人账号创建时重复如何处理？</font><font color='blue'>管理员创建个人账户时发现登录名已存在的，“账户管理”－“个人账户管理”中提供注销功能，可以由双方管理员协调后选择一个注销不用，然后重新创建账号使用（此操作不影响档案数据，只针对账户）。</font></br>	G、 <font color='red'>个人首次登陆身份证校验不通过（最后一位校验错误）？</font><font color='blue'>个人启用账户时校验不通过的，可以由管理员在个人账户里帮忙编辑，因为此类校验是公安部的身份证体系，不能随意取消，机构管理员的编辑我们默认是审核有效的，可以不做强校验。其他功能点的身份校验也有类似问题，我们核对多个问题后发现主要是操作人员的失误，错误的填写了年份、月份之类的，这边也给大家提供一个在线检验地址：<a href='http://idcard.911cha.com' target='_blank'>http://idcard.911cha.com</a>，如果上面通过验证了我们系统无法提交的可以联系我们处理。</font></p><br><p>	<b>4、管理对象问题</b></p><p>	A、	人力资源管理系统的管理对象是针对所有在岗人员，不只管理医、药、护、技。</br>	B、	<font color='red'>外聘的驾驶员、收费员、婴儿泳疗人员要录入吗？</font><font color='blue'>不需要。</font></br>	C、	<font color='red'>编外的行政、财务、后勤也都要录入吧？</font><font color='blue'>需要。</font></br>	D、	<font color='red'>在外单位注册，在本单位发工资的人员信息还在本单位维护吧？</font><font color='blue'>由工资关系所在单位进行维护。</font></br>	E、	<font color='red'>工资是填实发数还是应发数？</font><font color='blue'>工资填写应发数。</font></br>	F、	<font color='red'>编制单位与注册单位不一致的，以哪个单位来填报？</font><font color='blue'>以编制单位为准。</font></br>	G、	<font color='red'>工业卫生协会相关单位人员要不要录入？</font><font color='blue'>如果不涉及今后的职称等问题，且不在我们管辖范围内的，可以不录入。</font></br>	H、 <font color='red'>借用人员怎么管理？</font><font color='blue'>借用人员由编制、工资所在单位进行管理。</font></br>	I、 <font color='red'>计划生育指导站，戒毒所医院是否录入？</font><font color='blue'>公务员和参公统一不录入，计划生育指导站如果没有参公，仍然是事业单位且涉及职称评聘的，请录入。</font></br>	J、 <font color='red'>合作医疗管理办公室、卫校已经分出卫生系统，但他们有不少卫技人员，升职称还是升的卫技，他们应该怎么填报？</font><font color='blue'>合管办、卫校如果不在我们卫生系统，可以不填，有卫技人员的，请单位通知他们在注册机构填报。</font></br>	<b>管理范围说明：省、市、县级卫生计生行政机构、卫生监督机构人员为公务员管理系统，暂不列入管理范围；省、市、区县计划生育协会是参公管理单位，暂不列入管理范围，事业单位在管理范围。</b></p><br><p>	<b>5、信息编辑问题</b></p><p>	A、 <font color='red'>信息无法编辑或已审核通过，不能操作了？</font><font color='blue'>所有背景信息（除对接获得的职称信息），已经通过审核的都可以由机构或区县管理员在“信息审核”－“人力资源信息审核”模块退回（选择对应记录后点击审核，在弹出页面编辑审核状态，设置为非“审核通过”后保存），再由个人进行编辑操作。</font><br>	B、 <font color='red'>初次进系统就显示有已审核的是什么数据？</font><font color='blue'>初入系统就有已审核通过的数据是之前系统后台对接的，例如人事初对接的职称之类。</font><br>	C、 <font color='red'>部分医生、护士没有对应的医师资格证书编码与医师执业证书编码，如何处理？</font><font color='blue'>对于已经获得证书很多年的医师，可以通过绑定曾用身份证信息，来提高后台数据对接的成功率，获得相关证据号码，具体操作方法请区县管理员分享群文件《历史证件绑定说明》；对于刚刚毕业的尚未取得证书，或者刚刚考试通过无法通过系统对接的，可以暂时搁置，等待信息完善。</font><br>	D、 <font color='red'>业务人员没有教育相关的证件证明怎么办？</font><font color='blue'>对于高中及以下学历的人员可以不选择专业、不上传相关的证件进行信息提交；对于高中以上学历的人员必须要提供相关的证件证明。</font><br>	E、 <font color='red'>人员开始工作日期如何填写？</font><font color='blue'>合同制人员的试用期有约定的按约定，没有约定的按合同时间算；在编人员的进单位时间按照人社局核编的时间计算。</font><br/>	F、 <font color='red'>个人年度考核与医师定期考核的区别？</font><font color='blue'>个人年度考核是针对所有人员在单位内部考核结果的录入，人事处后期会利用这些数据进行分析并作为职称评审依据；以上信息在个人档案页面背景信息最后一个模块查看。</font><br>	G、 医师定期考核只针对执业医师和执业助理医师，目前只需要从2015-2016的定期考核结果开始录入即可，以上信息在“医师定期考核”模块。<br>	H、 <font color='red'>个人年度考核有要求哪一年吗？</font><font color='blue'>个人年度考核初步要求为近五年数据，其他背景信息类似（论文、培训、奖励），奖励要求县级及以上奖励。</font><br></p><br><p>	<b>6、身份证问题汇总</b></p><p>A、 个人发现身份证错误，在系统内提起申诉进行号码修改；<br>	B、 如需要修改的身份证号码提示在其他机构已存在，有以下几种方式解决：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a、机构、区县管理员通过“人力资源”－“注销人员认领”，搜索到正确身份证号码后纳入正确管理范围，实时生效；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b、机构、区县管理员通过“系统申诉”－“机构变更申诉”，将正确人员归于本单位管理范围内（需要所属区县管理员审核），管理员审核通过后系统每日夜间自动处理；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c、机构、区县管理员通过“系统申诉”－“身份证置换管理”，将该人员与正确身份证人员进行互换（需要双方区县管理员审核），管理员审核通过后系统每日夜间自动处理；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a类方式主要解决部分人员已离岗，尚未认领时，又被以错误身份证新增入系统，此时推荐a解决；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b类方式主要解决个人信息滞后，系统内仍在其他单位在岗，对方单位管理员尚未开展核对工作或无法取得联系，此时推荐b解决；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c类方式主要解决系统内一人多身份证信息，其中错误身份证关联信息较多时，通过置换使得正确身份证与当前信息进行关联减少重复录入，此时推荐c解决；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有以上认领、申诉、置换都是基于对身份证信息确认的前提，请大家仔细核对身份证号码。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>身份证问题常见处理1-机构变更如何使用？</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A、 “系统申诉”-“机构变更”，输入您要认领人员的姓名或身份证号码或现所在机构名称进行查询，页面中就会显示出符合条件的人员。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B、 选择目的机构（即认领人员的正确机构），勾选您要认领的人员，点击提交，提交完成后页面会跳入机构变更确认页面，该页面会显示出机构所要的认领人员信息，此时机构变更申报完成。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C、 “系统申诉”-“机构变更确认”中的处理按钮只针对区县管理员开放，其他人员可以查看,等相应区县管理员审核通过同意认领时，在管理员确认的当天晚上会更新数据，完成机构认领人员。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>身份证问题常见处理2-身份证置换如何使用？</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A、 机构管理员、区县管理员通过“系统申诉”-“身份证置换申请”提出置换申请，其中发起人必须为管理员可以进行管理的正常人员；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B、 置换发起后由双方人员所在区县的管理员依次审核（“系统申诉”-“身份证置换确认”）；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C、 审核通过后系统每天夜间自动执行更新（本地区两人置换或者本地区与注销人员置换仅需一次审核）。</p><br><p>	<b>7、上传导入问题</b></p><p>	A、	目前已发现的附件无法上传、无法保存信息的主要原因是浏览器兼容性问题导致，本系统推荐使用最新的谷歌浏览器，以获得更好体验；如在此类浏览器下仍有问题发生，请区县管理员进行反馈处理；<br>	B、	Excel导入过程中请大家确保信息的唯一性，例如人员基本信息导入，如果存在两条一模一样的身份证，会提示导入冲突无法完成操作；<br>	C、	导入操作完成后提示导入冲突的表示系统中已有相同人员信息，例如系统中已有张三的基本信息，再次通过Excel批量导入时就会提示导入冲突，但是此提醒并不影响已有数据，其他不冲突数据也不会受到影响。<br>	D、	<font color='red'>导入为什么会报错？</font><font color='blue'>为了方便大家操作，部分信息录入提供了Excel导入功能，导入过程中请严格依据模版说明和数据选项说明进行填写（均可在通知公告中下载），确保数据能得到正确处理，对应的模版和数据选项说明我们会及时更新，尽可能减少大家的工作量；</font><br>	E、	<font color='red'>附件上传的照片应该什么格式多大？</font><font color='blue'>附件上传的照片常见图片格式与PDF都可以，大小1M以内。</font><br>	F、	<font color='red'>工作经历证明附件是什么？</font><font color='blue'>工作经历证明附件是指聘书，不过此项非比填项。</font><br></p><br><p>	<b>8、职称申报问题</b></p><p>	A、	个人通过职称申报对外入口的身份证校验进行入口判断，身份证存在于人力资源管理系统的联系本单位或区县管理员获取账户，身份证不存在于人力资源管理系统中的直接在职称申报系统注册；<br>	B、	人力资源管理系统的部分个人信息会推送至职称申报系统作为申报内容，请在“职称申报复核”页面做信息审核确认；由于推送至申报系统时会将对应的数据项进行覆盖，所以建议完整补充人力资源管理系统数据后再至职称申报系统编辑，避免重复劳动；请注意人力资源管理系统的数据需要在“职称申报复核”点击保存按钮才可以推送至职称申报系统<br>	C、	信息不可编辑问题主要分为3类：执业信息不可编辑，请参考问题2F，此类数据推送至申报系统还可以继续编辑，不影响个人申报；职称信息不可编辑，请参考问题2F，此类数据目前删除申请不需要省人事处审核；背景信息不可编辑，请参考问题5A。<br>	D、	上一年度没有做卫生统计年度上报不会影响2017年职称评审。<br>	E、	所有个人申诉问题一定是管理员审核通过后系统才会在当天夜里自动更新，第二天生效。<br>	F、	归档人员都可以在注销认领模块重新领回管理。<br>	G、	机构信息编辑问题请至卫生统计直报系统修改并咨询相关工程师。<br>	G、	职称申报本身业务问题或者系统使用问题请至江苏省卫生高级专业技术资格申报系统中咨询相关工程师。<br></p><br>	</div></div>	</div>	</td></tr>	</tbody></table>	</div>"
	        		        ,yes: function(index, layero){
	        				   layer.close(index);
	          				}      
	              		});
					}else{
					
						
						layer.open({
	        		        type: 2
	        		        ,title: false //不显示标题栏
	        		        ,closeBtn: true
	        		        ,skin: 'demo-class'
	        		        ,area: ['1000px', '530px']
	        		        ,shade: 0.8
	        		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	        		        ,moveType: 1 //拖拽模式，0或者1
	        		        ,content:'${ctx}/jkdlLog/showOne?s_yljg='+yljg+'&s_days='+data.days
	        	//			,content:"<div class='wrap' style='margin: 20px'><table class='box' border='0' cellpadding='0' cellspacing='0'	width='100%' height='100%'>	<tbody><tr><td class='main' valign='top'><div class='page'><div name='realcontent' id='us'>	<div class='title'>常见问题解答</div>	<div class='content'><p>	<b>1、机构管理问题</b></p><p>	A、	人力资源库中所有机构信息来源于国家卫生统计信息直报系统的后台接口，如发现有遗漏机构或机构信息不完整的，请至卫统系统内进行新增和修改工作；人力资源库只以卫统后台接口数据为准，所有针对卫统系统内机构的操作，在正常情况下都是隔日更新至人力资源库。<br>	B、	卫统直报系统内新增机构同步到人力资源管理系统中，默认会给所属行政区划的区县管理员、市级管理员、省级管理员分配权限，如新增机构后隔日仍无法看到对应机构（人力资源管理系统中的“机构信息”模块查询），请对应区县管理员单独联系我们处理，特殊问题需要反馈给卫统的厂商进行解决。<br>	C、	目前以卫统直报系统中机构类型为准则，除卫生监督类型机构、诊所、卫生所（卫生室）、医务室、中小学卫生保健所、村卫生室以外，其他机构均可以开启账户。<br>	D、	新增机构进入人力资源库后，可以开启的机构请区县管理员到“账户管理”——“所辖机构管理员”菜单中选择对应机构，点击新增管理员为其开启账号。<br>	E、	诊所、卫生所、医务室、村卫生室等基层单位，我们依据卫统原始代报关系进行维护；原代报单位负责管理对应人员，如无代报单位，由所属区县管理员进行管理，对于个别特殊机构有疑问的，请联系省人事处郭威老师、省卫统信息中心薛成兵主任进行确认，我们根据人事、卫统反馈进行权限调整。<br>	F、	对于部队医院、医学会等特殊单位，无法在卫生统计直报系统中新建同时有需要在人力资源管理系统中使用的，请联系省人事处、省卫统信息中心领导进行确认，我们根据领导反馈内容收集机构信息进行特殊处理。<br>	G、 <font color='red'>管理系统中组织机构代码为旧版的，现在已用社会信用代码，是不是要修改？</font><font color='blue'>目前来说我们人力资源库里的机构信息都是以卫统直报系统为准作为展示，也是方便大家做查看，如果对于数据展示觉得不合理的话可以去做修改，但是对于人员使用来说这个组织机构代码并无影响。</font></p><br><p>	<b>2、人员管理问题</b></p><p>A、	人力资源库中人员信息来源于卫统直报系统、卫生监督系统（医师执业注册）、基层处（好医生）、人事处（职称考试）等多个途径，为了保证数据的全面性、唯一性做了一些清洗、整合工作，所以系统内会有一部分已经退休人员、多身份人员等等；<br>B、	整个系统设计中人员的归属主要依靠机构体现，例如某个管理员能看到某个机构信息，那他一定可以看到这个机构下属的人员，看不到的人员或是归属在其他机构、或是被注销、或是尚未录入本系统；<br>C、	发现机构内缺少人员时，请首先尝试在“注销人员认领”中通过身份证或姓名进行检索，发现目标人员时直接认领（注意：以往人员输入不是很规范的情况下，身份证最后一位的大小写可能错误），在“注销人员认领”模块无法找到的人员在人力资源管理模块中直接新增，如该人员已经存在系统中，新增时候系统会给予提示目前人员所处机构；<br>D、	如发现相关人员并没有在正确的机构，一种方式可以通过原单位进行离岗，正确单位进行认领来切换单位；第二种方式可由机构管理员或区县管理员系统内发起“系统申诉”－“机构变更申诉”，最后由区县管理员确认无误审核通过后，系统会每日夜间自动处理；<br>E、	为保证人力资源库个人身份信息的唯一识别，姓名、身份证件类型、身份证件号码、性别不允许任何人修改，发现错误后个人可以在档案页面发起申诉，由机构管理员或区县管理员通过“个人申诉管理”确认无误审核通过后，系统会每日夜间自动处理；<br>F、	部分业务数据由权威系统对接获得，如人事处的职称信息、医政处的执业注册信息，不允许进行手动修改。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于通过人事处对接获得职称数据，发现错误时可由机构管理员或区县管理员通过“系统申诉”－“职称变更申诉”提交变更请求，省人事处确认无误后，系统会每日夜间自动处理；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;医生、护士的执业信息（资格证书编号、执业证书编号、执业地点、执业注册时间、执业类别、执业范围等信息）通过医师执业注册系统每日对接更新，目前不开放任何修正入口，个人可以修改国家医师注册系统中信息，之后由国家接口同步到人力资源管理系统中，医政处目前也在和国家沟通进行一次全面同步。<br>G、	某些信息个人没法填写，但由于系统要求必填而无法提交，此类信息请区县管理员统一向省人事处反馈，得到确认后我们会对系统进行更新，解除不必要的填写要求；<br>H、	目前系统内各类数据标准选项都是经过各处室讨论，以国标、省标为依据确定的标准选项，如发现遗漏或不合适的选项内容，请区县管理员统一向省人事处反馈，得到确认后我们会对系统进行更新。</p><br><p>	<b>3、账户管理问题</b></p><p>	A、	所有机构账户可由所在区县管理员进行创建、编辑、密码重置等操作（在“账户管理”－“所辖机构管理员”中操作）。<br>	B、	所有个人账户可由所在单位或区县进行创建、编辑、注销、密码重置、信息同步等操作（在“账户管理”－“个人账户管理”中操作）；单位可对机构内人员进行一键账号生成。<br>	C、	区县管理员可在“账户管理”－“行政区划账户管理”内维护管理员信息；机构管理员可在“账户管理”－“管理员信息维护”内维护管理员信息；个人可以在档案页面修改密码。</br>	D、	初始状态下省、市、区县都有账户，2016年7月29日下发的机构账户和区县管理员新创建的机构账户都需要进行激活操作，在此之前都为“待启用”状态，由机构管理员激活后为“已启用”状态；个人账户系统初始时都不存在，区县、机构可以批量生成账户，生成后为“待启用”状态，由个人激活后为“已启用”状态；所有账户连续错误登录状态将被置为“锁定”状态，需由上级管理员解锁或者重置密码方可重新登录。</br>	E、 <font color='red'>身份证已修改，但是个人账户管理里面依旧是错误的身份证号码？</font><font color='blue'>最初创建个人账号时是以身份证为初始登录名，个人在激活过程中可能改变登录名，或者个人通过申诉修改了身份证（此操作不改变登录名和密码），后面管理员可以通过“账户管理”－“个人账号管理”中同步操作将个人最新身份证号同步为登录名。</font></br>	F、 <font color='red'>个人账号创建时重复如何处理？</font><font color='blue'>管理员创建个人账户时发现登录名已存在的，“账户管理”－“个人账户管理”中提供注销功能，可以由双方管理员协调后选择一个注销不用，然后重新创建账号使用（此操作不影响档案数据，只针对账户）。</font></br>	G、 <font color='red'>个人首次登陆身份证校验不通过（最后一位校验错误）？</font><font color='blue'>个人启用账户时校验不通过的，可以由管理员在个人账户里帮忙编辑，因为此类校验是公安部的身份证体系，不能随意取消，机构管理员的编辑我们默认是审核有效的，可以不做强校验。其他功能点的身份校验也有类似问题，我们核对多个问题后发现主要是操作人员的失误，错误的填写了年份、月份之类的，这边也给大家提供一个在线检验地址：<a href='http://idcard.911cha.com' target='_blank'>http://idcard.911cha.com</a>，如果上面通过验证了我们系统无法提交的可以联系我们处理。</font></p><br><p>	<b>4、管理对象问题</b></p><p>	A、	人力资源管理系统的管理对象是针对所有在岗人员，不只管理医、药、护、技。</br>	B、	<font color='red'>外聘的驾驶员、收费员、婴儿泳疗人员要录入吗？</font><font color='blue'>不需要。</font></br>	C、	<font color='red'>编外的行政、财务、后勤也都要录入吧？</font><font color='blue'>需要。</font></br>	D、	<font color='red'>在外单位注册，在本单位发工资的人员信息还在本单位维护吧？</font><font color='blue'>由工资关系所在单位进行维护。</font></br>	E、	<font color='red'>工资是填实发数还是应发数？</font><font color='blue'>工资填写应发数。</font></br>	F、	<font color='red'>编制单位与注册单位不一致的，以哪个单位来填报？</font><font color='blue'>以编制单位为准。</font></br>	G、	<font color='red'>工业卫生协会相关单位人员要不要录入？</font><font color='blue'>如果不涉及今后的职称等问题，且不在我们管辖范围内的，可以不录入。</font></br>	H、 <font color='red'>借用人员怎么管理？</font><font color='blue'>借用人员由编制、工资所在单位进行管理。</font></br>	I、 <font color='red'>计划生育指导站，戒毒所医院是否录入？</font><font color='blue'>公务员和参公统一不录入，计划生育指导站如果没有参公，仍然是事业单位且涉及职称评聘的，请录入。</font></br>	J、 <font color='red'>合作医疗管理办公室、卫校已经分出卫生系统，但他们有不少卫技人员，升职称还是升的卫技，他们应该怎么填报？</font><font color='blue'>合管办、卫校如果不在我们卫生系统，可以不填，有卫技人员的，请单位通知他们在注册机构填报。</font></br>	<b>管理范围说明：省、市、县级卫生计生行政机构、卫生监督机构人员为公务员管理系统，暂不列入管理范围；省、市、区县计划生育协会是参公管理单位，暂不列入管理范围，事业单位在管理范围。</b></p><br><p>	<b>5、信息编辑问题</b></p><p>	A、 <font color='red'>信息无法编辑或已审核通过，不能操作了？</font><font color='blue'>所有背景信息（除对接获得的职称信息），已经通过审核的都可以由机构或区县管理员在“信息审核”－“人力资源信息审核”模块退回（选择对应记录后点击审核，在弹出页面编辑审核状态，设置为非“审核通过”后保存），再由个人进行编辑操作。</font><br>	B、 <font color='red'>初次进系统就显示有已审核的是什么数据？</font><font color='blue'>初入系统就有已审核通过的数据是之前系统后台对接的，例如人事初对接的职称之类。</font><br>	C、 <font color='red'>部分医生、护士没有对应的医师资格证书编码与医师执业证书编码，如何处理？</font><font color='blue'>对于已经获得证书很多年的医师，可以通过绑定曾用身份证信息，来提高后台数据对接的成功率，获得相关证据号码，具体操作方法请区县管理员分享群文件《历史证件绑定说明》；对于刚刚毕业的尚未取得证书，或者刚刚考试通过无法通过系统对接的，可以暂时搁置，等待信息完善。</font><br>	D、 <font color='red'>业务人员没有教育相关的证件证明怎么办？</font><font color='blue'>对于高中及以下学历的人员可以不选择专业、不上传相关的证件进行信息提交；对于高中以上学历的人员必须要提供相关的证件证明。</font><br>	E、 <font color='red'>人员开始工作日期如何填写？</font><font color='blue'>合同制人员的试用期有约定的按约定，没有约定的按合同时间算；在编人员的进单位时间按照人社局核编的时间计算。</font><br/>	F、 <font color='red'>个人年度考核与医师定期考核的区别？</font><font color='blue'>个人年度考核是针对所有人员在单位内部考核结果的录入，人事处后期会利用这些数据进行分析并作为职称评审依据；以上信息在个人档案页面背景信息最后一个模块查看。</font><br>	G、 医师定期考核只针对执业医师和执业助理医师，目前只需要从2015-2016的定期考核结果开始录入即可，以上信息在“医师定期考核”模块。<br>	H、 <font color='red'>个人年度考核有要求哪一年吗？</font><font color='blue'>个人年度考核初步要求为近五年数据，其他背景信息类似（论文、培训、奖励），奖励要求县级及以上奖励。</font><br></p><br><p>	<b>6、身份证问题汇总</b></p><p>A、 个人发现身份证错误，在系统内提起申诉进行号码修改；<br>	B、 如需要修改的身份证号码提示在其他机构已存在，有以下几种方式解决：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a、机构、区县管理员通过“人力资源”－“注销人员认领”，搜索到正确身份证号码后纳入正确管理范围，实时生效；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b、机构、区县管理员通过“系统申诉”－“机构变更申诉”，将正确人员归于本单位管理范围内（需要所属区县管理员审核），管理员审核通过后系统每日夜间自动处理；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c、机构、区县管理员通过“系统申诉”－“身份证置换管理”，将该人员与正确身份证人员进行互换（需要双方区县管理员审核），管理员审核通过后系统每日夜间自动处理；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a类方式主要解决部分人员已离岗，尚未认领时，又被以错误身份证新增入系统，此时推荐a解决；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b类方式主要解决个人信息滞后，系统内仍在其他单位在岗，对方单位管理员尚未开展核对工作或无法取得联系，此时推荐b解决；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c类方式主要解决系统内一人多身份证信息，其中错误身份证关联信息较多时，通过置换使得正确身份证与当前信息进行关联减少重复录入，此时推荐c解决；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所有以上认领、申诉、置换都是基于对身份证信息确认的前提，请大家仔细核对身份证号码。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>身份证问题常见处理1-机构变更如何使用？</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A、 “系统申诉”-“机构变更”，输入您要认领人员的姓名或身份证号码或现所在机构名称进行查询，页面中就会显示出符合条件的人员。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B、 选择目的机构（即认领人员的正确机构），勾选您要认领的人员，点击提交，提交完成后页面会跳入机构变更确认页面，该页面会显示出机构所要的认领人员信息，此时机构变更申报完成。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C、 “系统申诉”-“机构变更确认”中的处理按钮只针对区县管理员开放，其他人员可以查看,等相应区县管理员审核通过同意认领时，在管理员确认的当天晚上会更新数据，完成机构认领人员。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>身份证问题常见处理2-身份证置换如何使用？</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A、 机构管理员、区县管理员通过“系统申诉”-“身份证置换申请”提出置换申请，其中发起人必须为管理员可以进行管理的正常人员；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B、 置换发起后由双方人员所在区县的管理员依次审核（“系统申诉”-“身份证置换确认”）；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C、 审核通过后系统每天夜间自动执行更新（本地区两人置换或者本地区与注销人员置换仅需一次审核）。</p><br><p>	<b>7、上传导入问题</b></p><p>	A、	目前已发现的附件无法上传、无法保存信息的主要原因是浏览器兼容性问题导致，本系统推荐使用最新的谷歌浏览器，以获得更好体验；如在此类浏览器下仍有问题发生，请区县管理员进行反馈处理；<br>	B、	Excel导入过程中请大家确保信息的唯一性，例如人员基本信息导入，如果存在两条一模一样的身份证，会提示导入冲突无法完成操作；<br>	C、	导入操作完成后提示导入冲突的表示系统中已有相同人员信息，例如系统中已有张三的基本信息，再次通过Excel批量导入时就会提示导入冲突，但是此提醒并不影响已有数据，其他不冲突数据也不会受到影响。<br>	D、	<font color='red'>导入为什么会报错？</font><font color='blue'>为了方便大家操作，部分信息录入提供了Excel导入功能，导入过程中请严格依据模版说明和数据选项说明进行填写（均可在通知公告中下载），确保数据能得到正确处理，对应的模版和数据选项说明我们会及时更新，尽可能减少大家的工作量；</font><br>	E、	<font color='red'>附件上传的照片应该什么格式多大？</font><font color='blue'>附件上传的照片常见图片格式与PDF都可以，大小1M以内。</font><br>	F、	<font color='red'>工作经历证明附件是什么？</font><font color='blue'>工作经历证明附件是指聘书，不过此项非比填项。</font><br></p><br><p>	<b>8、职称申报问题</b></p><p>	A、	个人通过职称申报对外入口的身份证校验进行入口判断，身份证存在于人力资源管理系统的联系本单位或区县管理员获取账户，身份证不存在于人力资源管理系统中的直接在职称申报系统注册；<br>	B、	人力资源管理系统的部分个人信息会推送至职称申报系统作为申报内容，请在“职称申报复核”页面做信息审核确认；由于推送至申报系统时会将对应的数据项进行覆盖，所以建议完整补充人力资源管理系统数据后再至职称申报系统编辑，避免重复劳动；请注意人力资源管理系统的数据需要在“职称申报复核”点击保存按钮才可以推送至职称申报系统<br>	C、	信息不可编辑问题主要分为3类：执业信息不可编辑，请参考问题2F，此类数据推送至申报系统还可以继续编辑，不影响个人申报；职称信息不可编辑，请参考问题2F，此类数据目前删除申请不需要省人事处审核；背景信息不可编辑，请参考问题5A。<br>	D、	上一年度没有做卫生统计年度上报不会影响2017年职称评审。<br>	E、	所有个人申诉问题一定是管理员审核通过后系统才会在当天夜里自动更新，第二天生效。<br>	F、	归档人员都可以在注销认领模块重新领回管理。<br>	G、	机构信息编辑问题请至卫生统计直报系统修改并咨询相关工程师。<br>	G、	职称申报本身业务问题或者系统使用问题请至江苏省卫生高级专业技术资格申报系统中咨询相关工程师。<br></p><br>	</div></div>	</div>	</td></tr>	</tbody></table>	</div>"
	        		        ,yes: function(index, layero){
	        				   layer.close(index);
	          				}      
	              		});
					}
					
		
				}
			});
        });
    }
    
	$(document).ready(function(){
		getData();
	});
		
	function search() {
        getData();
    }
</script>
</head>
<body style="background: #F9F9F9;overflow:scroll;overflow-y:hidden" >
	<div id="queryform" class="layui-form" style="background: #FFFFFF;" >
		<table style="width: 100%">
			<tr>
			
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">开始时间</label>
						<div class="layui-input-inline input3">
							<input type="text" id="startdate" name="startdate"  autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">结束时间</label>
						<div class="layui-input-inline input3"> 
						<input type="text" id="enddate" name="enddate" autocomplete="off"
								class="layui-input .input2">
						</div>
					</div>
				</td>
				
			</tr>
			
			<tr>
				<td style="width: 33.3%" >
					<div class="layui-form-item" style="margin-top: 20px;">
						<label class="layui-form-label label3">机构名称</label>
						<div class="layui-input-inline input3">
							<select id="yljgdm" name="yljgdm" lay-search>
								<option value="">医疗机构</option>
								<c:forEach items="${jgList}" var="jg">
									<option value="${jg.jgdm}">${jg.jgmc}</option>
								</c:forEach>
							</select>	
						</div>
					</div>
					
				</td>
				<td style="width: 33.3%">
					<div class="layui-form-item">
						<label class="layui-form-label label3">调阅类型</label>
						<div class="layui-input-inline ">
							<select id="ywlx" name="ywlx" lay-search>
							<option value="">调阅类型</option>
							<option value="1">调阅</option>
							<option value="2">查看</option>
						</select>
						</div>
					</div>
<!-- 				</td> -->
			
				<td>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" onclick="search();">查询</button>
						</div>
					</div>
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
		</table>
		
	</div>
	<div id="map" style="height:200px;width:100%;">
	</div>
	<div style="width:100%;background: #FFFFFF;margin:25px auto;">
		 <table id="querytable" class="layui-table" lay-filter="querytab" style="margin:-10px;"></table>
			<div id="laypage"></div>
	</div>

</body>
<script type="text/html" id="toolbar">
  	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">明细</a>
</script>
</html>