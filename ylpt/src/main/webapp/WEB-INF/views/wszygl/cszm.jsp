<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>出生医学证明详细</title>

<script type="text/javascript" src="js/changeTH.js"></script>
<style type="text/css">
html, body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.box-content {
  background-image: url("../static/commons/images/cszm.jpg");
  background-repeat: no-repeat;
  background-position:center center;
  background-size: 100% 100%;
  margin-left: auto;
  margin-right: auto;
  /*并非真的会出现滚动条 而是防止子元素的外边距和这个元素合并*/
  overflow: hidden;
}

td {
  font-family: "SimSun" !important;
  position: relative;
}

.box-top {
  margin-top: 18%;
  height: 17%;
  width: 85%;
  margin-left: 7%;
}

.box-top-content {
  width: 100%;
  height: 100%;
  border-collapse: collapse;
  table-layout: fixed;
  /*       white-space: nowrap; */
}

.box-top-content td {
  height: 16.7%;
  text-align: center;
  vertical-align: middle;
}

.box-middle-1 {
  margin-top: 3%;
  height: 12%;
  width: 85%;
  margin-left: 7%;
  /*     white-space: nowrap; */
}

.box-middle-2 {
  margin-top: 2%;
  height: 12%;
  width: 85%;
  margin-left: 7%;
  /*     white-space: nowrap; */
}

.box-middle-content {
  width: 100%;
  height: 100%;
  border-collapse: collapse;
  table-layout: fixed;
}

.box-middle-content td {
  height: 16.7%;
  text-align: center;
  vertical-align: middle;
}

.box-bottom-left {
  margin-top: 4.5%;
  width: 33%;
  margin-left: 7%;
  height: 11%;
  display: inline-block;
}

.box-bottom-left-content {
  width: 100%;
  height: 100%;
  border-collapse: collapse;
  table-layout: fixed;
}

.box-bottom-left-content td {
  height: 16.7%;
  text-align: center;
  vertical-align: middle;
}

.box-bottom-right {
  width: 17%;
  margin-left: 30.5%;
  height: 9%;
  display: inline-block;
}

.box-bottom-right {
  text-align: center;
  vertical-align: middle;
  color: red;
  font-size: 18px;
}

.wrap-box {
  position: absolute;
  top: 0px;
  left: 0px;
}

.div-content {
  position: relative;
}

.box-back {
  height: 5%;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  padding-left: 1%;
}
</style>
</head>

