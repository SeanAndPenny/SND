
function chart01(id,fianl,qylx,qylxmc) {
	alert("01")
	  $("#id1").html('');
	    $("#id2").html('');
	    $("#id3").html('');
	   var datas = [];
	    var datass = [];
	    for (var i = 0; i < fianl.length; i++) {
	      datas.push({
	        name:fianl[i].qylxmc
	      })
	      datass.push({
	        name:fianl[i].qylxmc,
	        value:fianl[i].rs
	      })
	      $("#id1").html(fianl[0].rs+'人');
	    $("#id2").html(fianl[1].rs+'人');
	    $("#id3").html(fianl[2].rs+'人');
	    }
	    
  var myChart = echarts.init(document.getElementById(id));
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'shadow'
          }
      },
      series: [
          {
              name: '医保类型人次及消费金额分析',
              type: 'pie',
              hoverOffset: 4,
              center: ["35%", "48%"],
              radius: ['35%', '56%'],
              label: {
                  show: false
              },
              labelLine: {
                  show: false,
                  length: 11,
                  length2: 12
              },
              data: [
                  {
                      value: 10,
                      name: '区内参保',
                      itemStyle: {
                          color: '#88CA6D'
                      },
                  },
                  {
                      value: 17,
                      name: '区外参保',
                      itemStyle: {
                          color: '#0DAEF1'
                      },
                  },
                  {
                      value: 17,
                      name: '异地参保',
                      itemStyle: {
                          color: '#1572D5'
                      },
                  }
              ],
              emphasis: {
                  label: {
                      show: true,
                      fontSize: 18,
                      formatter: function (params) {
                          return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
                      },
                      rich: {
                          a: {
                              fontSize: 15,
                              color: '#333333',
                              padding: [6, 0, 0, 0]
                          }
                      }
                  },
                  labelLine: {
                      show: true,
                      lineStyle: {
                          color: '#000'
                      }
                  }
              }
          }
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart02(id) {
  var myChart = echarts.init(document.getElementById(id));
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'shadow'
          }
      },
      series: [
          {
              name: '机构类型人次及消费金额分析',
              type: 'pie',
              hoverOffset: 4,
              center: ["35%", "48%"],
              radius: ['35%', '56%'],
              label: {
                  show: false
              },
              labelLine: {
                  show: false,
                  length: 11,
                  length2: 12
              },
              data: [
                  {
                      value: 10,
                      name: '医院',
                      itemStyle: {
                          color: '#768BF1'
                      },
                  },
                  {
                      value: 17,
                      name: '药店',
                      itemStyle: {
                          color: '#0DAEF1'
                      },
                  },
                  {
                      value: 17,
                      name: '其他',
                      itemStyle: {
                          color: '#744EBC'
                      },
                  }
              ],
              emphasis: {
                  label: {
                      show: true,
                      fontSize: 18,
                      formatter: function (params) {
                          return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
                      },
                      rich: {
                          a: {
                              fontSize: 15,
                              color: '#333333',
                              padding: [6, 0, 0, 0]
                          }
                      }
                  },
                  labelLine: {
                      show: true,
                      lineStyle: {
                          color: '#000'
                      }
                  }
              }
          }
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart03(id) {
  var myChart = echarts.init(document.getElementById(id));
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'shadow'
          }
      },
      series: [
          {
              name: '级别人次及消费金额分析',
              type: 'pie',
              hoverOffset: 4,
              center: ["35%", "48%"],
              radius: ['35%', '56%'],
              label: {
                  show: false
              },
              labelLine: {
                  show: false,
                  length: 11,
                  length2: 12
              },
              data: [
                  {
                      value: 10,
                      name: '一级综合',
                      itemStyle: {
                          color: '#88CA6D'
                      },
                  },
                  {
                      value: 17,
                      name: '一级专科',
                      itemStyle: {
                          color: '#3AA873'
                      },
                  },
                  {
                      value: 10,
                      name: '二级综合',
                      itemStyle: {
                          color: '#008B72'
                      },
                  },
                  {
                      value: 17,
                      name: '二级专科',
                      itemStyle: {
                          color: '#2DC6F2'
                      },
                  },
                  {
                      value: 10,
                      name: '三级综合',
                      itemStyle: {
                          color: '#0DAEF1'
                      },
                  },
                  {
                      value: 17,
                      name: '三级专科',
                      itemStyle: {
                          color: '#1572D5'
                      },
                  },
                  {
                      value: 17,
                      name: '无级',
                      itemStyle: {
                          color: '#3140B1'
                      },
                  }
              ],
              emphasis: {
                  label: {
                      show: true,
                      fontSize: 18,
                      formatter: function (params) {
                          return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
                      },
                      rich: {
                          a: {
                              fontSize: 15,
                              color: '#333333',
                              padding: [6, 0, 0, 0]
                          }
                      }
                  },
                  labelLine: {
                      show: true,
                      lineStyle: {
                          color: '#000'
                      }
                  }
              }
          }
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart04(id) {
  var myChart = echarts.init(document.getElementById(id));
  var fontColor = '#333';
  var chartData = [
      { name: '苏州大学附属二医院', value: 30 },
      { name: '苏州科技城医院', value: 40 },
      { name: '苏州明基医院', value: 45 },
      { name: '苏州市立医院（北区）', value: 18 },
      { name: '苏州大学附属医院', value: 65 },
      { name: '苏州市立医院（南区）', value: 25 },
      { name: '苏州大学附属三医院', value: 26 }
  ];

  // var xData = ['苏州大学附属二医院','苏州科技城医院','苏州明基医院', '苏州市立医院（北区)','苏州大学附属医院','苏州市立医院（南区）','苏州大学附属三医院'];
  var sData = [];
  var xData = [];

  $.each(chartData, function (index, item) {
      xData.push(item.name);
      sData.push(item.value)
  });

  var lineOption = {
      lineStyle: {
          color: 'rgba(51,51,51,.75)',
          type: 'solid'
      }
  };
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'shadow'
          }
      },
      legend: {
          itemHeight: 12,
          itemWidth: 12,
          right: '4%',
          top: "4%",
          itemGap: 15,
          textStyle: {
              color: "#333333",
              fontSize: 12
          },
      },
      grid: {
          containLabel: true,
          top: '17%',
          right: '4%',
          left: '4%',
          bottom: '6%'
      },
      yAxis: [{
          name: '万人',
          nameGap: 13,
          nameTextStyle: {
              color: fontColor,
              fontSize: 12
          },
          axisLabel: {
              formatter: '{value}',
              color: fontColor,
              textStyle: {
                  fontSize: 12
              }
          },
          axisTick: {
              show: false
          },
          axisLine: lineOption,
          splitLine: {
              show: true,
              lineStyle: {
                  color: '#ededed'
              }
          }
      }],
      xAxis: [{
          type: 'category',
          data: xData,
          axisLine: lineOption,
          boundaryGap: true,
          axisTick: {
              show: false
          },
          axisLabel: {
              margin: 10,
              interval:0,
              color: fontColor,
              textStyle: {
                  fontSize: 12
              },
              formatter:function(params){
                console.log(params);
                var str1 = params.split('');
                str1.splice(4,0,"\n");
                return str1.join('');
              }
          },
          splitLine: {
              show: true,
              lineStyle: {
                  color: '#ededed'
              }
          },
          splitArea: {
              show: false
          }
      }],
      series: [
          {
              name: '人次分布图',
              type: 'bar',
              barWidth: 24,
              data: sData,
              stack: true,
              itemStyle: {
                  color: '#4D9EF9'
              }
          }
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart05(id) {
  var myChart = echarts.init(document.getElementById(id));
  var max = [8000, 8000, 8000, 8000, 8000, 8000]
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'shadow'
          }
      },
      grid: {
          containLabel: true,
          top: '12%',
          right: '9%',
          left: -100,
          bottom: '8%'
      },
      legend: {
          itemWidth: 12,
          itemHeight: 12,
          data: ['金额分布图'],
          top: '4%',
          right: '8%'
      },
      yAxis: [
          {
              type: "category",
              axisLabel: {
                  color: '#333333',
                  interval: 0,
                  margin: 117,
                  align: 'left',
                  textStyle: {
                      fontSize: 12
                  }
              },
              axisTick: {
                  show: false
              },
              axisLine: {
                  show: true,
                  lineStyle: {
                      color: '#D6D6D6',
                  }
              },
              data: ['苏州大学附属二医院', '苏州科技城医院', '苏州明基医院', '苏州市立医院（北区）', '苏州大学附属医院', '苏州大学附属三医院'].reverse(),
              splitArea: {
                  show: false
              },
          }],
      xAxis: [{
          type: 'value',
          name: "万",
          nameGap: 7,
          nameTextStyle: {
              color: '#646464',
              fontSize: 14
          },
          axisLine: {
              show: true,
              lineStyle: {
                  color: '#D6D6D6',
              }
          },
          axisTick: {
              show: false
          },
          axisLabel: {
              margin: 10,
              color: '#000000',
              textStyle: {
                  fontSize: 13
              },
              formatter: function (params) {
                  return (params / 1000).toFixed(0)
              }
          },
          splitLine: {
              show: true,
              lineStyle:{
                type:"dashed"
              }          
          },
      }],
      series: [
          {
              name: '金额分布图',
              type: 'bar',
              data: [6384, 5980, 5865, 4340, 2238, 3148].reverse(),
              barWidth: 14,
              itemStyle: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                  offset: 0,
                  color: '#11B7DB'
              }, {
                  offset: 1,
                  color: '#3EDED7'
              }]),

              },
              label: {
                  show: false,
              }
          },
          {
              name: '',
              type: 'bar',
              data: max,
              barWidth: 14,
              barGap: '-100%',
              itemStyle: {
                  color: 'rgba(90, 184, 235, .1)'
              },
              tooltip: {
                  show: false
              }
          },
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart06(id) {
  var myChart = echarts.init(document.getElementById(id));
  var fontColor = '#333';
  var chartData = [
      { name: '2017年', value: 900000 },
      { name: '2018年', value: 800000 },
      { name: '2019年', value: 750000 },
      { name: '2020年', value: 680000 },
  ];

  var xData = [];
  var sData = [];

  $.each(chartData, function (index, item) {
      xData.push(item.name);
      sData.push(item.value)
  });

  var lineOption = {
      lineStyle: {
          color: 'rgba(219,225,229,.75)',
          type: 'solid'
      }
  };
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'line',
              label: {
                  fontSize: 12
              }
          },
          // formatter: function (params) {
          //     return '人口年龄：' + params[0].axisValue + '<br/>' + params[0].seriesName + '：' + params[0].data + '人<br/>' + params[1].seriesName + '：' + params[1].data + '人'
          // },
          backgroundColor: 'rgba(46, 113, 146, .6)'
      },
      legend: {
          itemHeight: 8,
          itemWidth: 14,
          right: '4%',
          top: "4%",
          itemGap: 20,
          textStyle: {
              color: "#343434",
              fontSize: 13
          },
          data: [
              {
                  name: "总人次",
              },
              {
                  name: "门诊人次",
              },
              {
                  name: "住院人次",
              }
          ]
      },
      grid: {
          containLabel: true,
          top: '17%',
          right: '6%',
          left: '4%',
          bottom: '5%'
      },
      yAxis: [{
          name: '万人',
          nameGap: 10,
          nameTextStyle: {
              color: fontColor,
              fontSize: 12
          },
          axisLabel: {
              color: fontColor,
              fontSize: 12,
              formatter: function (params) {
                  return (params / 10000).toFixed(0)
              }
          },
          axisTick: {
              show: false
          },
          axisLine: lineOption,
          splitLine: {
              show: true,
              lineOption
          }
      }],
      xAxis: [{
          type: 'category',
          data: xData,
          axisLine: lineOption,
          boundaryGap: false,
          axisTick: {
              show: false
          },
          axisLabel: {
              margin: 10,
              color: fontColor,
              textStyle: {
                  fontSize: 12
              }
          },
          splitArea: {
              show: true,
              areaStyle: {
                  color: ['rgba(255,255,255,.01)', 'rgba(237,240,246,.5)']
              }
          }
      }],
      series: [
          {
              name: '总人次',
              type: 'line',
              data: sData,
              symbolSize: 8,
              smooth: true,
              zlevel: 2,
              itemStyle: {
                  color: '#768BF1'
              },
              areaStyle: {
                  color: 'rgba(118, 139, 241,.3)'
              }
          }, {
              name: '门诊人次',
              type: 'line',
              data: [ 220000, 220000, 220000, 422000],
              symbolSize: 8,
              smooth: true,
              zlevel: 2,
              itemStyle: {
                  color: '#00BB61'
              },
              areaStyle: {
                  color: 'rgba(97,168,255,.3)'
              }
          }, {
              name: '住院人次',
              type: 'line',
              data: [330000, 230000, 400300, 600000],
              symbolSize: 8,
              smooth: true,
              zlevel: 2,
              itemStyle: {
                  color: '#3083FF'
              },
              areaStyle: {
                  color: 'rgba(97,168,255,.3)'
              }
          },
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart07(id) {
  var myChart = echarts.init(document.getElementById(id));
  var fontColor = '#333';
  var chartData = [
      { name: '2017年', value: 900000 },
      { name: '2018年', value: 800000 },
      { name: '2019年', value: 750000 },
      { name: '2020年', value: 680000 },
  ];

  var xData = [];
  var sData = [];

  $.each(chartData, function (index, item) {
      xData.push(item.name);
      sData.push(item.value)
  });

  var lineOption = {
      lineStyle: {
          color: 'rgba(219,225,229,.75)',
          type: 'solid'
      }
  };
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'line',
              label: {
                  fontSize: 12
              }
          },
          // formatter: function (params) {
          //     return '人口年龄：' + params[0].axisValue + '<br/>' + params[0].seriesName + '：' + params[0].data + '人<br/>' + params[1].seriesName + '：' + params[1].data + '人'
          // },
          backgroundColor: 'rgba(46, 113, 146, .6)'
      },
      legend: {
          itemHeight: 8,
          itemWidth: 14,
          right: '4%',
          top: "4%",
          itemGap: 20,
          textStyle: {
              color: "#343434",
              fontSize: 13
          },
          data: [
              {
                  name: "总人次",
              },
              {
                  name: "门诊人次",
              },
              {
                  name: "住院人次",
              }
          ]
      },
      grid: {
          containLabel: true,
          top: '17%',
          right: '6%',
          left: '4%',
          bottom: '5%'
      },
      yAxis: [{
          name: '万人',
          nameGap: 10,
          nameTextStyle: {
              color: fontColor,
              fontSize: 12
          },
          axisLabel: {
              color: fontColor,
              fontSize: 12,
              formatter: function (params) {
                  return (params / 10000).toFixed(0)
              }
          },
          axisTick: {
              show: false
          },
          axisLine: lineOption,
          splitLine: {
              show: true,
              lineOption
          }
      }],
      xAxis: [{
          type: 'category',
          data: xData,
          axisLine: lineOption,
          boundaryGap: false,
          axisTick: {
              show: false
          },
          axisLabel: {
              margin: 10,
              color: fontColor,
              textStyle: {
                  fontSize: 12
              }
          },
          splitArea: {
              show: true,
              areaStyle: {
                  color: ['rgba(255,255,255,.01)', 'rgba(237,240,246,.5)']
              }
          }
      }],
      series: [
          {
              name: '总人次',
              type: 'line',
              data: sData,
              symbolSize: 8,
              smooth: true,
              zlevel: 2,
              itemStyle: {
                  color: 'rgba(13, 174, 241, 1)'
              },
              areaStyle: {
                  color: 'rgba(13, 174, 241,.3)'
              }
          }, {
              name: '门诊人次',
              type: 'line',
              data: [ 220000, 220000, 220000, 422000],
              symbolSize: 8,
              smooth: true,
              zlevel: 2,
              itemStyle: {
                  color: 'rgba(38, 130, 0, 1)'
              },
              areaStyle: {
                  color: 'rgba(38, 130, 0, .3)'
              }
          }, {
              name: '住院人次',
              type: 'line',
              data: [330000, 230000, 400300, 600000],
              symbolSize: 8,
              smooth: true,
              zlevel: 2,
              itemStyle: {
                  color: 'rgba(21, 114, 213, 1)'
              },
              areaStyle: {
                  color: 'rgba(21, 114, 213, .3)'
              }
          },
      ]
  };
  myChart.setOption(option)
  return myChart
};


