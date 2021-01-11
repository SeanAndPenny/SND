
function chart01(id) {
  var myChart = echarts.init(document.getElementById(id));
  var option = {
      tooltip: {
          trigger: 'item',
          axisPointer: {
              type: 'shadow'
          }
      },
      series: [
          {
              name: '急救患者分诊级别图',
              type: 'pie',
              hoverOffset: 6,
              center: ["30%", "47%"],
              radius: ['41%', '64%'],
              label: {
                  show: false
              },
              emphasis:{
                label:{
                  show:true,
                  formatter:function(params){
                    return '{a|'+params.name+'}'+'\n'+'{b|'+params.value+'}'+'{c|人次}'
                  },
                  lineHeight:22,
                  rich:{
                    a:{
                      color:'#333',
                      fontSize:15
                    },
                    b:{
                      fontSize:18
                    },
                    c:{
                      fontSize:14
                    }
                  }
                },
                labelLine:{
                  show:true,
                  lineStyle:{
                    color:'#333'
                  }
                }
              },
              data: [
                  {
                      value: 80960,
                      name: '一级分诊',
                      itemStyle: {
                          color: '#88CA6D'
                      },
                  },
                  {
                      value: 70980,
                      name: '二级分诊',
                      itemStyle: {
                          color: '#3AA873'
                      },
                  },
                  {
                      value: 63890,
                      name: '三级分诊',
                      itemStyle: {
                          color: '#0DAEF1'
                      },
                  },
                  {
                      value: 60900,
                      name: '四级分诊',
                      itemStyle: {
                          color: '#3992F0'
                      },
                  }
              ],
              labelLine: {
                  show: false,
                  length: 15,
                  length2: 16
              }
          }
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart02(id) {
  var myChart = echarts.init(document.getElementById(id));
  var fontColor = '#343434';
  var chartData = [
      { name: '2014年', value: 2300 },
      { name: '2015年', value: 2000 },
      { name: '2016年', value: 1900 },
      { name: '2017年', value: 2200 },
      { name: '2018年', value: 2120 },
      { name: '2019年', value: 1800 },
      { name: '2020年', value: 1600 }
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
              },
              lineStyle:{
                  color:"#3C3E7E",
                  width:1
              }
          },
          backgroundColor: 'rgba(46, 113, 146, .6)'
      },
      legend: {
          itemHeight: 8,
          itemWidth: 14,
          right: '3%',
          top: "4%",
          itemGap: 20,
          textStyle: {
              color: "#343434",
              fontSize: 12
          },
          data: [
              {
                name: "分诊人次",
              }
          ]
      },
      grid: {
          containLabel: true,
          top: '17%',
          right: '6%',
          left: '3%',
          bottom: '6%'
      },
      yAxis: [{
          name: '人',
          nameGap: 10,
          nameTextStyle: {
              color: fontColor,
              fontSize: 12
          },
          axisLabel: {
              color: fontColor,
              fontSize: 12
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
              name: '分诊人次',
              type: 'line',
              data: sData,
              symbolSize: 8,
              smooth: true,
              zlevel: 2,
              itemStyle: {
                  color: 'rgba(12,190,104,1)'
              },
              areaStyle: {
                  color: 'rgba(12,190,104,.2)'
              }
          }
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart03(id) {
  var myChart = echarts.init(document.getElementById(id));
  var data1 = [99, 67, 96, 94, 93, 92, 60, 38, 27, 36];
  var data2 = [99, 97, 46, 54, 93, 92, 50, 48, 37, 46];

  var dataShadow1 = [];
  var dataShadow2 = [];
  var xMax1 = 110;
  var xMax2 = 110;
  for (var i = 0; i < data1.length; i++) {
      dataShadow1.push({
          value: xMax1
      });
  };
  for (var i = 0; i < data2.length; i++) {
      dataShadow2.push({
          value: xMax2
      });
  };

  var lineOption = {
      lineStyle: {
          color: '#e4e9ec',
          type: 'solid'
      }
  }
  var option = {
      tooltip: {
          trigger: 'axis',
          axisPointer: {            // 坐标轴指示器，坐标轴触发有效
              type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
          }
      },
      grid: [
          {
              left: '6%',
              right: '54%',
              bottom: '10%',
              top: "6%",
              containLabel: false
          },
          {
              left: '58%',
              right: '6%',
              bottom: '10%',
              top: "6%",
              containLabel: false
          }
      ],
      xAxis: [
          {
              type: 'value',
              inverse: true,
              max:xMax1,
              axisTick: {
                  show: false
              },
              axisLine: {
                  show: false,
                  lineStyle: {
                      color: "#abdcff"
                  }
              },
              splitLine: {
                show: true,
                lineStyle: {
                    color: "#e6eaed",
                }
              },
              axisLabel: {
                  show: true,
                  fontSize: 12,
                  color: '#333',
              },
          },
          {
              type: 'value',
              gridIndex: 1,
              max:xMax2,
              axisTick: {
                  show: false
              },
              axisLine: {
                  show: false,
                  lineStyle: {
                      color: "#abdcff"
                  }
              },
              axisLabel: {
                  show: true,
                  fontSize: 12,
                  color: '#333',
              },
              splitLine: {
                  show: true,
                  lineStyle: {
                      color: "#e6eaed",
                  }
              },
          }
      ],
      yAxis: [
          {
              type: 'category',
              position: 'right',
              axisTick: {
                  show: false,
              },
              axisLine: {
                  show: false,
                  lineStyle: {
                      color: "#abdcff"
                  }
              },
              axisLabel: {
                  show: false,
                  interval: 0,
                  fontSize: 12,
                  color: '#333',
              },
              data: ["1-10", "10-20", "20-30", "30-40", "40-50", "50-60", "60-70", "70-80", "80-90", "90-100"].reverse()
          },
          {
              type: 'category',
              // position: "left",
              gridIndex: 1,
              interval: 0,
              axisTick: {
                  show: false,
              },
              axisLine: {
                  show: false,
                  lineStyle: {
                      color: "#abdcff"
                  }
              },
              axisLabel: {
                  show: false,
                  fontSize: 12,
                  color: '#333',
              },
              data: ["1-10", "10-20", "20-30", "30-40", "40-50", "50-60", "60-70", "70-80", "80-90", "90-100"].reverse()
          }
      ],
      series: [
          {
              type: 'bar',
              barWidth: 10,
              itemStyle: {
                color: '#f6f7fa'
              },
              data: dataShadow1
          },
          {
              name: '男',
              type: 'bar',
              barGap: '-100%',
              barWidth: 10,
              label: {
                  show: false,
                  color: "#fff",
                  position: "insideLeft",
                  fontSize: 12
              },
              itemStyle: {
                  color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                    offset: 0,
                    color: '#8ad1e6'
                  }, {
                      offset: 1,
                      color: '#28bbc1'
                  }]),
                  barBorderRadius: [2,0,0,2],
              },
              data: data1
          },
          {
              type: 'bar',
              barWidth: 10,
              xAxisIndex: 1,
              yAxisIndex: 1,
              itemStyle: {
                  color: "#f6f7fa",
              },
              data: dataShadow2
          },
          {
              name: '女',
              type: 'bar',
              barGap: '-100%',
              xAxisIndex: 1,
              yAxisIndex: 1,
              barWidth: 10,
              label: {
                  show: false,
                  color: "#fff",
                  position: "insideRight",
                  fontSize: 12
              },
              itemStyle: {
                  color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                    offset: 0,
                    color: '#fd767f'
                  }, {
                      offset: 1,
                      color: '#f8a7c7'
                  }]),
                  barBorderRadius: [0,2,2,0],
              },
              data: data2
          }
      ]
  };
  myChart.setOption(option)
  return myChart
};