<body style="background-color: #ffffff;">
  <div class="div-page" style="padding: 0; height: 100%;">
  
    <div class="div-content" style="height: 100%;">
      <div class="box-back"> 
      </div>
      <div class="box-content" id="box-content" style="width:832px;height:631px" >
        <div class="box-top">
          
          <table class="box-top-content">
            <tr>
              <td colspan="4"></td>
              <td colspan="11">${cszmVO.XM }</td>
              <td colspan="2"></td>
              <td colspan="2">${cszmVO.XB }</td>
              <td colspan="4"></td>
              <td colspan="5">${cszmVO.NN }</td>
              <td></td>
              <td colspan="2">${cszmVO.YY }</td>
              <td></td>
              <td colspan="2">${cszmVO.RR }</td>
              <td></td>
              <td colspan="2">${cszmVO.SS }</td>
              <td></td>
              <td colspan="2">${cszmVO.FF }</td>
              <td></td>
            </tr>
            <tr>
              <td colspan="4"></td>
              <td colspan="11"></td>
              <td colspan="2"></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="5"></td>
              <td></td>
              <td colspan="2"></td>
              <td></td>
              <td colspan="2"></td>
              <td></td>
              <td colspan="2"></td>
              <td></td>
              <td colspan="2"></td>
              <td></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="7">${cszmVO.CSYZ }</td>
              <td colspan="2"></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="5">${cszmVO.TZ }</td>
              <td colspan="5"></td>
              <td colspan="3"></td>
              <td colspan="6">${cszmVO.SG }</td>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="7"></td>
              <td colspan="2"></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="5"></td>
              <td colspan="5"></td>
              <td colspan="3"></td>
              <td colspan="6"></td>
              <td colspan="4"></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="5">${cszmVO.SHENG }</td>
              <td colspan="2"></td>
              <td colspan="4">${cszmVO.SHI }</td>
              <td colspan="2"></td>
              <td colspan="5">${cszmVO.QU }</td>
              <td colspan="7"></td>
              <td colspan="13">${cszmVO.JSJG }</td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="5"></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="2"></td>
              <td colspan="5"></td>
              <td colspan="7"></td>
              <td colspan="13"></td>
            </tr>
          </table>
          
        </div>
        <div class="box-middle-1">
          <table class="box-middle-content">
            <tr>
              <td colspan="3"></td>
              <td colspan="7">${cszmVO.MQXM }</td>
              <td colspan="2"></td>
              <td colspan="2">${cszmVO.MQNL }</td>
              <td colspan="2"></td>
              <td colspan="7">${cszmVO.MQGJ }</td>
              <td></td>
              <td colspan="3">${cszmVO.MQMZ }</td>
              <td colspan="2"></td>
              <td colspan="11"><div class="wrap-box">${cszmVO.MQJZDZ }</div></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="7"></td>
              <td colspan="2"></td>
              <td colspan="2"></td>
              <td colspan="2"></td>
              <td colspan="7"></td>
              <td></td>
              <td colspan="3"></td>
              <td colspan="2"></td>
              <td colspan="11"></td>
            </tr>
            <tr>
              <td colspan="10"></td>
              <td>${cszmVO.MQSFZH==null?'':'√' }</td>
              <td colspan="2"></td>
              <td></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="7"></td>
              <td colspan="13">${cszmVO.MQSFZH }</td>
            </tr>
            <tr>
              <td colspan="10"></td>
              <td></td>
              <td colspan="2"></td>
              <td></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="7"></td>
              <td colspan="13"></td>
            </tr>
          </table>
        </div>
        <div class="box-middle-2">
          <table class="box-middle-content">
            <tr>
              <td colspan="3"></td>
              <td colspan="7">${cszmVO.FQXM }</td>
              <td colspan="2"></td>
              <td colspan="2">${cszmVO.FQNL }</td>
              <td colspan="2"></td>
              <td colspan="7">${cszmVO.FQGJ }</td>
              <td></td>
              <td colspan="3">${cszmVO.FQMZ }</td>
              <td colspan="2"></td>
              <td colspan="11"><div class="wrap-box">${cszmVO.FQJZDZ }</div></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="7"></td>
              <td colspan="2"></td>
              <td colspan="2"></td>
              <td colspan="2"></td>
              <td colspan="7"></td>
              <td></td>
              <td colspan="3"></td>
              <td colspan="2"></td>
              <td colspan="11"></td>
            </tr>
            <tr>
              <td colspan="10"></td>
              <td>${cszmVO.FQSFZH==null?'':'√' }</td>
              <td colspan="2"></td>
              <td></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="7"></td>
              <td colspan="13">${cszmVO.FQSFZH }</td>
            </tr>
            <tr>
              <td colspan="10"></td>
              <td></td>
              <td colspan="2"></td>
              <td></td>
              <td colspan="2"></td>
              <td colspan="4"></td>
              <td colspan="7"></td>
              <td colspan="13"></td>
            </tr>
          </table>
        </div>
        <div class="box-bottom-left">
          <table class="box-bottom-left-content">
            <tr>
              <td colspan="5"></td>
              <td colspan="7">${cszmVO.QFJG }</td>
            </tr>
            <tr>
              <td colspan="5"></td>
              <td colspan="7"></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="4">${cszmVO.NNN }</td>
              <td></td>
              <td>${cszmVO.YYY }</td>
              <td></td>
              <td>${cszmVO.RRR }</td>
              <td></td>
            </tr>
            <tr>
              <td colspan="3"></td>
              <td colspan="4"></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </table>
        </div>
        <div class="box-bottom-right">${cszmVO.CSZ }
        </div>
      </div>
    </div>
</body>
 <script type="text/javascript">
  var boxDefualtHeight = 600;
  var boxDefualtWidth = 800;

  $(document)
      .ready(
          function() {
            //设置box宽高
            var windowsWidth = $(window).width();
            var windowsHeight = $(window).height();
            if (windowsWidth < boxDefualtWidth) {
              $("#box-content").width(windowsWidth);
              $("#box-content").height(
                  boxDefualtHeight
                      * (windowsWidth / boxDefualtWidth));
            } else if (windowsWidth >= boxDefualtWidth
                && windowsWidth < boxDefualtWidth * 2) {
              $("#box-content").height(boxDefualtHeight);
              $("#box-content").width(boxDefualtWidth);
            } else if (windowsWidth >= boxDefualtWidth * 2
                && windowsWidth < boxDefualtWidth * 3) {
              $("#box-content").height(boxDefualtHeight * 2);
              $("#box-content").width(boxDefualtWidth * 2);
            } else {
              $("#box-content").height(boxDefualtHeight * 3);
              $("#box-content").width(boxDefualtWidth * 3);
            }

            //设置垂直居中
            if (windowsHeight > $("#box-content").height()) {
              var marginHeight = (windowsHeight - $(
                  "#box-content").height()) / 2;
              $("#box-content").css("margin-top",
                  marginHeight + "px");
            }
          });
</script> 
</html>