$(function () {
  var chartInit01 = chart01('chart01');
  var chartInit01bf = chart01('chart01bf');
  var chartInit02 = chart02('chart02');
  var chartInit02bf = chart02('chart02bf');
  var chartInit03 = chart03('chart03');
  var chartInit03bf = chart03('chart03bf');
  var chartInit04 = chart04('chart04');
  var chartInit04bf = chart04('chart04bf');
  var chartInit04bf2 = chart04('chart04bf2');
  var chartInit05 = chart05('chart05');
  var chartInit06 = chart06('chart06');
  var chartInit07 = chart07('chart07');
  var chartInit08 = chart05('chart08');

  $(".mode .tabTop span").click(function(){
    $(this).parent().find('span').removeClass("active");
    $(this).addClass('active');
    var index = $(this).index();
    console.log(index);
    $(this).parent().parent().parent().parent().find(".part-content").hide();
    $(this).parent().parent().parent().parent().find(".part-content").eq(index).show();
    chartInit01.resize();
    chartInit01bf.resize();
    chartInit02.resize();
    chartInit02bf.resize();
    chartInit03.resize();
    chartInit03bf.resize();
    chartInit04.resize();
    chartInit04bf.resize();
    chartInit04bf2.resize();
    chartInit05.resize();
    chartInit08.resize();
  })

  var swiper = new Swiper('.mode05 .swiper-container', {
    pagination: {
      el: '.mode05 .swiper-pagination',
    },
    on: {
    resize: function(){
      chartInit05.resize();
      chartInit08.resize();
    }, 
  },
  });

  function gl(el){
    //默认其中一个高亮
    el.dispatchAction({
    type: 'highlight',
    dataIndex: 0,
  });

  //离开其中一个模块高亮取消，默认第一块高亮
  el.on("mouseout", function (params) {
    console.log(params);
    el.dispatchAction({
      type: 'downplay',
      dataIndex: params.dataIndex,
    });
    el.dispatchAction({
      type: 'highlight',
      dataIndex: 0,
    });
  });
  //鼠标移入此模块高亮，之前的模块高亮取消
  el.on("mouseover", function (params) {
    el.dispatchAction({
      type: 'highlight',
      dataIndex: params.dataIndex,
    });
    el.dispatchAction({
      type: 'downplay',
      dataIndex: params.dataIndex == 0 ? 1 : 0,
    });
  });
  };

  gl(chartInit01);
  gl(chartInit02);
  gl(chartInit03);

  $(window).resize(function () {
      chartInit01.resize();
      chartInit01bf.resize();
      chartInit02.resize();
      chartInit03.resize();
      chartInit04.resize();
      chartInit05.resize();
      chartInit06.resize();
      chartInit07.resize();
  });

});