function chart04(id) {
    var myChart = echarts.init(document.getElementById(id));
    var max = 40;
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            itemWidth: 12,
            itemHeight: 12,
            data: ['当月出车量'],
            top: '5',
            left: '170'
        },
        grid: {
            containLabel: true,
            top: '40',
            right: '120',
            left: -100,
            bottom: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    color: '#333333',
                    interval: 0,
                    margin: 157,
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
            /*  name: "万",
              nameGap: 7,
              nameTextStyle: {
                  color: '#646464',
                  fontSize: 14
              },*/
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
                // formatter: function (params) {
                //     return (params / 1000).toFixed(0)
                // }
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
                name: '当月出车量',
                type: 'bar',
                data: [31, 21, 25, 16, 33, 13].reverse(),
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
                    position:"right",
                    show: true,
                    color:'#0096b0',
                    fontSize:14,
                    formatter(params){
                        return params.value+'人次'
                    }
                }
            },
            {
                name: '',
                type: 'bar',
                data: [
                    {
                        value:max,
                        grade:13.33,
                    },
                    {
                        value:max,
                        grade:10.34,
                    },
                    {
                        value:max,
                        grade:16.03,
                    },
                    {
                        value:max,
                        grade:10.26,
                    },
                    {
                        value:max,
                        grade:16.09,
                    },
                    {
                        value:max,
                        grade:12.20,
                    }
                ],
                barWidth: 14,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(90, 184, 235, .1)'
                },
                label: {
                    position:"right",
                    show: true,
                    color:'#0096b0',
                    fontSize:14,
                    formatter(params){
                        return '{a|'+params.data.grade+'分}'
                    },
                    rich:{
                        a:{
                            width:90,
                            align:"center",
                            color:'#0096b0',
                            fontSize:14,
                        }
                    }
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
function chart05(id) {
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333';
    var chartData = [
        { name: '动物咬伤', value: 300 },
        { name: '呼吸道感染', value: 400 },
        { name: '咳嗽', value: 450 },
        { name: '开药', value: 180 },
        { name: '腹痛', value: 650 },
        { name: '上肢撕裂上伤擦伤', value: 125 },
        { name: '上肢钝伤', value: 260 },
        { name: '下肢钝伤', value: 360 },
        { name: '下肢关节扭伤', value: 240 },
        { name: '恶心呕吐', value: 260 },
        { name: '腹泻', value: 200 },
        { name: '下肢撕裂伤擦伤', value: 160 },
        { name: '头部钝伤', value: 260 },
        { name: '眩晕/头晕', value: 460 },
    ];

    var xData = [];
    var sData = [];

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
            trigger: 'none',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            itemHeight: 12,
            itemWidth: 12,
            right: '25',
            top: "10",
            itemGap: 15,
            textStyle: {
                color: "#333333",
                fontSize: 12
            },
            data: [
                {
                    name: "人次",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '40',
            right: '60',
            left: '15',
            bottom: '20'
        },
        yAxis: [{
            name: '人',
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
            name: '字典\n项名',
            nameGap: 13,
            nameTextStyle: {
                color: fontColor,
                fontSize: 12
            },
            type: 'category',
            data: xData,
            axisLine: lineOption,
            boundaryGap: true,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: fontColor,
                interval:0,
                formatter: function (params) {
                    var data = params.split('');
                    if(data.length > 5){
                        var result = [];
                        for(var i=0;i<data.length;i+=5){
                            result.push(data.slice(i,i+5));
                        };
                        var chartName ='';
                        for(var j=0;j<result.length;j++){
                            chartName+=result[j].join('')
                            if(j != result.length-1){
                                chartName+='\n'
                            }
                        };
                        return  chartName;
                    }else{
                        return  params;
                    }
                },
                textStyle: {
                    fontSize: 12
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
                name: '人次',
                type: 'bar',
                barWidth: 24,
                data: sData,
                itemStyle: {
                    color: '#2C87E9'
                },
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.value + '人}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(21, 114, 213, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize:12
                        },
                        b: {
                            width: 5,
                            height: 5,
                            align: 'center',
                            backgroundColor: { image: 'images/small-bg01.png' }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                    }
                },
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};


$(function () {
  var chartInit01 = chart01('chart01');
  var chartInit02 = chart02('chart02');
  var chartInit03 = chart03('chart03');
  var chart04Slider01=chart04('chart04Slider01');
  var chart04Slider02=chart04('chart04Slider02');
  var chartInit05=chart05('chart05');

    new Swiper('#carSwiperSlider', {
        pagination: {
            el: '#carSwiperSlider .swiper-pagination',
        },
        on: {
            resize: function(){
                chart04Slider01.resize();
                chart04Slider02.resize();
            },
        },
    });
  $(window).resize(function () {
      chartInit01.resize();
      chartInit02.resize();
      chartInit03.resize();
      chart04Slider01.resize();
      chart04Slider02.resize();
      chartInit05.resize();
  });

});